import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  const parser = DoctorParser();

  test('parses clean doctor output', () {
    final output = loadGoldenText('doctor_clean.txt');
    final report = parser.parse(output);

    expect(report.healthy, isTrue);
    expect(report.diagnostics, isEmpty);
  });

  test('parses doctor output with warnings', () {
    final output = loadGoldenText('doctor_warnings.txt');
    final report = parser.parse(output);

    expect(report.healthy, isFalse);
    expect(report.diagnostics, isNotEmpty);
    expect(report.diagnostics.length, 3);

    // All should be warnings
    for (final d in report.diagnostics) {
      expect(d.severity, DiagnosticSeverity.warning);
      expect(d.title, isNotEmpty);
    }

    // First warning about deprecated formulae
    expect(report.diagnostics[0].title, contains('deprecated'));
    expect(report.diagnostics[0].details, isNotEmpty);

    // Second warning about broken symlinks
    expect(report.diagnostics[1].title, contains('symlinks'));

    // Third warning about Xcode
    expect(report.diagnostics[2].title, contains('Xcode'));
  });

  test('handles empty output', () {
    final report = parser.parse('');
    expect(report.healthy, isFalse);
    expect(report.diagnostics, isEmpty);
  });
}
