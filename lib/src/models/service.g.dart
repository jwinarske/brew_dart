// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BrewService _$BrewServiceFromJson(Map<String, dynamic> json) => _BrewService(
  name: json['name'] as String,
  status: $enumDecode(_$ServiceStatusEnumMap, json['status']),
  user: json['user'] as String?,
  file: json['file'] as String?,
);

Map<String, dynamic> _$BrewServiceToJson(_BrewService instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': _$ServiceStatusEnumMap[instance.status]!,
      'user': instance.user,
      'file': instance.file,
    };

const _$ServiceStatusEnumMap = {
  ServiceStatus.started: 'started',
  ServiceStatus.stopped: 'stopped',
  ServiceStatus.error: 'error',
  ServiceStatus.unknown: 'unknown',
  ServiceStatus.none: 'none',
};
