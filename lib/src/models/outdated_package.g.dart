// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outdated_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OutdatedPackage _$OutdatedPackageFromJson(Map<String, dynamic> json) =>
    _OutdatedPackage(
      name: json['name'] as String,
      currentVersion: json['current_version'] as String,
      installedVersions:
          (json['installed_versions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      latestVersion: json['latest_version'] as String,
      pinned: json['pinned'] as bool? ?? false,
      isCask: json['isCask'] as bool? ?? false,
    );

Map<String, dynamic> _$OutdatedPackageToJson(_OutdatedPackage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'current_version': instance.currentVersion,
      'installed_versions': instance.installedVersions,
      'latest_version': instance.latestVersion,
      'pinned': instance.pinned,
      'isCask': instance.isCask,
    };
