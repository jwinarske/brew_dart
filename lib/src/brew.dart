import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'cli/brew_cli.dart';
import 'cli/brew_process_result.dart';
import 'exceptions.dart';
import 'models/batch_result.dart';
import 'models/brew_config.dart';
import 'models/brewfile.dart';
import 'models/bundle_result.dart';
import 'models/dependency.dart';
import 'models/doctor_report.dart';
import 'models/installed_package.dart';
import 'models/outdated_package.dart';
import 'models/package_info.dart';
import 'models/search_result.dart';
import 'models/service.dart';
import 'models/tap.dart';
import 'models/update_result.dart';
import 'parsers/brewfile_parser.dart';
import 'parsers/config_parser.dart';
import 'parsers/doctor_parser.dart';
import 'parsers/json_v2_parser.dart';
import 'parsers/list_parser.dart';
import 'parsers/search_parser.dart';
import 'parsers/services_parser.dart';

/// Unified facade for interacting with Homebrew.
///
/// Provides a single entry point for all brew operations:
/// ```dart
/// final brew = Brew();
/// if (await brew.isInstalled()) {
///   final version = await brew.version();
///   print('Homebrew $version');
/// }
/// ```
class Brew {
  final BrewCli _cli;
  final ConfigParser _configParser;
  final DoctorParser _doctorParser;
  final JsonV2Parser _jsonV2Parser;
  final SearchParser _searchParser;
  final ListParser _listParser;
  final ServicesParser _servicesParser;
  final BrewfileParser _brewfileParser;

  Brew({
    BrewCli? cli,
    ConfigParser configParser = const ConfigParser(),
    DoctorParser doctorParser = const DoctorParser(),
    JsonV2Parser jsonV2Parser = const JsonV2Parser(),
    SearchParser searchParser = const SearchParser(),
    ListParser listParser = const ListParser(),
    ServicesParser servicesParser = const ServicesParser(),
    BrewfileParser brewfileParser = const BrewfileParser(),
  }) : _cli = cli ?? BrewCli(),
       _configParser = configParser,
       _doctorParser = doctorParser,
       _jsonV2Parser = jsonV2Parser,
       _searchParser = searchParser,
       _listParser = listParser,
       _servicesParser = servicesParser,
       _brewfileParser = brewfileParser;

  /// The underlying CLI runner, exposed for advanced use cases.
  BrewCli get cli => _cli;

  /// Check if brew is installed and accessible.
  Future<bool> isInstalled() async {
    try {
      final result = await _cli.run([
        '--version',
      ], timeout: const Duration(seconds: 10));
      return result.isSuccess;
    } on BrewNotInstalledException {
      return false;
    } on Exception {
      return false;
    }
  }

  /// Get the brew version string (e.g. "4.2.0").
  ///
  /// Throws [BrewNotInstalledException] if brew is not available.
  Future<String> version() async {
    final result = await _cli.run([
      '--version',
    ], timeout: const Duration(seconds: 10));
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    // Output is like "Homebrew 4.2.0\nHomebrew/homebrew-core ..."
    // Extract just the version number from the first line.
    final firstLine = result.stdout.split('\n').first.trim();
    final match = RegExp(r'Homebrew\s+(\S+)').firstMatch(firstLine);
    return match?.group(1) ?? firstLine;
  }

  /// Parsed `brew config` output.
  ///
  /// Returns a [BrewConfig] with structured access to Homebrew's
  /// configuration, including prefix, cellar path, and version info.
  Future<BrewConfig> config() async {
    final result = await _cli.run(['config']);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return _configParser.parse(result.stdout);
  }

  /// Parsed `brew doctor` output — list of warnings/errors.
  ///
  /// Returns a [DoctorReport] indicating whether the system is healthy
  /// and listing any diagnostics found.
  ///
  /// Note: `brew doctor` returns exit code 1 when there are warnings,
  /// so we don't throw on non-zero exit code here.
  Future<DoctorReport> doctor() async {
    final result = await _cli.run([
      'doctor',
    ], timeout: const Duration(minutes: 2));
    // brew doctor returns exit code 1 for warnings, which is normal.
    return _doctorParser.parse(result.stdout);
  }

  /// Homebrew prefix path (e.g. `/opt/homebrew`, `/usr/local`).
  Future<String> prefix() async {
    final result = await _cli.run([
      '--prefix',
    ], timeout: const Duration(seconds: 10));
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return result.stdout.trim();
  }

  /// Homebrew Cellar path (e.g. `/opt/homebrew/Cellar`).
  Future<String> cellarPath() async {
    final result = await _cli.run([
      '--cellar',
    ], timeout: const Duration(seconds: 10));
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return result.stdout.trim();
  }

  // ---------------------------------------------------------------------------
  // Phase 2: Query & Info
  // ---------------------------------------------------------------------------

  /// Get detailed info for a single formula or cask.
  ///
  /// Uses `brew info --json=v2 <name>`.
  /// Throws [PackageNotFoundException] if the package is not found.
  Future<PackageInfo> info(String name) async {
    final results = await infoMultiple([name]);
    if (results.isEmpty) {
      throw PackageNotFoundException(name);
    }
    return results.first;
  }

  /// Get detailed info for one or more formulae/casks.
  ///
  /// Uses `brew info --json=v2 <names...>`.
  Future<List<PackageInfo>> infoMultiple(List<String> names) async {
    final json = await _cli.runJson(['info', ...names]);
    return _jsonV2Parser.parseInfo(json);
  }

  /// Get info for ALL installed packages.
  ///
  /// Uses `brew info --json=v2 --installed`.
  Future<List<InstalledPackage>> installed() async {
    final json = await _cli.runJson(['info', '--installed']);
    return _jsonV2Parser.parseInstalled(json);
  }

  /// Get outdated packages with old/new version info.
  ///
  /// Uses `brew outdated --json=v2`.
  Future<List<OutdatedPackage>> outdated({
    bool cask = false,
    bool greedy = false,
  }) async {
    final args = <String>[
      'outdated',
      if (cask) '--cask',
      if (greedy) '--greedy',
    ];
    final json = await _cli.runJson(args);
    return _jsonV2Parser.parseOutdated(json);
  }

  /// Search for packages by name.
  ///
  /// Uses `brew search <query>`. This command does not support `--json`,
  /// so the text output is parsed.
  Future<SearchResult> search(
    String query, {
    bool formulae = true,
    bool casks = true,
  }) async {
    final args = <String>[
      'search',
      if (!formulae) '--cask',
      if (!casks) '--formula',
      query,
    ];
    final result = await _cli.run(args);
    if (!result.isSuccess) {
      // brew search returns exit code 1 when nothing is found
      if (result.stderr.contains('No formulae or casks found')) {
        return const SearchResult();
      }
      throw BrewCommandException.fromResult(result);
    }
    return _searchParser.parse(result.stdout);
  }

  // ---------------------------------------------------------------------------
  // Phase 3: Package Management
  // ---------------------------------------------------------------------------

  /// Install a single formula or cask.
  ///
  /// Uses `brew install [--cask] [--force] <package>`.
  Future<InstallResult> install(
    String package, {
    bool cask = false,
    bool force = false,
    bool quiet = false,
    bool verbose = false,
    List<String>? options,
  }) async {
    final args = <String>[
      'install',
      if (cask) '--cask',
      if (force) '--force',
      if (quiet) '--quiet',
      if (verbose) '--verbose',
      ...?options,
      package,
    ];
    final stopwatch = Stopwatch()..start();
    final result = await _cli.run(args);
    stopwatch.stop();
    return InstallResult(
      package: package,
      success: result.isSuccess,
      exitCode: result.exitCode,
      output: result.stdout,
      errorMessage: result.isSuccess ? null : result.stderr,
      elapsed: stopwatch.elapsed,
    );
  }

  /// Batch install multiple packages.
  ///
  /// Runs sequentially by default. Set [parallel] to `true` for concurrent
  /// installs with the given [concurrency] limit.
  Future<BatchResult<InstallResult>> installAll(
    List<String> packages, {
    bool cask = false,
    bool force = false,
    bool parallel = false,
    int concurrency = 3,
    void Function(String package, InstallResult result)? onEach,
  }) async {
    final stopwatch = Stopwatch()..start();
    final results = <InstallResult>[];

    if (parallel) {
      results.addAll(
        await _runParallel(
          packages,
          concurrency,
          (pkg) => install(pkg, cask: cask, force: force),
          onEach,
        ),
      );
    } else {
      for (final pkg in packages) {
        final result = await install(pkg, cask: cask, force: force);
        results.add(result);
        onEach?.call(pkg, result);
      }
    }

    stopwatch.stop();
    final succeeded = results.where((r) => r.success).length;
    return BatchResult(
      total: packages.length,
      succeeded: succeeded,
      failed: packages.length - succeeded,
      results: results,
      elapsed: stopwatch.elapsed,
    );
  }

  /// Stream install output in real-time for progress reporting.
  ///
  /// Uses `Process.start` to stream stdout/stderr line by line.
  Stream<ProcessOutput> installStream(String package, {bool cask = false}) {
    return _cli.stream(['install', if (cask) '--cask', package]);
  }

  /// Uninstall a single package.
  ///
  /// Uses `brew uninstall [--cask] [--force] [--ignore-dependencies] <package>`.
  Future<UninstallResult> uninstall(
    String package, {
    bool cask = false,
    bool force = false,
    bool ignoreDependencies = false,
  }) async {
    final args = <String>[
      'uninstall',
      if (cask) '--cask',
      if (force) '--force',
      if (ignoreDependencies) '--ignore-dependencies',
      package,
    ];
    final stopwatch = Stopwatch()..start();
    final result = await _cli.run(args);
    stopwatch.stop();
    return UninstallResult(
      package: package,
      success: result.isSuccess,
      exitCode: result.exitCode,
      output: result.stdout,
      errorMessage: result.isSuccess ? null : result.stderr,
      elapsed: stopwatch.elapsed,
    );
  }

  /// Batch uninstall multiple packages.
  Future<BatchResult<UninstallResult>> uninstallAll(
    List<String> packages, {
    bool cask = false,
    void Function(String package, UninstallResult result)? onEach,
  }) async {
    final stopwatch = Stopwatch()..start();
    final results = <UninstallResult>[];

    for (final pkg in packages) {
      final result = await uninstall(pkg, cask: cask);
      results.add(result);
      onEach?.call(pkg, result);
    }

    stopwatch.stop();
    final succeeded = results.where((r) => r.success).length;
    return BatchResult(
      total: packages.length,
      succeeded: succeeded,
      failed: packages.length - succeeded,
      results: results,
      elapsed: stopwatch.elapsed,
    );
  }

  /// Remove old versions and cached downloads.
  ///
  /// Uses `brew cleanup [--dry-run] [-s] [<package>]`.
  Future<CleanupResult> cleanup({
    String? package,
    bool dryRun = false,
    bool scrub = false,
  }) async {
    final args = <String>[
      'cleanup',
      if (dryRun) '--dry-run',
      if (scrub) '-s',
      ?package,
    ];
    final stopwatch = Stopwatch()..start();
    final result = await _cli.run(args);
    stopwatch.stop();
    return CleanupResult(
      success: result.isSuccess,
      exitCode: result.exitCode,
      output: result.stdout,
      errorMessage: result.isSuccess ? null : result.stderr,
      elapsed: stopwatch.elapsed,
    );
  }

  /// Upgrade a single package.
  ///
  /// Uses `brew upgrade [--cask] <package>`.
  Future<UpgradeResult> upgrade(String package, {bool cask = false}) async {
    final args = <String>['upgrade', if (cask) '--cask', package];
    final stopwatch = Stopwatch()..start();
    final result = await _cli.run(args);
    stopwatch.stop();
    return UpgradeResult(
      package: package,
      success: result.isSuccess,
      exitCode: result.exitCode,
      output: result.stdout,
      errorMessage: result.isSuccess ? null : result.stderr,
      elapsed: stopwatch.elapsed,
    );
  }

  /// Upgrade all outdated packages.
  ///
  /// Uses `brew upgrade [--cask] [--greedy]`, then reports per-package results
  /// by diffing the outdated list before and after.
  Future<BatchResult<UpgradeResult>> upgradeAll({
    bool cask = false,
    bool greedy = false,
    void Function(String package, UpgradeResult result)? onEach,
  }) async {
    // Get outdated list first so we can report per-package
    final outdatedPkgs = await outdated(cask: cask, greedy: greedy);
    if (outdatedPkgs.isEmpty) {
      return const BatchResult(
        total: 0,
        succeeded: 0,
        failed: 0,
        results: [],
        elapsed: Duration.zero,
      );
    }

    final stopwatch = Stopwatch()..start();
    final results = <UpgradeResult>[];

    for (final pkg in outdatedPkgs) {
      final result = await upgrade(pkg.name, cask: pkg.isCask);
      results.add(result);
      onEach?.call(pkg.name, result);
    }

    stopwatch.stop();
    final succeeded = results.where((r) => r.success).length;
    return BatchResult(
      total: outdatedPkgs.length,
      succeeded: succeeded,
      failed: outdatedPkgs.length - succeeded,
      results: results,
      elapsed: stopwatch.elapsed,
    );
  }

  /// Stream upgrade output in real-time.
  Stream<ProcessOutput> upgradeStream(String package, {bool cask = false}) {
    return _cli.stream(['upgrade', if (cask) '--cask', package]);
  }

  /// Fast list of installed package names via `brew list`.
  ///
  /// Returns just the names, no version or dependency info.
  Future<List<String>> listNames({bool cask = false}) async {
    final args = <String>[
      'list',
      if (cask) '--cask',
      '-1', // one name per line
    ];
    final result = await _cli.run(args);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return _listParser.parseNames(result.stdout);
  }

  /// Rich list of installed packages via `brew info --json=v2 --installed`.
  ///
  /// Slower than [listNames] but includes versions, deps, paths, etc.
  /// Optionally filter to only formulae or only casks.
  Future<List<InstalledPackage>> listInstalled({bool? cask}) async {
    final pkgs = await installed();
    if (cask == null) return pkgs;
    return pkgs.where((p) => cask ? p.isCask : p.isFormula).toList();
  }

  /// Quick check if a specific package is installed.
  ///
  /// Uses `brew list` which is faster than `brew info --json=v2`.
  Future<bool> isPackageInstalled(String name, {bool cask = false}) async {
    final names = await listNames(cask: cask);
    return names.contains(name);
  }

  // ---------------------------------------------------------------------------
  // Phase 4: Dependency & Tap Management
  // ---------------------------------------------------------------------------

  /// Show dependencies for a formula.
  ///
  /// Uses `brew deps [--tree] [--installed] [--include-build]
  /// [--include-optional] [--include-test] `<formula>`.
  Future<List<String>> deps(
    String formula, {
    bool tree = false,
    bool installed = false,
    bool includeAll = false,
  }) async {
    final args = <String>[
      'deps',
      if (tree) '--tree',
      if (installed) '--installed',
      if (includeAll) ...[
        '--include-build',
        '--include-optional',
        '--include-test',
      ],
      formula,
    ];
    final result = await _cli.run(args);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return result.stdout
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty)
        .toList();
  }

  /// Show which installed packages depend on this one.
  ///
  /// Uses `brew uses [--installed] [--recursive] <formula>`.
  Future<List<String>> uses(
    String formula, {
    bool installed = true,
    bool recursive = false,
  }) async {
    final args = <String>[
      'uses',
      if (installed) '--installed',
      if (recursive) '--recursive',
      formula,
    ];
    final result = await _cli.run(args);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return result.stdout
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty)
        .toList();
  }

  /// Show broken/missing dependencies.
  ///
  /// Uses `brew missing`. Output format: `formula: dep1 dep2 ...`
  Future<List<MissingDependency>> missing() async {
    final result = await _cli.run(['missing']);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    final output = result.stdout.trim();
    if (output.isEmpty) return [];

    return output.split('\n').where((l) => l.trim().isNotEmpty).map((line) {
      final colonIndex = line.indexOf(':');
      if (colonIndex == -1) {
        return MissingDependency(formula: line.trim(), missingDeps: []);
      }
      final formula = line.substring(0, colonIndex).trim();
      final deps = line
          .substring(colonIndex + 1)
          .trim()
          .split(RegExp(r'\s+'))
          .where((d) => d.isNotEmpty)
          .toList();
      return MissingDependency(formula: formula, missingDeps: deps);
    }).toList();
  }

  /// List all taps with details.
  ///
  /// Uses `brew tap-info --json --installed` (JSON-backed).
  Future<List<Tap>> taps() async {
    final result = await _cli.run(['tap-info', '--json', '--installed']);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    final json = jsonDecode(result.stdout) as List<dynamic>;
    return json.map((e) => Tap.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Add a tap.
  ///
  /// Uses `brew tap <user/repo> [<url>]`.
  Future<void> tap(String name, {String? url}) async {
    final args = <String>['tap', name, ?url];
    final result = await _cli.run(args);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
  }

  /// Remove a tap.
  ///
  /// Uses `brew untap [--force] <user/repo>`.
  Future<void> untap(String name, {bool force = false}) async {
    final args = <String>['untap', if (force) '--force', name];
    final result = await _cli.run(args);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
  }

  // ---------------------------------------------------------------------------
  // Phase 5: System & Maintenance
  // ---------------------------------------------------------------------------

  /// Update Homebrew itself.
  ///
  /// Uses `brew update [--force]`.
  Future<UpdateResult> update({bool force = false}) async {
    final args = <String>['update', if (force) '--force'];
    final stopwatch = Stopwatch()..start();
    final result = await _cli.run(
      args,
      timeout: const Duration(minutes: 10),
      extraEnv: {'HOMEBREW_NO_AUTO_UPDATE': '0'},
    );
    stopwatch.stop();
    return UpdateResult(
      success: result.isSuccess,
      exitCode: result.exitCode,
      output: result.stdout,
      errorMessage: result.isSuccess ? null : result.stderr,
      elapsed: stopwatch.elapsed,
    );
  }

  /// Stream `brew update` output in real-time.
  Stream<ProcessOutput> updateStream({bool force = false}) {
    return _cli.stream(
      ['update', if (force) '--force'],
      extraEnv: {'HOMEBREW_NO_AUTO_UPDATE': '0'},
    );
  }

  /// Create symlinks for a formula in the Homebrew prefix.
  ///
  /// Uses `brew link [--overwrite] [--force] <formula>`.
  Future<void> link(
    String formula, {
    bool overwrite = false,
    bool force = false,
  }) async {
    final args = <String>[
      'link',
      if (overwrite) '--overwrite',
      if (force) '--force',
      formula,
    ];
    final result = await _cli.run(args);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
  }

  /// Remove symlinks for a formula from the Homebrew prefix.
  ///
  /// Uses `brew unlink [--dry-run] <formula>`.
  Future<void> unlink(String formula, {bool dryRun = false}) async {
    final args = <String>['unlink', if (dryRun) '--dry-run', formula];
    final result = await _cli.run(args);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
  }

  /// Pin a formula to prevent it from being upgraded.
  ///
  /// Uses `brew pin <formula>`.
  Future<void> pin(String formula) async {
    final result = await _cli.run(['pin', formula]);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
  }

  /// Unpin a formula to allow it to be upgraded again.
  ///
  /// Uses `brew unpin <formula>`.
  Future<void> unpin(String formula) async {
    final result = await _cli.run(['unpin', formula]);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
  }

  /// List all pinned formulae.
  ///
  /// Uses `brew list --pinned`.
  Future<List<String>> pinned() async {
    final result = await _cli.run(['list', '--pinned']);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return result.stdout
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty)
        .toList();
  }

  /// List all Homebrew-managed services.
  ///
  /// Uses `brew services list` (text-parsed).
  Future<List<BrewService>> services() async {
    final result = await _cli.run(['services', 'list']);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return _servicesParser.parse(result.stdout);
  }

  /// Start a Homebrew-managed service.
  ///
  /// Uses `brew services start <name>`.
  Future<void> startService(String name) async {
    final result = await _cli.run(['services', 'start', name]);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
  }

  /// Stop a Homebrew-managed service.
  ///
  /// Uses `brew services stop <name>`.
  Future<void> stopService(String name) async {
    final result = await _cli.run(['services', 'stop', name]);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
  }

  /// Restart a Homebrew-managed service.
  ///
  /// Uses `brew services restart <name>`.
  Future<void> restartService(String name) async {
    final result = await _cli.run(['services', 'restart', name]);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
  }

  // ---------------------------------------------------------------------------
  // Phase 6: Brewfile Support
  // ---------------------------------------------------------------------------

  /// Parse a Brewfile into a list of declarations.
  ///
  /// Reads the file at [path] and parses it into a [Brewfile] model.
  Future<Brewfile> readBrewfile(String path) async {
    final file = File(path);
    final content = await file.readAsString();
    return _brewfileParser.parse(content);
  }

  /// Generate a Brewfile from currently installed packages.
  ///
  /// Uses `brew bundle dump [--file=<path>] [--force]`.
  /// Returns the Brewfile content as a string.
  Future<String> bundleDump({String? file, bool force = false}) async {
    final args = <String>[
      'bundle',
      'dump',
      if (file != null) '--file=$file',
      if (force) '--force',
      // If no file specified, dump to stdout
      if (file == null) '--file=/dev/stdout',
    ];
    final result = await _cli.run(args);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return result.stdout;
  }

  /// Install everything in a Brewfile.
  ///
  /// Uses `brew bundle [--file=<path>] [--verbose]`.
  Future<BundleResult> bundle({String? file, bool verbose = false}) async {
    final args = <String>[
      'bundle',
      if (file != null) '--file=$file',
      if (verbose) '--verbose',
    ];
    final stopwatch = Stopwatch()..start();
    final result = await _cli.run(args, timeout: const Duration(minutes: 30));
    stopwatch.stop();
    return BundleResult(
      success: result.isSuccess,
      exitCode: result.exitCode,
      output: result.stdout,
      errorMessage: result.isSuccess ? null : result.stderr,
      elapsed: stopwatch.elapsed,
    );
  }

  /// Check Brewfile against installed packages.
  ///
  /// Uses `brew bundle check [--file=<path>]`.
  /// Returns a [BundleCheckResult] indicating whether all entries are satisfied.
  Future<BundleCheckResult> bundleCheck({String? file}) async {
    final args = <String>['bundle', 'check', if (file != null) '--file=$file'];
    final result = await _cli.run(args);
    // Exit code 1 means unsatisfied entries, not an error.
    final missing = <String>[];
    if (!result.isSuccess) {
      // Parse lines like "brew install git" or "cask install docker"
      for (final line in result.stdout.split('\n')) {
        final trimmed = line.trim();
        if (trimmed.isNotEmpty &&
            !trimmed.startsWith('The Brewfile') &&
            !trimmed.startsWith('Homebrew Bundle')) {
          missing.add(trimmed);
        }
      }
    }
    return BundleCheckResult(
      satisfied: result.isSuccess,
      exitCode: result.exitCode,
      output: result.stdout,
      missingEntries: missing,
    );
  }

  // ---------------------------------------------------------------------------
  // Internal helpers
  // ---------------------------------------------------------------------------

  /// Run operations in parallel with a concurrency limit.
  Future<List<T>> _runParallel<T>(
    List<String> packages,
    int concurrency,
    Future<T> Function(String package) operation,
    void Function(String package, T result)? onEach,
  ) async {
    final results = <T>[];
    final pending = <Future<void>>[];
    var index = 0;

    Future<void> runNext() async {
      if (index >= packages.length) return;
      final pkg = packages[index++];
      final result = await operation(pkg);
      results.add(result);
      onEach?.call(pkg, result);
      await runNext();
    }

    for (var i = 0; i < concurrency && i < packages.length; i++) {
      pending.add(runNext());
    }

    await Future.wait(pending);
    return results;
  }
}
