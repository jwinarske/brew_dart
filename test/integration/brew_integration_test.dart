@Tags(['integration'])
library;

import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

void main() {
  late Brew brew;

  setUpAll(() async {
    brew = Brew();
    expect(await brew.isInstalled(), isTrue,
        reason: 'Integration tests require Homebrew');
  });

  // ── Read-only queries (safe, no side effects) ──

  test('version returns a semver-like string', () async {
    final version = await brew.version();
    expect(version, matches(RegExp(r'\d+\.\d+\.\d+')));
  });

  test('config returns valid BrewConfig with non-empty fields', () async {
    final config = await brew.config();
    expect(config.prefix, isNotEmpty);
    expect(config.homebrewVersion, isNotEmpty);
    expect(config.cellar, isNotEmpty);
  });

  test('prefix returns a valid path', () async {
    final prefix = await brew.prefix();
    expect(prefix, startsWith('/'));
  });

  test('cellarPath returns a valid path', () async {
    final cellar = await brew.cellarPath();
    expect(cellar, startsWith('/'));
    expect(cellar, contains('Cellar'));
  });

  test('info returns valid data for a known formula', () async {
    final info = await brew.info('git');
    expect(info.isFormula, isTrue);
    expect(info.formula!.name, 'git');
    expect(info.formula!.versions.stable, isNotEmpty);
    expect(info.formula!.homepage, contains('git'));
  });

  test('infoMultiple returns multiple results', () async {
    final infos = await brew.infoMultiple(['git', 'curl']);
    expect(infos.length, greaterThanOrEqualTo(2));
  });

  test('installed returns a non-empty list on macOS runner', () async {
    final packages = await brew.installed();
    expect(packages, isNotEmpty);
    expect(packages.first.name, isNotEmpty);
  });

  test('search returns results for common query', () async {
    final results = await brew.search('wget');
    expect(results.formulae, contains('wget'));
  });

  test('search returns empty for nonsense query', () async {
    final results = await brew.search('xyzzy_not_a_real_package_99');
    expect(results.isEmpty, isTrue);
  });

  test('outdated returns parseable list', () async {
    final result = await brew.outdated();
    expect(result, isA<List<OutdatedPackage>>());
  });

  test('deps returns dependency list for known formula', () async {
    final result = await brew.deps('git');
    expect(result, isA<List<String>>());
    expect(result, isNotEmpty);
  });

  test('taps returns at least one tap', () async {
    final result = await brew.taps();
    expect(result, isNotEmpty);
    expect(result.first.name, isNotEmpty);
  });

  test('listNames returns installed formula names', () async {
    final names = await brew.listNames();
    expect(names, isNotEmpty);
    expect(names.first, isNotEmpty);
  });

  test('pinned returns a list (may be empty)', () async {
    final result = await brew.pinned();
    expect(result, isA<List<String>>());
  });

  // ── Doctor (read-only, exercises text parser) ──

  test('doctor returns a parseable report', () async {
    final report = await brew.doctor();
    expect(report, isA<DoctorReport>());
    // May or may not be healthy, but should not throw.
  });

  // ── Mutation tests (install/uninstall cycle) ──

  test('install and uninstall cycle with hello formula', () async {
    // Clean slate
    if (await brew.isPackageInstalled('hello')) {
      await brew.uninstall('hello');
    }

    // Install
    final installResult = await brew.install('hello');
    expect(installResult.success, isTrue);
    expect(await brew.isPackageInstalled('hello'), isTrue);

    // Verify it appears in installed list
    final installed = await brew.installed();
    expect(
      installed.map((p) => p.name),
      contains('hello'),
    );

    // Uninstall
    final uninstallResult = await brew.uninstall('hello');
    expect(uninstallResult.success, isTrue);
    expect(await brew.isPackageInstalled('hello'), isFalse);
  });

  test('install stream emits output lines', () async {
    if (await brew.isPackageInstalled('hello')) {
      await brew.uninstall('hello');
    }

    final lines = <ProcessOutput>[];
    await for (final output in brew.installStream('hello')) {
      lines.add(output);
    }

    expect(lines, isNotEmpty);

    // Cleanup
    await brew.uninstall('hello');
  });

  test('info for nonexistent package throws', () async {
    expect(
      () => brew.info('this_package_definitely_does_not_exist_xyz'),
      throwsA(isA<BrewException>()),
    );
  });
}
