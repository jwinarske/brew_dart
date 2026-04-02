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
        await cli.run(['--version'], timeout: const Duration(seconds: 5));
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

    test('run succeeds with a real system executable', () async {
      // Use /bin/sh as a real process that exits 0
      final cli = BrewCli(brewPath: '/bin/sh');
      final result = await cli.run(['-c', 'echo hello']);
      expect(result.isSuccess, isTrue);
      expect(result.stdout.trim(), 'hello');
    });

    test('run captures stderr', () async {
      final cli = BrewCli(brewPath: '/bin/sh');
      final result = await cli.run(['-c', 'echo errline >&2; exit 1']);
      expect(result.isSuccess, isFalse);
      expect(result.stderr.trim(), 'errline');
    });

    test('run merges extraEnv', () async {
      final cli = BrewCli(brewPath: '/bin/sh');
      final result = await cli.run(
        ['-c', 'echo \$MY_TEST_VAR'],
        extraEnv: {'MY_TEST_VAR': 'hello123'},
      );
      expect(result.stdout.trim(), 'hello123');
    });

    test('runJson succeeds with valid JSON output', () async {
      // Produce valid JSON from /bin/sh then parse it
      final cli = BrewCli(brewPath: '/bin/sh');
      final result = await cli.runJson([
        '-c',
        'echo \'{"key":"value"}\'',
      ], jsonFlag: '');
      expect(result, isA<Map<String, dynamic>>());
      expect((result as Map)['key'], 'value');
    });
  });

  group('BrewCli.stream', () {
    test('yields stdout lines', () async {
      final cli = BrewCli(brewPath: '/bin/sh');
      final outputs = <ProcessOutput>[];
      await for (final o in cli.stream(['-c', 'echo line1; echo line2'])) {
        outputs.add(o);
      }
      final lines = outputs.map((o) => o.line).toList();
      expect(lines, containsAll(['line1', 'line2']));
    });

    test('yields stderr lines', () async {
      final cli = BrewCli(brewPath: '/bin/sh');
      final outputs = <ProcessOutput>[];
      await for (final o in cli.stream([
        '-c',
        'echo errline >&2; echo outline',
      ])) {
        outputs.add(o);
      }
      expect(outputs.any((o) => o.line == 'errline'), isTrue);
      expect(outputs.any((o) => o.line == 'outline'), isTrue);
    });

    test('throws BrewCommandException on non-zero exit code', () async {
      final cli = BrewCli(brewPath: '/bin/sh');
      await expectLater(() async {
        await for (final _ in cli.stream(['-c', 'echo err; exit 1'])) {}
      }, throwsA(isA<BrewCommandException>()));
    });
  });
}
