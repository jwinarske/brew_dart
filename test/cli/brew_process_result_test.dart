import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

void main() {
  group('BrewProcessResult', () {
    test('isSuccess returns true for exit code 0', () {
      const result = BrewProcessResult(
        command: 'brew --version',
        exitCode: 0,
        stdout: 'Homebrew 4.4.23',
        stderr: '',
      );
      expect(result.isSuccess, isTrue);
    });

    test('isSuccess returns false for non-zero exit code', () {
      const result = BrewProcessResult(
        command: 'brew install nonexistent',
        exitCode: 1,
        stdout: '',
        stderr: 'Error: No available formula',
      );
      expect(result.isSuccess, isFalse);
    });

    test('toString includes command and exit code', () {
      const result = BrewProcessResult(
        command: 'brew info git',
        exitCode: 0,
        stdout: '...',
        stderr: '',
      );
      expect(result.toString(), contains('brew info git'));
      expect(result.toString(), contains('0'));
    });
  });

  group('ProcessOutput', () {
    test('stdout output is not an error', () {
      const output = ProcessOutput('Installing...', OutputType.stdout);
      expect(output.isError, isFalse);
      expect(output.type, OutputType.stdout);
    });

    test('stderr output is an error', () {
      const output = ProcessOutput('Warning: ...', OutputType.stderr);
      expect(output.isError, isTrue);
      expect(output.type, OutputType.stderr);
    });

    test('toString includes type prefix', () {
      const output = ProcessOutput('hello', OutputType.stdout);
      expect(output.toString(), contains('stdout'));
    });
  });
}
