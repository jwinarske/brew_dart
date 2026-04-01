import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  const parser = SearchParser();

  test('splits formulae and casks sections', () {
    final output = loadGoldenText('search_node.txt');
    final result = parser.parse(output);

    expect(result.formulae, contains('node'));
    expect(result.formulae, contains('node@20'));
    expect(result.casks, contains('nodebox'));
    expect(result.isEmpty, isFalse);
  });

  test('handles no results', () {
    final output = loadGoldenText('search_no_results.txt');
    final result = parser.parse(output);

    expect(result.formulae, isEmpty);
    expect(result.casks, isEmpty);
    expect(result.isEmpty, isTrue);
  });

  test('handles casks-only search', () {
    final output = loadGoldenText('search_casks_only.txt');
    final result = parser.parse(output);

    expect(result.casks, isNotEmpty);
    expect(result.casks, contains('docker'));
  });

  test('handles empty output', () {
    final result = parser.parse('');
    expect(result.isEmpty, isTrue);
  });

  test('handles output with no section headers', () {
    final result = parser.parse('somepackage\nanotherpackage\n');
    // Lines before any header treated as formulae
    expect(result.formulae, contains('somepackage'));
    expect(result.formulae, contains('anotherpackage'));
  });

  test('totalCount reflects both sections', () {
    final output = loadGoldenText('search_node.txt');
    final result = parser.parse(output);

    expect(result.totalCount, result.formulae.length + result.casks.length);
  });
}
