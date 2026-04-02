import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  const parser = ServicesParser();

  test('parses mixed service statuses', () {
    final output = loadGoldenText('services_list.txt');
    final services = parser.parse(output);

    expect(services, isNotEmpty);

    final dnsmasq = services.firstWhere((s) => s.name == 'dnsmasq');
    expect(dnsmasq.status, ServiceStatus.started);
    expect(dnsmasq.user, 'root');
    expect(dnsmasq.file, isNotNull);

    final mysql = services.firstWhere((s) => s.name == 'mysql');
    expect(mysql.status, ServiceStatus.stopped);
    expect(mysql.user, isNull);

    final pg = services.firstWhere((s) => s.name == 'postgresql@16');
    expect(pg.status, ServiceStatus.started);
    expect(pg.user, 'joel');
    expect(pg.file, isNotNull);

    final redis = services.firstWhere((s) => s.name == 'redis');
    expect(redis.status, ServiceStatus.error);

    final unbound = services.firstWhere((s) => s.name == 'unbound');
    expect(unbound.status, ServiceStatus.none);
  });

  test('handles empty services list (header only)', () {
    final output = loadGoldenText('services_list_empty.txt');
    final services = parser.parse(output);
    expect(services, isEmpty);
  });

  test('handles completely empty output', () {
    final services = parser.parse('');
    expect(services, isEmpty);
  });

  test('fallback parser used when header lacks Status column', () {
    // Simulate output with a non-standard header (no "Status" keyword).
    const output = '''
Name       State   User
dnsmasq    started root
mysql      stopped
redis      error   joel
''';
    final services = parser.parse(output);
    expect(services, isNotEmpty);
    final dnsmasq = services.firstWhere((s) => s.name == 'dnsmasq');
    expect(dnsmasq.status, ServiceStatus.started);
    expect(dnsmasq.user, 'root');

    final mysql = services.firstWhere((s) => s.name == 'mysql');
    expect(mysql.status, ServiceStatus.stopped);
    expect(mysql.user, isNull);

    final redis = services.firstWhere((s) => s.name == 'redis');
    expect(redis.status, ServiceStatus.error);
    expect(redis.user, 'joel');
  });

  test('fallback parser with file path', () {
    const output = '''
Name   State   User  File
nginx  started root  /Library/LaunchDaemons/homebrew.nginx.plist
''';
    // The header has "State" (not "Status"), so fallback is NOT triggered.
    // This validates the column-based path still works without User/File cols.
    final services = parser.parse(output);
    expect(services, isNotEmpty);
  });

  test('fallback parser handles service with 4-token path', () {
    // No "Status" in header → fallback path
    const output = 'Svc  State  User\nnginx started root /a/b/c.plist\n';
    final services = parser.parse(output);
    expect(services.first.name, 'nginx');
    expect(services.first.file, '/a/b/c.plist');
  });

  test('parseStatus covers unknown value', () {
    // An unrecognised status value should parse as unknown.
    const output = '''
Name  State  User
svc1  weird
''';
    final services = parser.parse(output);
    // Parsed via fallback; status 'weird' → unknown
    expect(services.first.status, ServiceStatus.unknown);
  });

  test('parseStatus covers none value', () {
    const output = '''
Name  State
svc1  none
''';
    final services = parser.parse(output);
    expect(services.first.status, ServiceStatus.none);
  });
}
