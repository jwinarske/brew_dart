/// Result of a `brew search` query.
class SearchResult {
  /// Matching formula names.
  final List<String> formulae;

  /// Matching cask tokens.
  final List<String> casks;

  const SearchResult({
    this.formulae = const [],
    this.casks = const [],
  });

  /// Total number of matches across both types.
  int get totalCount => formulae.length + casks.length;

  /// Whether the search returned no results.
  bool get isEmpty => formulae.isEmpty && casks.isEmpty;
}
