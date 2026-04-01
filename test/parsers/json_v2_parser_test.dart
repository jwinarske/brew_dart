import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  const parser = JsonV2Parser();

  group('parseInfo', () {
    test('parses single formula with all fields', () {
      final json = loadGoldenJson('info_v2_single_formula.json');
      final results = parser.parseInfo(json);

      expect(results, hasLength(1));
      expect(results.first.isFormula, isTrue);
      expect(results.first.isCask, isFalse);

      final formula = results.first.formula!;
      expect(formula.name, 'git');
      expect(formula.fullName, 'git');
      expect(formula.tap, 'homebrew/core');
      expect(formula.desc, isNotEmpty);
      expect(formula.homepage, contains('git'));
      expect(formula.versions.stable, isNotEmpty);
      expect(formula.dependencies, isNotEmpty);
      expect(formula.kegOnly, isFalse);
      expect(formula.deprecated, isFalse);
      expect(formula.disabled, isFalse);
    });

    test('parses single cask', () {
      final json = loadGoldenJson('info_v2_single_cask.json');
      final results = parser.parseInfo(json);

      expect(results, hasLength(1));
      expect(results.first.isCask, isTrue);
      expect(results.first.isFormula, isFalse);

      final cask = results.first.cask!;
      expect(cask.token, 'docker-desktop');
      expect(cask.desc, isNotEmpty);
      expect(cask.homepage, isNotEmpty);
      expect(cask.version, isNotEmpty);
    });

    test('parses keg-only formula', () {
      final json = loadGoldenJson('info_v2_keg_only.json');
      final results = parser.parseInfo(json);

      expect(results, isNotEmpty);
      final formula = results.first.formula!;
      expect(formula.kegOnly, isTrue);
    });

    test('parses deprecated formula', () {
      final json = loadGoldenJson('info_v2_deprecated.json');
      final results = parser.parseInfo(json);

      expect(results, isNotEmpty);
      final formula = results.first.formula!;
      expect(formula.deprecated, isTrue);
      expect(formula.deprecationDate, isNotNull);
    });

    test('handles empty formulae and casks arrays', () {
      final json = {'formulae': <dynamic>[], 'casks': <dynamic>[]};
      final results = parser.parseInfo(json);
      expect(results, isEmpty);
    });

    test('unknown fields in JSON are ignored (forward compat)', () {
      final json =
          loadGoldenJson('info_v2_single_formula.json') as Map<String, dynamic>;
      (json['formulae'] as List<dynamic>)[0]['new_future_field'] = 'surprise';
      expect(() => parser.parseInfo(json), returnsNormally);
    });
  });

  group('parseInstalled', () {
    test('parses installed formulae and casks', () {
      final json = loadGoldenJson('info_v2_installed.json');
      final results = parser.parseInstalled(json);

      expect(results, isNotEmpty);

      final formulae = results.where((p) => p.isFormula).toList();
      final casks = results.where((p) => p.isCask).toList();
      expect(formulae, isNotEmpty);
      expect(casks, isNotEmpty);

      // Check that installed version info is present
      for (final f in formulae) {
        expect(
          f.installedVersion,
          isNotEmpty,
          reason: '${f.name} should have an installed version',
        );
      }
    });

    test('installed package has version info', () {
      final json = loadGoldenJson('info_v2_installed.json');
      final results = parser.parseInstalled(json);

      final node = results.firstWhere(
        (p) => p.name == 'node',
        orElse: () => results.first,
      );
      expect(node.installedVersion, isNotEmpty);
    });
  });

  group('parseOutdated', () {
    test('parses outdated formulae and casks', () {
      final json = loadGoldenJson('outdated_v2.json');
      final results = parser.parseOutdated(json);

      expect(results, isNotEmpty);

      final formulae = results.where((p) => !p.isCask).toList();
      expect(formulae, isNotEmpty);
      for (final f in formulae) {
        expect(f.name, isNotEmpty);
        expect(f.currentVersion, isNotEmpty);
        expect(f.latestVersion, isNotEmpty);
      }
    });

    test('parses empty outdated list', () {
      final json = loadGoldenJson('outdated_v2_empty.json');
      final results = parser.parseOutdated(json);
      expect(results, isEmpty);
    });

    test('parses pinned packages', () {
      final json = loadGoldenJson('outdated_v2_pinned.json');
      final results = parser.parseOutdated(json);

      final pinned = results.where((p) => p.pinned).toList();
      final unpinned = results.where((p) => !p.pinned).toList();
      expect(pinned, isNotEmpty);
      expect(unpinned, isNotEmpty);
    });
  });
}
