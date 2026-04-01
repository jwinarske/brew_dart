import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

void main() {
  group('MutationResult', () {
    test('holds all fields', () {
      const result = MutationResult(
        package: 'git',
        success: true,
        exitCode: 0,
        output: 'installed',
        elapsed: Duration(seconds: 5),
      );
      expect(result.package, 'git');
      expect(result.success, isTrue);
      expect(result.exitCode, 0);
      expect(result.output, 'installed');
      expect(result.errorMessage, isNull);
      expect(result.elapsed, const Duration(seconds: 5));
    });

    test('toString includes key fields', () {
      const result = MutationResult(
        package: 'git',
        success: true,
        exitCode: 0,
        output: '',
        elapsed: Duration(seconds: 3),
      );
      expect(result.toString(), contains('git'));
      expect(result.toString(), contains('true'));
    });
  });

  group('InstallResult', () {
    test('is a MutationResult', () {
      const result = InstallResult(
        package: 'node',
        success: true,
        exitCode: 0,
        output: '',
        elapsed: Duration.zero,
      );
      expect(result, isA<MutationResult>());
    });
  });

  group('BatchResult', () {
    test('computes failedPackages and succeededPackages', () {
      const result = BatchResult<InstallResult>(
        total: 3,
        succeeded: 2,
        failed: 1,
        results: [
          InstallResult(
            package: 'a',
            success: true,
            exitCode: 0,
            output: '',
            elapsed: Duration.zero,
          ),
          InstallResult(
            package: 'b',
            success: false,
            exitCode: 1,
            output: '',
            errorMessage: 'failed',
            elapsed: Duration.zero,
          ),
          InstallResult(
            package: 'c',
            success: true,
            exitCode: 0,
            output: '',
            elapsed: Duration.zero,
          ),
        ],
        elapsed: Duration(seconds: 10),
      );

      expect(result.failedPackages, ['b']);
      expect(result.succeededPackages, ['a', 'c']);
      expect(result.allSucceeded, isFalse);
    });

    test('allSucceeded is true when no failures', () {
      const result = BatchResult<InstallResult>(
        total: 2,
        succeeded: 2,
        failed: 0,
        results: [
          InstallResult(
            package: 'a',
            success: true,
            exitCode: 0,
            output: '',
            elapsed: Duration.zero,
          ),
          InstallResult(
            package: 'b',
            success: true,
            exitCode: 0,
            output: '',
            elapsed: Duration.zero,
          ),
        ],
        elapsed: Duration(seconds: 5),
      );

      expect(result.allSucceeded, isTrue);
      expect(result.failedPackages, isEmpty);
    });

    test('toString includes summary', () {
      const result = BatchResult<InstallResult>(
        total: 3,
        succeeded: 2,
        failed: 1,
        results: [],
        elapsed: Duration(seconds: 10),
      );
      expect(result.toString(), contains('3'));
      expect(result.toString(), contains('2'));
      expect(result.toString(), contains('1'));
    });
  });

  group('CleanupResult', () {
    test('holds all fields', () {
      const result = CleanupResult(
        success: true,
        exitCode: 0,
        output: 'Removing old files...',
        elapsed: Duration(seconds: 2),
      );
      expect(result.success, isTrue);
      expect(result.exitCode, 0);
      expect(result.output, contains('Removing'));
      expect(result.errorMessage, isNull);
    });
  });
}
