import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_models.freezed.dart';
part 'api_models.g.dart';

/// Summary of a formula from the formulae.brew.sh catalog API.
///
/// Returned by `GET /api/formula.json`.
@freezed
abstract class FormulaSummary with _$FormulaSummary {
  const factory FormulaSummary({
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    String? tap,
    required String desc,
    String? license,
    required String homepage,
    @JsonKey(name: 'versions') required Map<String, dynamic> versions,
    @Default(false) bool deprecated,
    @Default(false) bool disabled,
  }) = _FormulaSummary;

  factory FormulaSummary.fromJson(Map<String, dynamic> json) =>
      _$FormulaSummaryFromJson(json);
}

/// Summary of a cask from the formulae.brew.sh catalog API.
///
/// Returned by `GET /api/cask.json`.
@freezed
abstract class CaskSummary with _$CaskSummary {
  const factory CaskSummary({
    required String token,
    @JsonKey(name: 'full_token') String? fullToken,
    String? tap,
    List<String>? name,
    required String desc,
    required String homepage,
    required String version,
    @Default(false) bool deprecated,
    @Default(false) bool disabled,
  }) = _CaskSummary;

  factory CaskSummary.fromJson(Map<String, dynamic> json) =>
      _$CaskSummaryFromJson(json);
}

/// Detailed formula info from the formulae.brew.sh API.
///
/// Returned by `GET /api/formula/{name}.json`.
/// This is the full JSON v2-style object for a single formula.
@freezed
abstract class FormulaDetail with _$FormulaDetail {
  const factory FormulaDetail({
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    String? tap,
    required String desc,
    String? license,
    required String homepage,
    required Map<String, dynamic> versions,
    @Default([]) List<String> dependencies,
    @JsonKey(name: 'build_dependencies')
    @Default([])
    List<String> buildDependencies,
    @JsonKey(name: 'optional_dependencies')
    @Default([])
    List<String> optionalDependencies,
    @JsonKey(name: 'keg_only') @Default(false) bool kegOnly,
    @Default(false) bool deprecated,
    @Default(false) bool disabled,

    /// Analytics data if included in the response.
    Map<String, dynamic>? analytics,
    @JsonKey(name: 'analytics_linux') Map<String, dynamic>? analyticsLinux,
    @JsonKey(name: 'generated_date') String? generatedDate,
  }) = _FormulaDetail;

  factory FormulaDetail.fromJson(Map<String, dynamic> json) =>
      _$FormulaDetailFromJson(json);
}

/// Detailed cask info from the formulae.brew.sh API.
///
/// Returned by `GET /api/cask/{name}.json`.
@freezed
abstract class CaskDetail with _$CaskDetail {
  const factory CaskDetail({
    required String token,
    @JsonKey(name: 'full_token') String? fullToken,
    String? tap,
    List<String>? name,
    required String desc,
    required String homepage,
    required String version,
    String? url,
    String? sha256,
    @JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn,
    List<String>? conflicts,
    @JsonKey(name: 'auto_updates') bool? autoUpdates,
    @Default(false) bool deprecated,
    @Default(false) bool disabled,

    /// Analytics data if included in the response.
    Map<String, dynamic>? analytics,
    @JsonKey(name: 'generated_date') String? generatedDate,
  }) = _CaskDetail;

  factory CaskDetail.fromJson(Map<String, dynamic> json) =>
      _$CaskDetailFromJson(json);
}

/// Install analytics data from the formulae.brew.sh API.
@freezed
abstract class AnalyticsData with _$AnalyticsData {
  const factory AnalyticsData({
    required String category,
    @JsonKey(name: 'total_items') required int totalItems,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'total_count') required int totalCount,

    /// Map of formula name -> install count.
    required Map<String, int> items,
  }) = _AnalyticsData;

  factory AnalyticsData.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsDataFromJson(json);
}
