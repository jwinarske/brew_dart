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
}
