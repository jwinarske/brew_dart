import 'dart:async';

import 'cli/brew_cli.dart';
import 'cli/brew_process_result.dart';
import 'exceptions.dart';
import 'models/batch_result.dart';
import 'models/brew_config.dart';
import 'models/doctor_report.dart';
import 'models/installed_package.dart';
import 'models/outdated_package.dart';
import 'models/package_info.dart';
import 'models/search_result.dart';
import 'parsers/config_parser.dart';
import 'parsers/doctor_parser.dart';
import 'parsers/json_v2_parser.dart';
import 'parsers/list_parser.dart';
import 'parsers/search_parser.dart';

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

  Brew({
    BrewCli? cli,
    ConfigParser configParser = const ConfigParser(),
    DoctorParser doctorParser = const DoctorParser(),
    JsonV2Parser jsonV2Parser = const JsonV2Parser(),
    SearchParser searchParser = const SearchParser(),
    ListParser listParser = const ListParser(),
  })  : _cli = cli ?? BrewCli(),
        _configParser = configParser,
        _doctorParser = doctorParser,
        _jsonV2Parser = jsonV2Parser,
        _searchParser = searchParser,
        _listParser = listParser;

  /// The underlying CLI runner, exposed for advanced use cases.
  BrewCli get cli => _cli;

  /// Check if brew is installed and accessible.
  Future<bool> isInstalled() async {
    try {
      final result = await _cli.run(
        ['--version'],
        timeout: const Duration(seconds: 10),
      );
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
    final result = await _cli.run(
      ['--version'],
      timeout: const Duration(seconds: 10),
    );
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
    final result = await _cli.run(
      ['doctor'],
      timeout: const Duration(minutes: 2),
    );
    // brew doctor returns exit code 1 for warnings, which is normal.
    return _doctorParser.parse(result.stdout);
  }

  /// Homebrew prefix path (e.g. `/opt/homebrew`, `/usr/local`).
  Future<String> prefix() async {
    final result = await _cli.run(
      ['--prefix'],
      timeout: const Duration(seconds: 10),
    );
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return result.stdout.trim();
  }

  /// Homebrew Cellar path (e.g. `/opt/homebrew/Cellar`).
  Future<String> cellarPath() async {
    final result = await _cli.run(
      ['--cellar'],
      timeout: const Duration(seconds: 10),
    );
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
      results.addAll(await _runParallel(
        packages,
        concurrency,
        (pkg) => install(pkg, cask: cask, force: force),
        onEach,
      ));
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
    return _cli.stream([
      'install',
      if (cask) '--cask',
      package,
    ]);
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
      if (package != null) package,
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
    final args = <String>[
      'upgrade',
      if (cask) '--cask',
      package,
    ];
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
    return _cli.stream([
      'upgrade',
      if (cask) '--cask',
      package,
    ]);
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
