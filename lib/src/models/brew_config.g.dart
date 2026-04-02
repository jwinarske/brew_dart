// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brew_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BrewConfig _$BrewConfigFromJson(Map<String, dynamic> json) => _BrewConfig(
  homebrewVersion: json['homebrewVersion'] as String,
  origin: json['origin'] as String,
  coreOrigin: json['coreOrigin'] as String,
  prefix: json['prefix'] as String,
  cellar: json['cellar'] as String,
  caskroom: json['caskroom'] as String,
  head: json['head'] as String?,
  homebrewRubyVersion: json['homebrewRubyVersion'] as String?,
  cpu: json['cpu'] as String?,
  os: json['os'] as String?,
  macosVersion: json['macosVersion'] as String?,
  xcode: json['xcode'] as String?,
  clt: json['clt'] as String?,
  rosetta2: json['rosetta2'] as String?,
  raw: Map<String, String>.from(json['raw'] as Map),
);

Map<String, dynamic> _$BrewConfigToJson(_BrewConfig instance) =>
    <String, dynamic>{
      'homebrewVersion': instance.homebrewVersion,
      'origin': instance.origin,
      'coreOrigin': instance.coreOrigin,
      'prefix': instance.prefix,
      'cellar': instance.cellar,
      'caskroom': instance.caskroom,
      'head': instance.head,
      'homebrewRubyVersion': instance.homebrewRubyVersion,
      'cpu': instance.cpu,
      'os': instance.os,
      'macosVersion': instance.macosVersion,
      'xcode': instance.xcode,
      'clt': instance.clt,
      'rosetta2': instance.rosetta2,
      'raw': instance.raw,
    };
