import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

void main() {
  // ── BundleResult ──

  group('BundleResult', () {
    test('toString contains success and elapsed', () {
      const result = BundleResult(
        success: true,
        exitCode: 0,
        output: 'ok',
        elapsed: Duration(seconds: 5),
      );
      expect(result.toString(), contains('success: true'));
      expect(result.toString(), contains('5s'));
    });

    test('toString with errorMessage', () {
      const result = BundleResult(
        success: false,
        exitCode: 1,
        output: '',
        errorMessage: 'install failed',
        elapsed: Duration(seconds: 2),
      );
      expect(result.toString(), contains('success: false'));
    });
  });

  // ── BundleCheckResult ──

  group('BundleCheckResult', () {
    test('toString contains satisfied and missing count', () {
      const result = BundleCheckResult(
        satisfied: false,
        exitCode: 1,
        output: 'missing stuff',
        missingEntries: ['brew "git"', 'cask "docker"'],
      );
      expect(result.toString(), contains('satisfied: false'));
      expect(result.toString(), contains('missing: 2'));
    });

    test('toString when satisfied', () {
      const result = BundleCheckResult(
        satisfied: true,
        exitCode: 0,
        output: '',
        missingEntries: [],
      );
      expect(result.toString(), contains('satisfied: true'));
      expect(result.toString(), contains('missing: 0'));
    });
  });

  // ── BrewConfig.fromJson ──

  group('BrewConfig.fromJson', () {
    test('round-trips via JSON', () {
      const config = BrewConfig(
        homebrewVersion: '4.4.23',
        origin: 'https://github.com/Homebrew/brew',
        coreOrigin: 'https://github.com/Homebrew/homebrew-core',
        prefix: '/opt/homebrew',
        cellar: '/opt/homebrew/Cellar',
        caskroom: '/opt/homebrew/Caskroom',
        raw: {'HOMEBREW_VERSION': '4.4.23'},
      );
      final json = config.toJson();
      final restored = BrewConfig.fromJson(json);
      expect(restored.homebrewVersion, config.homebrewVersion);
      expect(restored.prefix, config.prefix);
    });
  });

  // ── Brewfile / BrewfileEntry fromJson ──

  group('BrewfileEntry.fromJson', () {
    test('round-trips via JSON', () {
      const entry = BrewfileEntry(
        type: BrewfileEntryType.brew,
        name: 'git',
        options: {
          'args': ['--force'],
        },
      );
      final json = entry.toJson();
      final restored = BrewfileEntry.fromJson(json);
      expect(restored.name, entry.name);
      expect(restored.type, entry.type);
    });
  });

  group('Brewfile.fromJson', () {
    test('deserialises from a JSON map', () {
      final json = {
        'entries': [
          {
            'type': 'tap',
            'name': 'homebrew/core',
            'options': <String, dynamic>{},
          },
          {'type': 'brew', 'name': 'git', 'options': <String, dynamic>{}},
        ],
      };
      final brewfile = Brewfile.fromJson(json);
      expect(brewfile.entries, hasLength(2));
      expect(brewfile.entries[1].name, 'git');
    });
  });

  // ── MissingDependency.fromJson ──

  group('MissingDependency.fromJson', () {
    test('round-trips via JSON', () {
      const dep = MissingDependency(
        formula: 'node',
        missingDeps: ['icu4c', 'libuv'],
      );
      final json = dep.toJson();
      final restored = MissingDependency.fromJson(json);
      expect(restored.formula, dep.formula);
      expect(restored.missingDeps, dep.missingDeps);
    });
  });

  // ── DoctorReport / Diagnostic fromJson ──

  group('Diagnostic.fromJson', () {
    test('round-trips via JSON', () {
      const d = Diagnostic(
        severity: DiagnosticSeverity.warning,
        title: 'test warning',
        details: ['detail 1'],
      );
      final json = d.toJson();
      final restored = Diagnostic.fromJson(json);
      expect(restored.title, d.title);
      expect(restored.severity, d.severity);
    });
  });

  group('DoctorReport.fromJson', () {
    test('deserialises from a JSON map', () {
      final json = {
        'healthy': false,
        'diagnostics': [
          {'severity': 'error', 'title': 'critical', 'details': <String>[]},
        ],
      };
      final report = DoctorReport.fromJson(json);
      expect(report.healthy, isFalse);
      expect(report.diagnostics, hasLength(1));
      expect(report.diagnostics[0].severity, DiagnosticSeverity.error);
    });
  });

  // ── OutdatedPackage.fromJson ──

  group('OutdatedPackage.fromJson', () {
    test('round-trips via JSON', () {
      const pkg = OutdatedPackage(
        name: 'git',
        currentVersion: '2.48.0',
        latestVersion: '2.49.0',
        installedVersions: ['2.48.0'],
        isCask: false,
      );
      final json = pkg.toJson();
      final restored = OutdatedPackage.fromJson(json);
      expect(restored.name, pkg.name);
      expect(restored.latestVersion, pkg.latestVersion);
    });
  });

  // ── BrewService.fromJson ──

  group('BrewService.fromJson', () {
    test('round-trips via JSON', () {
      const svc = BrewService(
        name: 'redis',
        status: ServiceStatus.started,
        user: 'joel',
        file: '/Library/LaunchDaemons/redis.plist',
      );
      final json = svc.toJson();
      final restored = BrewService.fromJson(json);
      expect(restored.name, svc.name);
      expect(restored.status, svc.status);
      expect(restored.user, svc.user);
    });
  });
}
