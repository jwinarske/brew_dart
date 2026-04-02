import 'dart:io';

import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';
import 'fake_brew_cli.dart';

void main() {
  late FakeBrewCli fakeCli;
  late Brew brew;

  setUp(() {
    fakeCli = FakeBrewCli();
    brew = Brew(cli: fakeCli);
  });

  // ── Phase 1: Detection & Environment ──

  group('isInstalled', () {
    test('returns true when brew responds', () async {
      fakeCli.whenRun('--version', stdout: 'Homebrew 4.4.23');
      expect(await brew.isInstalled(), isTrue);
    });

    test('returns false when brew is not found', () async {
      fakeCli.whenRunFails('--version', exitCode: 127);
      expect(await brew.isInstalled(), isFalse);
    });
  });

  group('version', () {
    test('extracts version number from output', () async {
      fakeCli.whenRun(
        '--version',
        stdout: 'Homebrew 4.4.23\nHomebrew/homebrew-core (no Git)\n',
      );
      final version = await brew.version();
      expect(version, '4.4.23');
    });

    test('throws on failure', () async {
      fakeCli.whenRunFails('--version');
      expect(() => brew.version(), throwsA(isA<BrewCommandException>()));
    });
  });

  group('config', () {
    test('parses config output', () async {
      fakeCli.whenRun('config', stdout: loadGoldenText('config.txt'));
      final config = await brew.config();
      expect(config.homebrewVersion, '5.1.3');
      expect(config.prefix, '/opt/homebrew');
    });
  });

  group('doctor', () {
    test('parses clean doctor output', () async {
      fakeCli.whenRun('doctor', stdout: 'Your system is ready to brew.\n');
      final report = await brew.doctor();
      expect(report.healthy, isTrue);
    });

    test('parses doctor with warnings (exit code 1 is normal)', () async {
      fakeCli.whenRunFails(
        'doctor',
        exitCode: 1,
        stdout: loadGoldenText('doctor_warnings.txt'),
      );
      final report = await brew.doctor();
      expect(report.healthy, isFalse);
      expect(report.diagnostics, isNotEmpty);
    });
  });

  group('prefix', () {
    test('returns trimmed path', () async {
      fakeCli.whenRun('--prefix', stdout: '/opt/homebrew\n');
      expect(await brew.prefix(), '/opt/homebrew');
    });
  });

  group('cellarPath', () {
    test('returns trimmed path', () async {
      fakeCli.whenRun('--cellar', stdout: '/opt/homebrew/Cellar\n');
      expect(await brew.cellarPath(), '/opt/homebrew/Cellar');
    });
  });

  // ── Phase 2: Query & Info ──

  group('info', () {
    test('returns PackageInfo for a formula', () async {
      final jsonStr = loadGoldenText('info_v2_single_formula.json');
      fakeCli.whenRun('info git --json=v2', stdout: jsonStr);
      final info = await brew.info('git');
      expect(info.isFormula, isTrue);
      expect(info.name, 'git');
    });

    test('throws PackageNotFoundException when empty', () async {
      fakeCli.whenRun(
        'info nonexistent --json=v2',
        stdout: '{"formulae":[],"casks":[]}',
      );
      expect(
        () => brew.info('nonexistent'),
        throwsA(isA<PackageNotFoundException>()),
      );
    });
  });

  group('installed', () {
    test('returns list of installed packages', () async {
      final jsonStr = loadGoldenText('info_v2_installed.json');
      fakeCli.whenRun('info --installed --json=v2', stdout: jsonStr);
      final packages = await brew.installed();
      expect(packages, isNotEmpty);
    });
  });

  group('outdated', () {
    test('returns outdated packages', () async {
      final jsonStr = loadGoldenText('outdated_v2.json');
      fakeCli.whenRun('outdated --json=v2', stdout: jsonStr);
      final result = await brew.outdated();
      expect(result, isNotEmpty);
    });

    test('returns empty for no outdated', () async {
      final jsonStr = loadGoldenText('outdated_v2_empty.json');
      fakeCli.whenRun('outdated --json=v2', stdout: jsonStr);
      final result = await brew.outdated();
      expect(result, isEmpty);
    });
  });

  group('search', () {
    test('returns search results', () async {
      fakeCli.whenRun('search node', stdout: loadGoldenText('search_node.txt'));
      final result = await brew.search('node');
      expect(result.formulae, contains('node'));
      expect(result.casks, isNotEmpty);
    });

    test('returns empty for no results', () async {
      fakeCli.whenRunFails(
        'search xyznonexistent',
        stderr: 'No formulae or casks found for "xyznonexistent".',
      );
      final result = await brew.search('xyznonexistent');
      expect(result.isEmpty, isTrue);
    });
  });

  // ── Phase 3: Package Management ──

  group('install', () {
    test('returns success result', () async {
      fakeCli.whenRun(
        'install ripgrep',
        stdout: 'Installing ripgrep...\nDone.',
      );
      final result = await brew.install('ripgrep');
      expect(result.success, isTrue);
      expect(result.package, 'ripgrep');
      expect(result.elapsed, isNotNull);
    });

    test('returns failure result without throwing', () async {
      fakeCli.whenRunFails(
        'install nonexistent',
        stderr: 'Error: No available formula',
      );
      final result = await brew.install('nonexistent');
      expect(result.success, isFalse);
      expect(result.errorMessage, contains('No available formula'));
    });

    test('passes --cask and --force flags', () async {
      fakeCli.whenRun('install --cask --force docker', stdout: 'Done.');
      await brew.install('docker', cask: true, force: true);
      expect(fakeCli.executedCommands.last, [
        'install',
        '--cask',
        '--force',
        'docker',
      ]);
    });
  });

  group('installAll', () {
    test('sequential batch collects all results', () async {
      fakeCli.whenRun('install a', stdout: 'ok');
      fakeCli.whenRunFails('install b', stderr: 'fail');
      fakeCli.whenRun('install c', stdout: 'ok');

      final result = await brew.installAll(['a', 'b', 'c']);
      expect(result.total, 3);
      expect(result.succeeded, 2);
      expect(result.failed, 1);
      expect(result.failedPackages, ['b']);
    });

    test('calls onEach callback', () async {
      fakeCli.whenRun('install x', stdout: 'ok');
      fakeCli.whenRun('install y', stdout: 'ok');

      final called = <String>[];
      await brew.installAll(['x', 'y'], onEach: (pkg, _) => called.add(pkg));
      expect(called, ['x', 'y']);
    });
  });

  group('installStream', () {
    test('yields output lines', () async {
      fakeCli.whenRun(
        'install hello',
        stdout: 'Downloading...\nInstalling...\nDone.',
      );
      final lines = <String>[];
      await for (final output in brew.installStream('hello')) {
        lines.add(output.line);
      }
      expect(lines, isNotEmpty);
    });
  });

  group('uninstall', () {
    test('returns success result', () async {
      fakeCli.whenRun('uninstall ripgrep', stdout: 'Uninstalling...');
      final result = await brew.uninstall('ripgrep');
      expect(result.success, isTrue);
      expect(result.package, 'ripgrep');
    });

    test('passes --ignore-dependencies flag', () async {
      fakeCli.whenRun('uninstall --ignore-dependencies icu4c', stdout: 'ok');
      await brew.uninstall('icu4c', ignoreDependencies: true);
      expect(fakeCli.executedCommands.last, [
        'uninstall',
        '--ignore-dependencies',
        'icu4c',
      ]);
    });
  });

  group('cleanup', () {
    test('returns cleanup result', () async {
      fakeCli.whenRun('cleanup', stdout: 'Removing old files...');
      final result = await brew.cleanup();
      expect(result.success, isTrue);
    });

    test('passes --dry-run and -s flags', () async {
      fakeCli.whenRun('cleanup --dry-run -s', stdout: 'Would remove...');
      await brew.cleanup(dryRun: true, scrub: true);
      expect(fakeCli.executedCommands.last, ['cleanup', '--dry-run', '-s']);
    });
  });

  group('upgrade', () {
    test('returns success result', () async {
      fakeCli.whenRun('upgrade node', stdout: 'Upgrading node...');
      final result = await brew.upgrade('node');
      expect(result.success, isTrue);
      expect(result.package, 'node');
    });
  });

  group('listNames', () {
    test('returns list of formula names', () async {
      fakeCli.whenRun('list -1', stdout: loadGoldenText('list_formulae.txt'));
      final names = await brew.listNames();
      expect(names, contains('git'));
    });
  });

  group('isPackageInstalled', () {
    test('returns true when package is in list', () async {
      fakeCli.whenRun('list -1', stdout: 'git\nnode\n');
      expect(await brew.isPackageInstalled('git'), isTrue);
    });

    test('returns false when package is not in list', () async {
      fakeCli.whenRun('list -1', stdout: 'git\nnode\n');
      expect(await brew.isPackageInstalled('ripgrep'), isFalse);
    });
  });

  // ── Phase 4: Dependencies & Taps ──

  group('deps', () {
    test('returns dependency list', () async {
      fakeCli.whenRun('deps git', stdout: 'gettext\npcre2\n');
      final deps = await brew.deps('git');
      expect(deps, ['gettext', 'pcre2']);
    });
  });

  group('uses', () {
    test('returns reverse dependencies', () async {
      fakeCli.whenRun('uses --installed node', stdout: 'yarn\n');
      final uses = await brew.uses('node');
      expect(uses, ['yarn']);
    });
  });

  group('missing', () {
    test('returns missing dependencies', () async {
      fakeCli.whenRun('missing', stdout: loadGoldenText('missing_deps.txt'));
      final missing = await brew.missing();
      expect(missing, hasLength(2));
      expect(missing[0].formula, 'node');
      expect(missing[0].missingDeps, ['icu4c']);
    });

    test('returns empty when nothing missing', () async {
      fakeCli.whenRun('missing', stdout: '');
      final missing = await brew.missing();
      expect(missing, isEmpty);
    });
  });

  group('taps', () {
    test('returns parsed tap list', () async {
      final jsonStr = loadGoldenText('tap_info_v1.json');
      fakeCli.whenRun('tap-info --json --installed', stdout: jsonStr);
      final taps = await brew.taps();
      expect(taps, isNotEmpty);
      expect(taps.first.name, isNotEmpty);
    });
  });

  group('tap', () {
    test('runs tap command', () async {
      fakeCli.whenRun('tap homebrew/cask-fonts', stdout: 'Tapped.');
      await brew.tap('homebrew/cask-fonts');
      expect(fakeCli.executedCommands.last, ['tap', 'homebrew/cask-fonts']);
    });
  });

  group('untap', () {
    test('runs untap command', () async {
      fakeCli.whenRun('untap homebrew/cask-fonts', stdout: 'Untapped.');
      await brew.untap('homebrew/cask-fonts');
      expect(fakeCli.executedCommands.last, ['untap', 'homebrew/cask-fonts']);
    });
  });

  // ── Phase 5: System & Maintenance ──

  group('update', () {
    test('returns update result', () async {
      fakeCli.whenRun('update', stdout: 'Already up-to-date.');
      final result = await brew.update();
      expect(result.success, isTrue);
    });
  });

  group('link / unlink', () {
    test('link passes correct flags', () async {
      fakeCli.whenRun('link --overwrite --force openssl@3', stdout: 'Linked.');
      await brew.link('openssl@3', overwrite: true, force: true);
      expect(fakeCli.executedCommands.last, [
        'link',
        '--overwrite',
        '--force',
        'openssl@3',
      ]);
    });

    test('unlink passes --dry-run', () async {
      fakeCli.whenRun('unlink --dry-run openssl@3', stdout: 'Would unlink.');
      await brew.unlink('openssl@3', dryRun: true);
      expect(fakeCli.executedCommands.last, [
        'unlink',
        '--dry-run',
        'openssl@3',
      ]);
    });
  });

  group('pin / unpin / pinned', () {
    test('pin runs pin command', () async {
      fakeCli.whenRun('pin node', stdout: '');
      await brew.pin('node');
      expect(fakeCli.executedCommands.last, ['pin', 'node']);
    });

    test('unpin runs unpin command', () async {
      fakeCli.whenRun('unpin node', stdout: '');
      await brew.unpin('node');
      expect(fakeCli.executedCommands.last, ['unpin', 'node']);
    });

    test('pinned returns list', () async {
      fakeCli.whenRun('list --pinned', stdout: 'node\nopenssl@3\n');
      final pinned = await brew.pinned();
      expect(pinned, ['node', 'openssl@3']);
    });
  });

  group('services', () {
    test('returns parsed service list', () async {
      fakeCli.whenRun(
        'services list',
        stdout: loadGoldenText('services_list.txt'),
      );
      final services = await brew.services();
      expect(services, isNotEmpty);
      expect(services.first.name, isNotEmpty);
    });

    test('startService runs correct command', () async {
      fakeCli.whenRun('services start postgresql@16', stdout: 'Started.');
      await brew.startService('postgresql@16');
      expect(fakeCli.executedCommands.last, [
        'services',
        'start',
        'postgresql@16',
      ]);
    });

    test('stopService runs correct command', () async {
      fakeCli.whenRun('services stop postgresql@16', stdout: 'Stopped.');
      await brew.stopService('postgresql@16');
      expect(fakeCli.executedCommands.last, [
        'services',
        'stop',
        'postgresql@16',
      ]);
    });

    test('restartService runs correct command', () async {
      fakeCli.whenRun('services restart redis', stdout: 'Restarted.');
      await brew.restartService('redis');
      expect(fakeCli.executedCommands.last, ['services', 'restart', 'redis']);
    });
  });

  // ── Phase 6: Brewfile ──

  group('readBrewfile', () {
    test('parses a Brewfile from disk', () async {
      // Write a temp file
      final tmp = File('${Directory.systemTemp.path}/test_brewfile');
      await tmp.writeAsString(loadGoldenText('brewfile.txt'));

      try {
        final brewfile = await brew.readBrewfile(tmp.path);
        expect(brewfile.entries, isNotEmpty);
      } finally {
        await tmp.delete();
      }
    });
  });

  group('bundleDump', () {
    test('returns brewfile content', () async {
      fakeCli.whenRun(
        'bundle dump',
        stdout: 'tap "homebrew/core"\nbrew "git"\n',
      );
      final content = await brew.bundleDump();
      expect(content, contains('brew "git"'));
    });
  });

  group('bundle', () {
    test('returns bundle result', () async {
      fakeCli.whenRun('bundle', stdout: 'Using git\nUsing node\n');
      final result = await brew.bundle();
      expect(result.success, isTrue);
    });
  });

  group('bundleCheck', () {
    test('returns satisfied when all installed', () async {
      fakeCli.whenRun(
        'bundle check',
        stdout: "The Brewfile's dependencies are satisfied.\n",
      );
      final result = await brew.bundleCheck();
      expect(result.satisfied, isTrue);
      expect(result.missingEntries, isEmpty);
    });

    test('returns unsatisfied with missing entries', () async {
      fakeCli.whenRunFails(
        'bundle check',
        stdout:
            'brew "ripgrep" needs to be installed.\nThe Brewfile\'s dependencies are not satisfied.\n',
      );
      final result = await brew.bundleCheck();
      expect(result.satisfied, isFalse);
      expect(result.missingEntries, isNotEmpty);
    });

    test('passes --file flag', () async {
      fakeCli.whenRun(
        'bundle check',
        stdout: "The Brewfile's dependencies are satisfied.\n",
      );
      await brew.bundleCheck(file: '/tmp/Brewfile');
      expect(fakeCli.executedCommands.last, [
        'bundle',
        'check',
        '--file=/tmp/Brewfile',
      ]);
    });
  });

  // ── Default constructor & cli accessor ──

  group('Brew default constructor', () {
    test('creates BrewCli automatically when no cli arg provided', () {
      final b = Brew();
      expect(b.cli, isA<BrewCli>());
    });

    test('cli getter returns the underlying BrewCli', () {
      expect(brew.cli, same(fakeCli));
    });
  });

  // ── isInstalled exception paths ──

  group('isInstalled exception paths', () {
    test('returns false when BrewNotInstalledException is thrown', () async {
      fakeCli.whenRunThrows('--version', const BrewNotInstalledException());
      expect(await brew.isInstalled(), isFalse);
    });

    test('returns false when a generic Exception is thrown', () async {
      fakeCli.whenRunThrows('--version', Exception('unexpected error'));
      expect(await brew.isInstalled(), isFalse);
    });
  });

  // ── Error paths for Phase 1 methods ──

  group('config error', () {
    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('config', stderr: 'brew config: error');
      expect(() => brew.config(), throwsA(isA<BrewCommandException>()));
    });
  });

  group('prefix error', () {
    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('--prefix', stderr: 'not found');
      expect(() => brew.prefix(), throwsA(isA<BrewCommandException>()));
    });
  });

  group('cellarPath error', () {
    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('--cellar', stderr: 'not found');
      expect(() => brew.cellarPath(), throwsA(isA<BrewCommandException>()));
    });
  });

  // ── outdated with flags ──

  group('outdated with flags', () {
    test('passes --cask flag', () async {
      fakeCli.whenRun(
        'outdated --cask --json=v2',
        stdout: '{"formulae":[],"casks":[]}',
      );
      final result = await brew.outdated(cask: true);
      expect(result, isEmpty);
      expect(fakeCli.executedCommands.last, [
        'outdated',
        '--cask',
        '--json=v2',
      ]);
    });

    test('passes --greedy flag', () async {
      fakeCli.whenRun(
        'outdated --greedy --json=v2',
        stdout: '{"formulae":[],"casks":[]}',
      );
      final result = await brew.outdated(greedy: true);
      expect(result, isEmpty);
      expect(fakeCli.executedCommands.last, [
        'outdated',
        '--greedy',
        '--json=v2',
      ]);
    });

    test('passes both --cask and --greedy flags', () async {
      fakeCli.whenRun(
        'outdated --cask --greedy --json=v2',
        stdout: '{"formulae":[],"casks":[]}',
      );
      await brew.outdated(cask: true, greedy: true);
      expect(fakeCli.executedCommands.last, contains('--cask'));
    });
  });

  // ── search with flags and errors ──

  group('search additional', () {
    test('passes --cask flag when formulae=false', () async {
      fakeCli.whenRun('search --cask docker', stdout: '==> Casks\ndocker\n');
      final result = await brew.search('docker', formulae: false);
      expect(fakeCli.executedCommands.last, contains('--cask'));
      expect(result.casks, contains('docker'));
    });

    test('passes --formula flag when casks=false', () async {
      fakeCli.whenRun('search --formula node', stdout: '==> Formulae\nnode\n');
      final result = await brew.search('node', casks: false);
      expect(fakeCli.executedCommands.last, contains('--formula'));
      expect(result.formulae, contains('node'));
    });

    test('throws BrewCommandException on non-empty-result failure', () async {
      fakeCli.whenRunFails('search badquery', stderr: 'Internal server error');
      expect(
        () => brew.search('badquery'),
        throwsA(isA<BrewCommandException>()),
      );
    });
  });

  // ── install with extra flags ──

  group('install extra flags', () {
    test('passes --quiet flag', () async {
      fakeCli.whenRun('install --quiet ripgrep', stdout: 'ok');
      await brew.install('ripgrep', quiet: true);
      expect(fakeCli.executedCommands.last, contains('--quiet'));
    });

    test('passes --verbose flag', () async {
      fakeCli.whenRun('install --verbose ripgrep', stdout: 'ok');
      await brew.install('ripgrep', verbose: true);
      expect(fakeCli.executedCommands.last, contains('--verbose'));
    });

    test('passes extra options', () async {
      fakeCli.whenRun('install --with-openssl ripgrep', stdout: 'ok');
      await brew.install('ripgrep', options: ['--with-openssl']);
      expect(fakeCli.executedCommands.last, contains('--with-openssl'));
    });
  });

  // ── installAll parallel ──

  group('installAll parallel', () {
    test('parallel batch collects all results', () async {
      fakeCli.whenRun('install a', stdout: 'ok');
      fakeCli.whenRun('install b', stdout: 'ok');
      fakeCli.whenRun('install c', stdout: 'ok');

      final result = await brew.installAll(
        ['a', 'b', 'c'],
        parallel: true,
        concurrency: 2,
      );
      expect(result.total, 3);
      expect(result.succeeded, 3);
    });

    test('parallel batch calls onEach', () async {
      fakeCli.whenRun('install x', stdout: 'ok');
      fakeCli.whenRun('install y', stdout: 'ok');

      final called = <String>[];
      await brew.installAll(
        ['x', 'y'],
        parallel: true,
        onEach: (pkg, _) => called.add(pkg),
      );
      expect(called, containsAll(['x', 'y']));
    });
  });

  // ── upgradeAll ──

  group('upgradeAll', () {
    test('returns empty batch when nothing is outdated', () async {
      fakeCli.whenRun(
        'outdated --json=v2',
        stdout: '{"formulae":[],"casks":[]}',
      );
      final result = await brew.upgradeAll();
      expect(result.total, 0);
      expect(result.succeeded, 0);
      expect(result.elapsed, Duration.zero);
    });

    test('upgrades each outdated package', () async {
      fakeCli.whenRun(
        'outdated --json=v2',
        stdout:
            '{"formulae":[{"name":"node","installed_versions":["22.0.0"],"current_version":"22.0.0","latest_version":"22.1.0","pinned":false}],"casks":[]}',
      );
      fakeCli.whenRun('upgrade node', stdout: 'Upgrading node...');

      final result = await brew.upgradeAll();
      expect(result.total, 1);
      expect(result.succeeded, 1);
    });

    test('reports failures', () async {
      fakeCli.whenRun(
        'outdated --json=v2',
        stdout:
            '{"formulae":[{"name":"node","installed_versions":["22.0.0"],"current_version":"22.0.0","latest_version":"22.1.0","pinned":false}],"casks":[]}',
      );
      fakeCli.whenRunFails('upgrade node', stderr: 'already up-to-date');

      final result = await brew.upgradeAll();
      expect(result.total, 1);
      expect(result.failed, 1);
    });

    test('calls onEach for each upgraded package', () async {
      fakeCli.whenRun(
        'outdated --json=v2',
        stdout:
            '{"formulae":[{"name":"git","installed_versions":["2.48.0"],"current_version":"2.48.0","latest_version":"2.49.0","pinned":false}],"casks":[]}',
      );
      fakeCli.whenRun('upgrade git', stdout: 'ok');

      final called = <String>[];
      await brew.upgradeAll(onEach: (pkg, _) => called.add(pkg));
      expect(called, contains('git'));
    });

    test('passes cask and greedy flags to outdated', () async {
      fakeCli.whenRun(
        'outdated --cask --greedy --json=v2',
        stdout: '{"formulae":[],"casks":[]}',
      );
      await brew.upgradeAll(cask: true, greedy: true);
      expect(
        fakeCli.executedCommands.first,
        containsAll(['outdated', '--cask', '--greedy', '--json=v2']),
      );
    });
  });

  // ── upgradeStream ──

  group('upgradeStream', () {
    test('yields output lines', () async {
      fakeCli.whenRun(
        'upgrade --cask firefox',
        stdout: 'Upgrading firefox...\nDone.',
      );
      final lines = <String>[];
      await for (final output in brew.upgradeStream('firefox', cask: true)) {
        lines.add(output.line);
      }
      expect(lines, isNotEmpty);
    });

    test('without cask flag', () async {
      fakeCli.whenRun('upgrade node', stdout: 'ok');
      final lines = <String>[];
      await for (final output in brew.upgradeStream('node')) {
        lines.add(output.line);
      }
      expect(fakeCli.executedCommands.last, ['upgrade', 'node']);
    });
  });

  // ── uninstallAll ──

  group('uninstallAll', () {
    test('uninstalls all packages', () async {
      fakeCli.whenRun('uninstall a', stdout: 'Uninstalled a');
      fakeCli.whenRun('uninstall b', stdout: 'Uninstalled b');

      final result = await brew.uninstallAll(['a', 'b']);
      expect(result.total, 2);
      expect(result.succeeded, 2);
      expect(result.failed, 0);
    });

    test('reports failed uninstalls', () async {
      fakeCli.whenRun('uninstall a', stdout: 'ok');
      fakeCli.whenRunFails('uninstall b', stderr: 'not installed');

      final result = await brew.uninstallAll(['a', 'b']);
      expect(result.total, 2);
      expect(result.succeeded, 1);
      expect(result.failed, 1);
    });

    test('calls onEach callback', () async {
      fakeCli.whenRun('uninstall x', stdout: 'ok');

      final called = <String>[];
      await brew.uninstallAll(['x'], onEach: (pkg, _) => called.add(pkg));
      expect(called, ['x']);
    });

    test('passes --cask flag', () async {
      fakeCli.whenRun('uninstall --cask docker', stdout: 'ok');
      await brew.uninstallAll(['docker'], cask: true);
      expect(fakeCli.executedCommands.last, contains('--cask'));
    });
  });

  // ── cleanup error ──

  group('cleanup error', () {
    test('returns failure result on error', () async {
      fakeCli.whenRunFails('cleanup', stderr: 'disk error');
      final result = await brew.cleanup();
      expect(result.success, isFalse);
      expect(result.errorMessage, contains('disk error'));
    });

    test('passes package name', () async {
      fakeCli.whenRun('cleanup node', stdout: 'ok');
      await brew.cleanup(package: 'node');
      expect(fakeCli.executedCommands.last, contains('node'));
    });
  });

  // ── upgrade error ──

  group('upgrade error', () {
    test('returns failure result without throwing', () async {
      fakeCli.whenRunFails('upgrade node', stderr: 'already up-to-date');
      final result = await brew.upgrade('node');
      expect(result.success, isFalse);
      expect(result.errorMessage, isNotNull);
    });

    test('passes --cask flag', () async {
      fakeCli.whenRun('upgrade --cask docker', stdout: 'ok');
      final result = await brew.upgrade('docker', cask: true);
      expect(result.success, isTrue);
      expect(fakeCli.executedCommands.last, contains('--cask'));
    });
  });

  // ── listInstalled filter ──

  group('listInstalled', () {
    test('returns all when cask is null', () async {
      final jsonStr = loadGoldenText('info_v2_installed.json');
      fakeCli.whenRun('info --installed --json=v2', stdout: jsonStr);
      final all = await brew.listInstalled();
      expect(all, isNotEmpty);
    });

    test('filters to formulae only when cask=false', () async {
      final jsonStr = loadGoldenText('info_v2_installed.json');
      fakeCli.whenRun('info --installed --json=v2', stdout: jsonStr);
      final formulae = await brew.listInstalled(cask: false);
      expect(formulae.every((p) => p.isFormula), isTrue);
    });

    test('filters to casks only when cask=true', () async {
      final jsonStr = loadGoldenText('info_v2_installed.json');
      fakeCli.whenRun('info --installed --json=v2', stdout: jsonStr);
      final casks = await brew.listInstalled(cask: true);
      expect(casks.every((p) => p.isCask), isTrue);
    });
  });

  // ── isPackageInstalled with cask ──

  group('isPackageInstalled cask', () {
    test('checks cask list', () async {
      fakeCli.whenRun('list --cask -1', stdout: 'docker\n');
      expect(await brew.isPackageInstalled('docker', cask: true), isTrue);
    });
  });

  // ── listNames error ──

  group('listNames error', () {
    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('list -1', stderr: 'error');
      expect(() => brew.listNames(), throwsA(isA<BrewCommandException>()));
    });

    test('list casks', () async {
      fakeCli.whenRun('list --cask -1', stdout: 'docker\nfirefox\n');
      final names = await brew.listNames(cask: true);
      expect(names, containsAll(['docker', 'firefox']));
    });
  });

  // ── deps flags and error ──

  group('deps additional', () {
    test('passes --tree flag', () async {
      fakeCli.whenRun('deps --tree git', stdout: 'gettext\n  pcre2\n');
      await brew.deps('git', tree: true);
      expect(fakeCli.executedCommands.last, contains('--tree'));
    });

    test('passes --installed flag', () async {
      fakeCli.whenRun('deps --installed git', stdout: 'gettext\n');
      await brew.deps('git', installed: true);
      expect(fakeCli.executedCommands.last, contains('--installed'));
    });

    test('passes includeAll flags', () async {
      fakeCli.whenRun(
        'deps --include-build --include-optional --include-test git',
        stdout: '',
      );
      await brew.deps('git', includeAll: true);
      expect(fakeCli.executedCommands.last, contains('--include-build'));
    });

    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('deps git', stderr: 'error');
      expect(() => brew.deps('git'), throwsA(isA<BrewCommandException>()));
    });
  });

  // ── uses flags and error ──

  group('uses additional', () {
    test('passes --recursive flag', () async {
      fakeCli.whenRun('uses --installed --recursive node', stdout: 'yarn\n');
      await brew.uses('node', recursive: true);
      expect(fakeCli.executedCommands.last, contains('--recursive'));
    });

    test('without --installed flag', () async {
      fakeCli.whenRun('uses node', stdout: '');
      await brew.uses('node', installed: false);
      expect(fakeCli.executedCommands.last, isNot(contains('--installed')));
    });

    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('uses node', stderr: 'error');
      expect(
        () => brew.uses('node', installed: false),
        throwsA(isA<BrewCommandException>()),
      );
    });
  });

  // ── missing error ──

  group('missing error', () {
    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('missing', stderr: 'brew error');
      expect(() => brew.missing(), throwsA(isA<BrewCommandException>()));
    });

    test('parses line without colon as formula with no deps', () async {
      fakeCli.whenRun('missing', stdout: 'orphaned-formula\n');
      final result = await brew.missing();
      expect(result, hasLength(1));
      expect(result[0].formula, 'orphaned-formula');
      expect(result[0].missingDeps, isEmpty);
    });
  });

  // ── taps error ──

  group('taps error', () {
    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('tap-info --json --installed', stderr: 'error');
      expect(() => brew.taps(), throwsA(isA<BrewCommandException>()));
    });
  });

  // ── tap with url and error ──

  group('tap additional', () {
    test('passes url argument', () async {
      fakeCli.whenRun('tap custom/tap https://example.com/tap', stdout: '');
      await brew.tap('custom/tap', url: 'https://example.com/tap');
      expect(fakeCli.executedCommands.last, [
        'tap',
        'custom/tap',
        'https://example.com/tap',
      ]);
    });

    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('tap bad/tap', stderr: 'not found');
      expect(() => brew.tap('bad/tap'), throwsA(isA<BrewCommandException>()));
    });
  });

  // ── untap with force and error ──

  group('untap additional', () {
    test('passes --force flag', () async {
      fakeCli.whenRun('untap --force homebrew/cask-fonts', stdout: '');
      await brew.untap('homebrew/cask-fonts', force: true);
      expect(fakeCli.executedCommands.last, contains('--force'));
    });

    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('untap homebrew/cask-fonts', stderr: 'not tapped');
      expect(
        () => brew.untap('homebrew/cask-fonts'),
        throwsA(isA<BrewCommandException>()),
      );
    });
  });

  // ── update with force ──

  group('update additional', () {
    test('passes --force flag', () async {
      fakeCli.whenRun('update --force', stdout: 'Updated.');
      final result = await brew.update(force: true);
      expect(result.success, isTrue);
      expect(fakeCli.executedCommands.last, contains('--force'));
    });

    test('updateStream yields lines', () async {
      fakeCli.whenRun('update', stdout: 'Fetching...\nUpdated.');
      final lines = <String>[];
      await for (final o in brew.updateStream()) {
        lines.add(o.line);
      }
      expect(lines, isNotEmpty);
    });

    test('updateStream passes --force', () async {
      fakeCli.whenRun('update --force', stdout: 'ok');
      await for (final _ in brew.updateStream(force: true)) {}
      expect(fakeCli.executedCommands.last, contains('--force'));
    });
  });

  // ── link / unlink errors ──

  group('link/unlink errors', () {
    test('link throws on failure', () async {
      fakeCli.whenRunFails('link openssl@3', stderr: 'conflict');
      expect(
        () => brew.link('openssl@3'),
        throwsA(isA<BrewCommandException>()),
      );
    });

    test('unlink throws on failure', () async {
      fakeCli.whenRunFails('unlink openssl@3', stderr: 'error');
      expect(
        () => brew.unlink('openssl@3'),
        throwsA(isA<BrewCommandException>()),
      );
    });
  });

  // ── pin / unpin / pinned errors ──

  group('pin/unpin/pinned errors', () {
    test('pin throws on failure', () async {
      fakeCli.whenRunFails('pin node', stderr: 'error');
      expect(() => brew.pin('node'), throwsA(isA<BrewCommandException>()));
    });

    test('unpin throws on failure', () async {
      fakeCli.whenRunFails('unpin node', stderr: 'error');
      expect(() => brew.unpin('node'), throwsA(isA<BrewCommandException>()));
    });

    test('pinned throws on failure', () async {
      fakeCli.whenRunFails('list --pinned', stderr: 'error');
      expect(() => brew.pinned(), throwsA(isA<BrewCommandException>()));
    });
  });

  // ── services errors ──

  group('services errors', () {
    test('services() throws on failure', () async {
      fakeCli.whenRunFails('services list', stderr: 'error');
      expect(() => brew.services(), throwsA(isA<BrewCommandException>()));
    });

    test('startService throws on failure', () async {
      fakeCli.whenRunFails('services start redis', stderr: 'error');
      expect(
        () => brew.startService('redis'),
        throwsA(isA<BrewCommandException>()),
      );
    });

    test('stopService throws on failure', () async {
      fakeCli.whenRunFails('services stop redis', stderr: 'error');
      expect(
        () => brew.stopService('redis'),
        throwsA(isA<BrewCommandException>()),
      );
    });

    test('restartService throws on failure', () async {
      fakeCli.whenRunFails('services restart redis', stderr: 'error');
      expect(
        () => brew.restartService('redis'),
        throwsA(isA<BrewCommandException>()),
      );
    });
  });

  // ── bundleDump with file and error ──

  group('bundleDump additional', () {
    test('passes --file flag', () async {
      fakeCli.whenRun('bundle dump', stdout: 'brew "git"\n');
      await brew.bundleDump(file: '/tmp/Brewfile', force: true);
      expect(fakeCli.executedCommands.last, contains('--file=/tmp/Brewfile'));
      expect(fakeCli.executedCommands.last, contains('--force'));
    });

    test('throws BrewCommandException on failure', () async {
      fakeCli.whenRunFails('bundle dump', stderr: 'error');
      expect(() => brew.bundleDump(), throwsA(isA<BrewCommandException>()));
    });
  });

  // ── bundle with options and error ──

  group('bundle additional', () {
    test('passes --file and --verbose flags', () async {
      fakeCli.whenRun('bundle', stdout: 'ok');
      await brew.bundle(file: '/tmp/Brewfile', verbose: true);
      expect(fakeCli.executedCommands.last, contains('--file=/tmp/Brewfile'));
      expect(fakeCli.executedCommands.last, contains('--verbose'));
    });

    test('returns failure result on error', () async {
      fakeCli.whenRunFails('bundle', stderr: 'install failed');
      final result = await brew.bundle();
      expect(result.success, isFalse);
      expect(result.errorMessage, isNotNull);
    });
  });

  // ── uninstall with cask+force ──

  group('uninstall additional', () {
    test('passes --cask and --force flags', () async {
      fakeCli.whenRun('uninstall --cask --force docker', stdout: 'ok');
      await brew.uninstall('docker', cask: true, force: true);
      expect(
        fakeCli.executedCommands.last,
        containsAll(['--cask', '--force', 'docker']),
      );
    });
  });
}
