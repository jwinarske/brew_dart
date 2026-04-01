import 'dart:convert';

import 'package:brew_dart/remote.dart';
import 'package:test/test.dart';

void main() {
  group('BrewApiClient', () {
    test('allFormulae parses JSON array', () async {
      final client = BrewApiClient(
        httpGet: (_) async => jsonEncode([
          {
            'name': 'git',
            'full_name': 'git',
            'desc': 'Distributed revision control system',
            'homepage': 'https://git-scm.com',
            'versions': {'stable': '2.49.0'},
            'deprecated': false,
            'disabled': false,
          },
          {
            'name': 'node',
            'full_name': 'node',
            'desc': 'Platform built on V8',
            'homepage': 'https://nodejs.org',
            'versions': {'stable': '23.11.0'},
            'deprecated': false,
            'disabled': false,
          },
        ]),
      );

      final formulae = await client.allFormulae();
      expect(formulae, hasLength(2));
      expect(formulae[0].name, 'git');
      expect(formulae[1].name, 'node');
    });

    test('allCasks parses JSON array', () async {
      final client = BrewApiClient(
        httpGet: (_) async => jsonEncode([
          {
            'token': 'docker',
            'desc': 'App to build and share containerised applications',
            'homepage': 'https://www.docker.com',
            'version': '4.38.0',
            'deprecated': false,
            'disabled': false,
          },
        ]),
      );

      final casks = await client.allCasks();
      expect(casks, hasLength(1));
      expect(casks[0].token, 'docker');
      expect(casks[0].version, '4.38.0');
    });

    test('formula fetches single formula detail', () async {
      final client = BrewApiClient(
        httpGet: (url) async {
          expect(url.toString(), contains('/formula/git.json'));
          return jsonEncode({
            'name': 'git',
            'full_name': 'git',
            'desc': 'Distributed revision control system',
            'homepage': 'https://git-scm.com',
            'versions': {'stable': '2.49.0'},
            'dependencies': ['gettext', 'pcre2'],
            'build_dependencies': [],
            'optional_dependencies': [],
            'keg_only': false,
            'deprecated': false,
            'disabled': false,
          });
        },
      );

      final detail = await client.formula('git');
      expect(detail.name, 'git');
      expect(detail.dependencies, contains('gettext'));
    });

    test('cask fetches single cask detail', () async {
      final client = BrewApiClient(
        httpGet: (url) async {
          expect(url.toString(), contains('/cask/docker.json'));
          return jsonEncode({
            'token': 'docker',
            'desc': 'App to build and share containerised applications',
            'homepage': 'https://www.docker.com',
            'version': '4.38.0',
            'deprecated': false,
            'disabled': false,
          });
        },
      );

      final detail = await client.cask('docker');
      expect(detail.token, 'docker');
      expect(detail.version, '4.38.0');
    });

    test('installAnalytics parses analytics data', () async {
      final client = BrewApiClient(
        httpGet: (url) async {
          expect(url.toString(), contains('30d.json'));
          return jsonEncode({
            'category': 'install-on-request',
            'total_items': 2,
            'start_date': '2026-03-01',
            'end_date': '2026-03-31',
            'total_count': 50000,
            'items': [
              {'git': 30000},
              {'node': 20000},
            ],
          });
        },
      );

      final analytics = await client.installAnalytics(days: 30);
      expect(analytics.category, 'install-on-request');
      expect(analytics.totalCount, 50000);
      expect(analytics.items['git'], 30000);
      expect(analytics.items['node'], 20000);
    });

    test('uses correct base URL', () async {
      Uri? capturedUrl;
      final client = BrewApiClient(
        httpGet: (url) async {
          capturedUrl = url;
          return '[]';
        },
      );

      await client.allFormulae();
      expect(capturedUrl.toString(),
          'https://formulae.brew.sh/api/formula.json');
    });
  });
}
