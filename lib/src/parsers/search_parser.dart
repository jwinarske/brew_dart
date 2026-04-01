import '../models/search_result.dart';

/// Parses the text output of `brew search <query>`.
///
/// Output format is one package name per line, split into sections:
/// ```
/// ==> Formulae
/// package1
/// package2
///
/// ==> Casks
/// cask1
/// cask2
/// ```
///
/// If no results are found, the output may contain
/// "No formulae or casks found for ..." or be empty.
class SearchParser {
  const SearchParser();

  SearchResult parse(String output) {
    final formulae = <String>[];
    final casks = <String>[];

    if (output.trim().isEmpty ||
        output.contains('No formulae or casks found')) {
      return const SearchResult();
    }

    var currentSection = _Section.none;

    for (final line in output.split('\n')) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) continue;

      if (trimmed.startsWith('==> Formulae')) {
        currentSection = _Section.formulae;
        continue;
      }
      if (trimmed.startsWith('==> Casks')) {
        currentSection = _Section.casks;
        continue;
      }
      // Skip other section headers
      if (trimmed.startsWith('==>')) continue;

      switch (currentSection) {
        case _Section.formulae:
          formulae.add(trimmed);
        case _Section.casks:
          casks.add(trimmed);
        case _Section.none:
          // Lines before any section header — treat as formulae
          formulae.add(trimmed);
      }
    }

    return SearchResult(formulae: formulae, casks: casks);
  }
}

enum _Section { none, formulae, casks }
