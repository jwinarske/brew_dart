import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  group('PackageInfo', () {
    test('formula-based PackageInfo', () {
      final json = loadGoldenJson('info_v2_single_formula.json');
      final results = const JsonV2Parser().parseInfo(json);
      final info = results.first;

      expect(info.isFormula, isTrue);
      expect(info.isCask, isFalse);
      expect(info.name, 'git');
      expect(info.desc, isNotEmpty);
      expect(info.homepage, isNotEmpty);
    });

    test('cask-based PackageInfo', () {
      final json = loadGoldenJson('info_v2_single_cask.json');
      final results = const JsonV2Parser().parseInfo(json);
      final info = results.first;

      expect(info.isCask, isTrue);
      expect(info.isFormula, isFalse);
      expect(info.name, 'docker-desktop');
      expect(info.desc, isNotEmpty);
      expect(info.homepage, isNotEmpty);
    });

    test('empty PackageInfo', () {
      const info = PackageInfo();
      expect(info.isFormula, isFalse);
      expect(info.isCask, isFalse);
      expect(info.name, isEmpty);
      expect(info.desc, isEmpty);
      expect(info.homepage, isEmpty);
    });
  });

  group('InstalledPackage', () {
    test('formula installed package has version', () {
      final json = loadGoldenJson('info_v2_installed.json');
      final results = const JsonV2Parser().parseInstalled(json);

      final formulae = results.where((p) => p.isFormula).toList();
      expect(formulae, isNotEmpty);
      expect(formulae.first.installedVersion, isNotEmpty);
    });

    test('cask installed package has version', () {
      final json = loadGoldenJson('info_v2_installed.json');
      final results = const JsonV2Parser().parseInstalled(json);

      final casks = results.where((p) => p.isCask).toList();
      expect(casks, isNotEmpty);
      expect(casks.first.installedVersion, isNotEmpty);
    });

    test('empty InstalledPackage', () {
      const pkg = InstalledPackage();
      expect(pkg.name, isEmpty);
      expect(pkg.installedVersion, isEmpty);
      expect(pkg.isOutdated, isFalse);
    });
  });
}
