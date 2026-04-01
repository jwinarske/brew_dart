import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

void main() {
  group('BrewCli', () {
    test('constructor accepts custom brewPath', () {
      final cli = BrewCli(brewPath: '/custom/brew');
      expect(cli.brewPath, '/custom/brew');
    });

    test('constructor accepts extra default env', () {
      final cli = BrewCli(defaultEnv: {'EXTRA': 'value'});
      expect(cli.brewPath, isNull);
    });

    test('run with invalid brewPath throws BrewNotInstalledException', () {
      final cli = BrewCli(brewPath: '/nonexistent/path/to/brew');
      expect(
        () => cli.run(['--version']),
        throwsA(isA<BrewNotInstalledException>()),
      );
    });

    test('run with invalid brewPath does not hang', () async {
      final cli = BrewCli(brewPath: '/nonexistent/path/to/brew');
      try {
        await cli.run(
          ['--version'],
          timeout: const Duration(seconds: 5),
        );
        fail('Expected an exception');
      } on BrewNotInstalledException {
        // Expected
      }
    });

    test('runJson with invalid path throws', () {
      final cli = BrewCli(brewPath: '/nonexistent/path/to/brew');
      expect(
        () => cli.runJson(['info', 'git']),
        throwsA(isA<BrewNotInstalledException>()),
      );
    });
  });
}
