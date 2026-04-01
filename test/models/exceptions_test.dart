import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

void main() {
  group('BrewException', () {
    test('toString includes message', () {
      const e = BrewException('test error');
      expect(e.toString(), contains('test error'));
      expect(e.message, 'test error');
    });
  });

  group('BrewNotInstalledException', () {
    test('default message', () {
      const e = BrewNotInstalledException();
      expect(e.message, contains('not installed'));
      expect(e.toString(), contains('BrewNotInstalledException'));
    });

    test('custom message', () {
      const e = BrewNotInstalledException('custom msg');
      expect(e.message, 'custom msg');
    });
  });

  group('BrewCommandException', () {
    test('fromResult creates exception with correct fields', () {
      const result = BrewProcessResult(
        command: 'brew install foo',
        exitCode: 1,
        stdout: '',
        stderr: 'Error: No available formula',
      );
      final e = BrewCommandException.fromResult(result);
      expect(e.exitCode, 1);
      expect(e.command, 'brew install foo');
      expect(e.stderr, 'Error: No available formula');
      expect(e.toString(), contains('brew install foo'));
      expect(e.toString(), contains('1'));
    });

    test('fromExitCode creates exception from args', () {
      final e = BrewCommandException.fromExitCode(2, [
        'install',
        '--cask',
        'docker',
      ]);
      expect(e.exitCode, 2);
      expect(e.command, 'brew install --cask docker');
      expect(e.stderr, isEmpty);
    });
  });

  group('PackageNotFoundException', () {
    test('includes package name', () {
      const e = PackageNotFoundException('nonexistent');
      expect(e.packageName, 'nonexistent');
      expect(e.toString(), contains('nonexistent'));
      expect(e.message, contains('nonexistent'));
    });
  });

  group('InstallFailedException', () {
    test('includes package name and stderr', () {
      const e = InstallFailedException(
        packageName: 'broken',
        stderr: 'compilation failed',
      );
      expect(e.packageName, 'broken');
      expect(e.stderr, 'compilation failed');
      expect(e.toString(), contains('broken'));
    });
  });

  group('DependencyConflictException', () {
    test('includes package name and dependents', () {
      const e = DependencyConflictException(
        packageName: 'icu4c',
        dependents: ['node', 'php'],
      );
      expect(e.packageName, 'icu4c');
      expect(e.dependents, ['node', 'php']);
      expect(e.message, contains('icu4c'));
      expect(e.message, contains('node'));
      expect(e.toString(), contains('DependencyConflictException'));
      expect(e.toString(), contains('icu4c'));
      expect(e.toString(), contains('node'));
      expect(e.toString(), contains('php'));
    });

    test('single dependent', () {
      const e = DependencyConflictException(
        packageName: 'openssl@3',
        dependents: ['python@3.12'],
      );
      expect(e.toString(), contains('python@3.12'));
    });
  });

  group('CommandTimeoutException', () {
    test('includes timeout and command', () {
      final e = CommandTimeoutException(
        timeout: const Duration(seconds: 30),
        command: 'brew install ffmpeg',
      );
      expect(e.timeout, const Duration(seconds: 30));
      expect(e.command, 'brew install ffmpeg');
      expect(e.toString(), contains('30'));
      expect(e.toString(), contains('ffmpeg'));
    });
  });
}
