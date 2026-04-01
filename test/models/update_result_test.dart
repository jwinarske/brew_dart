import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateResult', () {
    test('holds all fields', () {
      const result = UpdateResult(
        success: true,
        exitCode: 0,
        output: 'Already up-to-date.',
        elapsed: Duration(seconds: 3),
      );
      expect(result.success, isTrue);
      expect(result.exitCode, 0);
      expect(result.output, contains('up-to-date'));
      expect(result.errorMessage, isNull);
      expect(result.elapsed.inSeconds, 3);
    });

    test('toString includes key info', () {
      const result = UpdateResult(
        success: false,
        exitCode: 1,
        output: '',
        errorMessage: 'network error',
        elapsed: Duration(seconds: 10),
      );
      expect(result.toString(), contains('false'));
    });
  });

  group('BundleResult', () {
    test('holds all fields', () {
      const result = BundleResult(
        success: true,
        exitCode: 0,
        output: 'Using git\nUsing node\n',
        elapsed: Duration(seconds: 30),
      );
      expect(result.success, isTrue);
      expect(result.output, contains('git'));
    });
  });

  group('BundleCheckResult', () {
    test('satisfied when all entries present', () {
      const result = BundleCheckResult(
        satisfied: true,
        exitCode: 0,
        output: "The Brewfile's dependencies are satisfied.",
        missingEntries: [],
      );
      expect(result.satisfied, isTrue);
      expect(result.missingEntries, isEmpty);
    });

    test('not satisfied lists missing entries', () {
      const result = BundleCheckResult(
        satisfied: false,
        exitCode: 1,
        output: 'brew "ripgrep" needs to be installed.',
        missingEntries: ['brew "ripgrep" needs to be installed.'],
      );
      expect(result.satisfied, isFalse);
      expect(result.missingEntries, hasLength(1));
    });
  });
}
