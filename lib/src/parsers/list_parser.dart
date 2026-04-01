/// Parses the text output of `brew list`.
///
/// `brew list` outputs one package name per line. With `--versions` it
/// appends version info after the name. This parser handles both formats.
class ListParser {
  const ListParser();

  /// Parse `brew list` output into a list of package names.
  List<String> parseNames(String output) {
    if (output.trim().isEmpty) return [];
    return output
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .map((line) {
          // If --versions was used, the line is "name version1 version2..."
          // We only want the name (first token).
          final spaceIndex = line.indexOf(' ');
          return spaceIndex == -1 ? line : line.substring(0, spaceIndex);
        })
        .toList();
  }
}
