// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formula.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormulaVersions _$FormulaVersionsFromJson(Map<String, dynamic> json) =>
    _FormulaVersions(
      stable: json['stable'] as String,
      head: json['head'] as String?,
      bottle: json['bottle'] as bool?,
    );

Map<String, dynamic> _$FormulaVersionsToJson(_FormulaVersions instance) =>
    <String, dynamic>{
      'stable': instance.stable,
      'head': instance.head,
      'bottle': instance.bottle,
    };

_InstalledVersion _$InstalledVersionFromJson(Map<String, dynamic> json) =>
    _InstalledVersion(
      version: json['version'] as String,
      usedOptions: (json['used_options'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      builtAsBottle: json['built_as_bottle'] as bool?,
      pouredFromBottle: json['poured_from_bottle'] as bool?,
      time: (json['time'] as num?)?.toInt(),
      runtimeDependencies: (json['runtime_dependencies'] as List<dynamic>?)
          ?.map((e) => RuntimeDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      installedAsDependency: json['installed_as_dependency'] as bool?,
      installedOnRequest: json['installed_on_request'] as bool?,
    );

Map<String, dynamic> _$InstalledVersionToJson(_InstalledVersion instance) =>
    <String, dynamic>{
      'version': instance.version,
      'used_options': instance.usedOptions,
      'built_as_bottle': instance.builtAsBottle,
      'poured_from_bottle': instance.pouredFromBottle,
      'time': instance.time,
      'runtime_dependencies': instance.runtimeDependencies,
      'installed_as_dependency': instance.installedAsDependency,
      'installed_on_request': instance.installedOnRequest,
    };

_RuntimeDependency _$RuntimeDependencyFromJson(Map<String, dynamic> json) =>
    _RuntimeDependency(
      fullName: json['full_name'] as String,
      version: json['version'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      pkgVersion: json['pkg_version'] as String?,
      declaredDirectly: json['declared_directly'] as bool?,
    );

Map<String, dynamic> _$RuntimeDependencyToJson(_RuntimeDependency instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'version': instance.version,
      'revision': instance.revision,
      'pkg_version': instance.pkgVersion,
      'declared_directly': instance.declaredDirectly,
    };

_Formula _$FormulaFromJson(Map<String, dynamic> json) => _Formula(
  name: json['name'] as String,
  fullName: json['full_name'] as String,
  tap: json['tap'] as String?,
  desc: json['desc'] as String,
  license: json['license'] as String?,
  homepage: json['homepage'] as String,
  versions: FormulaVersions.fromJson(json['versions'] as Map<String, dynamic>),
  urls: json['urls'] as Map<String, dynamic>?,
  revision: (json['revision'] as num?)?.toInt(),
  versionScheme: (json['version_scheme'] as num?)?.toInt(),
  bottle: json['bottle'] as Map<String, dynamic>?,
  kegOnly: json['keg_only'] as bool? ?? false,
  kegOnlyReason: json['keg_only_reason'] as Map<String, dynamic>?,
  options: json['options'],
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
  recommendedDependencies:
      (json['recommended_dependencies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  usesFromMacos: json['uses_from_macos'] as List<dynamic>?,
  deprecated: json['deprecated'] as bool? ?? false,
  deprecationDate: json['deprecation_date'] as String?,
  deprecationReason: json['deprecation_reason'] as String?,
  disabled: json['disabled'] as bool? ?? false,
  disableDate: json['disable_date'] as String?,
  disableReason: json['disable_reason'] as String?,
  postInstallDefined: json['post_install_defined'] as bool?,
  service: json['service'] as Map<String, dynamic>?,
  tapGitHead: json['tap_git_head'] as String?,
  installed: (json['installed'] as List<dynamic>?)
      ?.map((e) => InstalledVersion.fromJson(e as Map<String, dynamic>))
      .toList(),
  linkedKeg: json['linked_keg'] as String?,
  pinned: json['pinned'] as bool?,
  outdated: json['outdated'] as bool?,
);

Map<String, dynamic> _$FormulaToJson(_Formula instance) => <String, dynamic>{
  'name': instance.name,
  'full_name': instance.fullName,
  'tap': instance.tap,
  'desc': instance.desc,
  'license': instance.license,
  'homepage': instance.homepage,
  'versions': instance.versions,
  'urls': instance.urls,
  'revision': instance.revision,
  'version_scheme': instance.versionScheme,
  'bottle': instance.bottle,
  'keg_only': instance.kegOnly,
  'keg_only_reason': instance.kegOnlyReason,
  'options': instance.options,
  'dependencies': instance.dependencies,
  'build_dependencies': instance.buildDependencies,
  'optional_dependencies': instance.optionalDependencies,
  'recommended_dependencies': instance.recommendedDependencies,
  'uses_from_macos': instance.usesFromMacos,
  'deprecated': instance.deprecated,
  'deprecation_date': instance.deprecationDate,
  'deprecation_reason': instance.deprecationReason,
  'disabled': instance.disabled,
  'disable_date': instance.disableDate,
  'disable_reason': instance.disableReason,
  'post_install_defined': instance.postInstallDefined,
  'service': instance.service,
  'tap_git_head': instance.tapGitHead,
  'installed': instance.installed,
  'linked_keg': instance.linkedKeg,
  'pinned': instance.pinned,
  'outdated': instance.outdated,
};
