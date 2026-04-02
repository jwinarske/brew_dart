// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tap _$TapFromJson(Map<String, dynamic> json) => _Tap(
  name: json['name'] as String,
  user: json['user'] as String?,
  repo: json['repo'] as String?,
  path: json['path'] as String?,
  installed: json['installed'] as bool?,
  official: json['official'] as bool?,
  formulaNames:
      (json['formula_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  formulaFiles:
      (json['formula_files'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  caskTokens:
      (json['cask_tokens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  caskFiles:
      (json['cask_files'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  commandFiles:
      (json['command_files'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  formulaCount: (json['formula_count'] as num?)?.toInt(),
  caskCount: (json['cask_count'] as num?)?.toInt(),
  remote: json['remote'] as String?,
  customRemote: json['custom_remote'] as bool?,
  isPrivate: json['private'] as bool?,
);

Map<String, dynamic> _$TapToJson(_Tap instance) => <String, dynamic>{
  'name': instance.name,
  'user': instance.user,
  'repo': instance.repo,
  'path': instance.path,
  'installed': instance.installed,
  'official': instance.official,
  'formula_names': instance.formulaNames,
  'formula_files': instance.formulaFiles,
  'cask_tokens': instance.caskTokens,
  'cask_files': instance.caskFiles,
  'command_files': instance.commandFiles,
  'formula_count': instance.formulaCount,
  'cask_count': instance.caskCount,
  'remote': instance.remote,
  'custom_remote': instance.customRemote,
  'private': instance.isPrivate,
};
