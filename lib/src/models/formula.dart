import 'package:freezed_annotation/freezed_annotation.dart';

part 'formula.freezed.dart';
part 'formula.g.dart';

/// Version information for a formula.
@freezed
class FormulaVersions with _$FormulaVersions {
  const factory FormulaVersions({
    required String stable,
    String? head,
    String? bottle,
  }) = _FormulaVersions;

  factory FormulaVersions.fromJson(Map<String, dynamic> json) =>
      _$FormulaVersionsFromJson(json);
}

/// A specific installed version of a formula.
@freezed
class InstalledVersion with _$InstalledVersion {
  const factory InstalledVersion({
    required String version,
    @JsonKey(name: 'used_options') List<String>? usedOptions,
    @JsonKey(name: 'built_as_bottle') bool? builtAsBottle,
    @JsonKey(name: 'poured_from_bottle') bool? pouredFromBottle,
    String? time,
    @JsonKey(name: 'runtime_dependencies')
    List<RuntimeDependency>? runtimeDependencies,
    @JsonKey(name: 'installed_as_dependency')
    bool? installedAsDependency,
    @JsonKey(name: 'installed_on_request') bool? installedOnRequest,
  }) = _InstalledVersion;

  factory InstalledVersion.fromJson(Map<String, dynamic> json) =>
      _$InstalledVersionFromJson(json);
}

/// A runtime dependency as reported in installed version info.
@freezed
class RuntimeDependency with _$RuntimeDependency {
  const factory RuntimeDependency({
    @JsonKey(name: 'full_name') required String fullName,
    String? version,
    String? revision,
    @JsonKey(name: 'pkg_version') String? pkgVersion,
    @JsonKey(name: 'declared_directly') bool? declaredDirectly,
  }) = _RuntimeDependency;

  factory RuntimeDependency.fromJson(Map<String, dynamic> json) =>
      _$RuntimeDependencyFromJson(json);
}

/// A Homebrew formula as returned by `brew info --json=v2`.
@freezed
class Formula with _$Formula {
  const factory Formula({
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    String? tap,
    required String desc,
    String? license,
    required String homepage,
    required FormulaVersions versions,
    List<String>? urls,
    int? revision,
    @JsonKey(name: 'version_scheme') int? versionScheme,
    @Default(false) bool bottle,
    @JsonKey(name: 'keg_only') @Default(false) bool kegOnly,
    @JsonKey(name: 'keg_only_reason') Map<String, dynamic>? kegOnlyReason,
    Map<String, dynamic>? options,
    @Default([]) List<String> dependencies,
    @JsonKey(name: 'build_dependencies')
    @Default([])
    List<String> buildDependencies,
    @JsonKey(name: 'optional_dependencies')
    @Default([])
    List<String> optionalDependencies,
    @JsonKey(name: 'recommended_dependencies')
    @Default([])
    List<String> recommendedDependencies,
    @JsonKey(name: 'uses_from_macos') List<dynamic>? usesFromMacos,
    @Default(false) bool deprecated,
    @JsonKey(name: 'deprecation_date') String? deprecationDate,
    @JsonKey(name: 'deprecation_reason') String? deprecationReason,
    @Default(false) bool disabled,
    @JsonKey(name: 'disable_date') String? disableDate,
    @JsonKey(name: 'disable_reason') String? disableReason,
    @JsonKey(name: 'post_install_defined') bool? postInstallDefined,
    @JsonKey(name: 'service') Map<String, dynamic>? service,
    @JsonKey(name: 'tap_git_head') String? tapGitHead,
    List<InstalledVersion>? installed,
    @JsonKey(name: 'linked_keg') String? linkedKeg,
    bool? pinned,
    bool? outdated,
  }) = _Formula;

  factory Formula.fromJson(Map<String, dynamic> json) =>
      _$FormulaFromJson(json);
}
