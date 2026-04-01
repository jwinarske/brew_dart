import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

void main() {
  group('SearchResult', () {
    test('isEmpty when both lists are empty', () {
      const result = SearchResult();
      expect(result.isEmpty, isTrue);
      expect(result.totalCount, 0);
    });

    test('not empty with formulae', () {
      const result = SearchResult(formulae: ['git', 'node']);
      expect(result.isEmpty, isFalse);
      expect(result.totalCount, 2);
    });

    test('totalCount includes both types', () {
      const result = SearchResult(
        formulae: ['git'],
        casks: ['docker', 'firefox'],
      );
      expect(result.totalCount, 3);
    });
  });
}
