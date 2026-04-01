import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_report.freezed.dart';
part 'doctor_report.g.dart';

/// Severity of a doctor diagnostic message.
enum DiagnosticSeverity { warning, error }

/// A single diagnostic message from `brew doctor`.
@freezed
abstract class Diagnostic with _$Diagnostic {
  const factory Diagnostic({
    required DiagnosticSeverity severity,
    required String title,
    required List<String> details,
  }) = _Diagnostic;

  factory Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticFromJson(json);
}

/// Parsed output of `brew doctor`.
@freezed
abstract class DoctorReport with _$DoctorReport {
  const factory DoctorReport({
    required bool healthy,
    required List<Diagnostic> diagnostics,
  }) = _DoctorReport;

  factory DoctorReport.fromJson(Map<String, dynamic> json) =>
      _$DoctorReportFromJson(json);
}
