// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MissingDependency _$MissingDependencyFromJson(Map<String, dynamic> json) =>
    _MissingDependency(
      formula: json['formula'] as String,
      missingDeps: (json['missingDeps'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MissingDependencyToJson(_MissingDependency instance) =>
    <String, dynamic>{
      'formula': instance.formula,
      'missingDeps': instance.missingDeps,
    };
