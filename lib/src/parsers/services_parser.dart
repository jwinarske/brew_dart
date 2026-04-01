import '../models/service.dart';

/// Parses the text output of `brew services list`.
///
/// Output format is a table with columns:
/// ```
/// Name       Status  User File
/// dnsmasq    started root /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
/// httpd      stopped
/// mysql      started joel ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
/// ```
///
/// The first line is a header row. Subsequent lines contain the service data.
class ServicesParser {
  const ServicesParser();

  List<BrewService> parse(String output) {
    final lines = output.split('\n').where((l) => l.trim().isNotEmpty).toList();
    if (lines.isEmpty) return [];

    // Detect column positions from the header row.
    final header = lines.first;
    final statusCol = header.indexOf('Status');
    final userCol = header.indexOf('User');
    final fileCol = header.indexOf('File');

    // If we can't parse the header, fall back to whitespace splitting.
    if (statusCol == -1) {
      return _parseFallback(lines.skip(1));
    }

    final results = <BrewService>[];
    for (final line in lines.skip(1)) {
      if (line.trim().isEmpty) continue;

      final name = _column(line, 0, statusCol);
      final status = _column(line, statusCol, userCol > 0 ? userCol : null);
      final user = userCol > 0
          ? _column(line, userCol, fileCol > 0 ? fileCol : null)
          : null;
      final file =
          fileCol > 0 && line.length > fileCol ? line.substring(fileCol).trim() : null;

      results.add(BrewService(
        name: name,
        status: _parseStatus(status),
        user: user != null && user.isNotEmpty ? user : null,
        file: file != null && file.isNotEmpty ? file : null,
      ));
    }

    return results;
  }

  String _column(String line, int start, int? end) {
    if (start >= line.length) return '';
    final segment = end != null && end <= line.length
        ? line.substring(start, end)
        : line.substring(start);
    return segment.trim();
  }

  ServiceStatus _parseStatus(String value) {
    return switch (value.toLowerCase()) {
      'started' => ServiceStatus.started,
      'stopped' => ServiceStatus.stopped,
      'error' => ServiceStatus.error,
      'none' => ServiceStatus.none,
      _ => ServiceStatus.unknown,
    };
  }

  List<BrewService> _parseFallback(Iterable<String> lines) {
    return lines.map((line) {
      final parts = line.trim().split(RegExp(r'\s+'));
      if (parts.isEmpty) return null;
      return BrewService(
        name: parts[0],
        status: parts.length > 1 ? _parseStatus(parts[1]) : ServiceStatus.unknown,
        user: parts.length > 2 && parts[2] != '-' ? parts[2] : null,
        file: parts.length > 3 ? parts.sublist(3).join(' ') : null,
      );
    }).whereType<BrewService>().toList();
  }
}
