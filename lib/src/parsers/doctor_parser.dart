import '../models/doctor_report.dart';

/// Parses the text output of `brew doctor` into a [DoctorReport].
///
/// `brew doctor` outputs a series of warnings/errors, each starting with
/// "Warning:" or "Error:" on its own line, followed by indented detail lines.
/// If everything is fine, it outputs "Your system is ready to brew."
class DoctorParser {
  const DoctorParser();

  static final _warningPattern = RegExp(r'^Warning:\s*(.*)$');
  static final _errorPattern = RegExp(r'^Error:\s*(.*)$');

  DoctorReport parse(String output) {
    final lines = output.split('\n');

    if (output.contains('Your system is ready to brew')) {
      return const DoctorReport(healthy: true, diagnostics: []);
    }

    final diagnostics = <Diagnostic>[];
    DiagnosticSeverity? currentSeverity;
    String? currentTitle;
    var currentDetails = <String>[];

    void flushCurrent() {
      if (currentTitle != null && currentSeverity != null) {
        diagnostics.add(Diagnostic(
          severity: currentSeverity!,
          title: currentTitle!,
          details: currentDetails,
        ));
      }
      currentSeverity = null;
      currentTitle = null;
      currentDetails = <String>[];
    }

    for (final line in lines) {
      final warningMatch = _warningPattern.firstMatch(line);
      final errorMatch = _errorPattern.firstMatch(line);

      if (warningMatch != null) {
        flushCurrent();
        currentSeverity = DiagnosticSeverity.warning;
        currentTitle = warningMatch.group(1)?.trim() ?? '';
      } else if (errorMatch != null) {
        flushCurrent();
        currentSeverity = DiagnosticSeverity.error;
        currentTitle = errorMatch.group(1)?.trim() ?? '';
      } else if (currentTitle != null && line.trim().isNotEmpty) {
        currentDetails.add(line.trim());
      }
    }

    flushCurrent();

    return DoctorReport(
      healthy: diagnostics.isEmpty,
      diagnostics: diagnostics,
    );
  }
}
