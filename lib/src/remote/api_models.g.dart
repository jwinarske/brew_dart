// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormulaSummary _$FormulaSummaryFromJson(Map<String, dynamic> json) =>
    _FormulaSummary(
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      tap: json['tap'] as String?,
      desc: json['desc'] as String,
      license: json['license'] as String?,
      homepage: json['homepage'] as String,
      versions: json['versions'] as Map<String, dynamic>,
      deprecated: json['deprecated'] as bool? ?? false,
      disabled: json['disabled'] as bool? ?? false,
    );

Map<String, dynamic> _$FormulaSummaryToJson(_FormulaSummary instance) =>
    <String, dynamic>{
      'name': instance.name,
      'full_name': instance.fullName,
      'tap': instance.tap,
      'desc': instance.desc,
      'license': instance.license,
      'homepage': instance.homepage,
      'versions': instance.versions,
      'deprecated': instance.deprecated,
      'disabled': instance.disabled,
    };

_CaskSummary _$CaskSummaryFromJson(Map<String, dynamic> json) => _CaskSummary(
  token: json['token'] as String,
  fullToken: json['full_token'] as String?,
  tap: json['tap'] as String?,
  name: (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
  desc: json['desc'] as String,
  homepage: json['homepage'] as String,
  version: json['version'] as String,
  deprecated: json['deprecated'] as bool? ?? false,
  disabled: json['disabled'] as bool? ?? false,
);

Map<String, dynamic> _$CaskSummaryToJson(_CaskSummary instance) =>
    <String, dynamic>{
      'token': instance.token,
      'full_token': instance.fullToken,
      'tap': instance.tap,
      'name': instance.name,
      'desc': instance.desc,
      'homepage': instance.homepage,
      'version': instance.version,
      'deprecated': instance.deprecated,
      'disabled': instance.disabled,
    };

_FormulaDetail _$FormulaDetailFromJson(Map<String, dynamic> json) =>
    _FormulaDetail(
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      tap: json['tap'] as String?,
      desc: json['desc'] as String,
      license: json['license'] as String?,
      homepage: json['homepage'] as String,
      versions: json['versions'] as Map<String, dynamic>,
      dependencies:
          (json['dependencies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      buildDependencies:
          (json['build_dependencies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      optionalDependencies:
          (json['optional_dependencies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      kegOnly: json['keg_only'] as bool? ?? false,
      deprecated: json['deprecated'] as bool? ?? false,
      disabled: json['disabled'] as bool? ?? false,
      analytics: json['analytics'] as Map<String, dynamic>?,
      analyticsLinux: json['analytics_linux'] as Map<String, dynamic>?,
      generatedDate: json['generated_date'] as String?,
    );

Map<String, dynamic> _$FormulaDetailToJson(_FormulaDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'full_name': instance.fullName,
      'tap': instance.tap,
      'desc': instance.desc,
      'license': instance.license,
      'homepage': instance.homepage,
      'versions': instance.versions,
      'dependencies': instance.dependencies,
      'build_dependencies': instance.buildDependencies,
      'optional_dependencies': instance.optionalDependencies,
      'keg_only': instance.kegOnly,
      'deprecated': instance.deprecated,
      'disabled': instance.disabled,
      'analytics': instance.analytics,
      'analytics_linux': instance.analyticsLinux,
      'generated_date': instance.generatedDate,
    };

_CaskDetail _$CaskDetailFromJson(Map<String, dynamic> json) => _CaskDetail(
  token: json['token'] as String,
  fullToken: json['full_token'] as String?,
  tap: json['tap'] as String?,
  name: (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
  desc: json['desc'] as String,
  homepage: json['homepage'] as String,
  version: json['version'] as String,
  url: json['url'] as String?,
  sha256: json['sha256'] as String?,
  dependsOn: json['depends_on'] as Map<String, dynamic>?,
  conflicts: (json['conflicts'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  autoUpdates: json['auto_updates'] as bool?,
  deprecated: json['deprecated'] as bool? ?? false,
  disabled: json['disabled'] as bool? ?? false,
  analytics: json['analytics'] as Map<String, dynamic>?,
  generatedDate: json['generated_date'] as String?,
);

Map<String, dynamic> _$CaskDetailToJson(_CaskDetail instance) =>
    <String, dynamic>{
      'token': instance.token,
      'full_token': instance.fullToken,
      'tap': instance.tap,
      'name': instance.name,
      'desc': instance.desc,
      'homepage': instance.homepage,
      'version': instance.version,
      'url': instance.url,
      'sha256': instance.sha256,
      'depends_on': instance.dependsOn,
      'conflicts': instance.conflicts,
      'auto_updates': instance.autoUpdates,
      'deprecated': instance.deprecated,
      'disabled': instance.disabled,
      'analytics': instance.analytics,
      'generated_date': instance.generatedDate,
    };

_AnalyticsData _$AnalyticsDataFromJson(Map<String, dynamic> json) =>
    _AnalyticsData(
      category: json['category'] as String,
      totalItems: (json['total_items'] as num).toInt(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      totalCount: (json['total_count'] as num).toInt(),
      items: Map<String, int>.from(json['items'] as Map),
    );

Map<String, dynamic> _$AnalyticsDataToJson(_AnalyticsData instance) =>
    <String, dynamic>{
      'category': instance.category,
      'total_items': instance.totalItems,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'total_count': instance.totalCount,
      'items': instance.items,
    };
