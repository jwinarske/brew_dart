// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Diagnostic _$DiagnosticFromJson(Map<String, dynamic> json) => _Diagnostic(
  severity: $enumDecode(_$DiagnosticSeverityEnumMap, json['severity']),
  title: json['title'] as String,
  details: (json['details'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$DiagnosticToJson(_Diagnostic instance) =>
    <String, dynamic>{
      'severity': _$DiagnosticSeverityEnumMap[instance.severity]!,
      'title': instance.title,
      'details': instance.details,
    };

const _$DiagnosticSeverityEnumMap = {
  DiagnosticSeverity.warning: 'warning',
  DiagnosticSeverity.error: 'error',
};

_DoctorReport _$DoctorReportFromJson(Map<String, dynamic> json) =>
    _DoctorReport(
      healthy: json['healthy'] as bool,
      diagnostics: (json['diagnostics'] as List<dynamic>)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorReportToJson(_DoctorReport instance) =>
    <String, dynamic>{
      'healthy': instance.healthy,
      'diagnostics': instance.diagnostics,
    };
