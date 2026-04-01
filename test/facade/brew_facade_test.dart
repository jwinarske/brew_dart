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
      expect(config.homebrewVersion, '4.4.23');
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
  });
}
