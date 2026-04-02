// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cask _$CaskFromJson(Map<String, dynamic> json) => _Cask(
  token: json['token'] as String,
  fullToken: json['full_token'] as String?,
  tap: json['tap'] as String?,
  name: (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
  desc: json['desc'] as String,
  homepage: json['homepage'] as String,
  version: json['version'] as String,
  url: json['url'] as String?,
  urlSpecs: json['url_specs'] as Map<String, dynamic>?,
  sha256: json['sha256'] as String?,
  artifacts: (json['artifacts'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
  caveats: (json['caveats'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  dependsOn: json['depends_on'] as Map<String, dynamic>?,
  conflicts: (json['conflicts'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  container: json['container'] as String?,
  autoUpdates: json['auto_updates'] as bool?,
  deprecated: json['deprecated'] as bool? ?? false,
  deprecationDate: json['deprecation_date'] as String?,
  deprecationReason: json['deprecation_reason'] as String?,
  disabled: json['disabled'] as bool? ?? false,
  disableDate: json['disable_date'] as String?,
  disableReason: json['disable_reason'] as String?,
  tapGitHead: json['tap_git_head'] as String?,
  installedVersion: json['installed'] as String?,
  outdated: json['outdated'] as bool?,
);

Map<String, dynamic> _$CaskToJson(_Cask instance) => <String, dynamic>{
  'token': instance.token,
  'full_token': instance.fullToken,
  'tap': instance.tap,
  'name': instance.name,
  'desc': instance.desc,
  'homepage': instance.homepage,
  'version': instance.version,
  'url': instance.url,
  'url_specs': instance.urlSpecs,
  'sha256': instance.sha256,
  'artifacts': instance.artifacts,
  'caveats': instance.caveats,
  'depends_on': instance.dependsOn,
  'conflicts': instance.conflicts,
  'container': instance.container,
  'auto_updates': instance.autoUpdates,
  'deprecated': instance.deprecated,
  'deprecation_date': instance.deprecationDate,
  'deprecation_reason': instance.deprecationReason,
  'disabled': instance.disabled,
  'disable_date': instance.disableDate,
  'disable_reason': instance.disableReason,
  'tap_git_head': instance.tapGitHead,
  'installed': instance.installedVersion,
  'outdated': instance.outdated,
};
