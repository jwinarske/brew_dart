// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brewfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BrewfileEntry _$BrewfileEntryFromJson(Map<String, dynamic> json) =>
    _BrewfileEntry(
      type: $enumDecode(_$BrewfileEntryTypeEnumMap, json['type']),
      name: json['name'] as String,
      options: json['options'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$BrewfileEntryToJson(_BrewfileEntry instance) =>
    <String, dynamic>{
      'type': _$BrewfileEntryTypeEnumMap[instance.type]!,
      'name': instance.name,
      'options': instance.options,
    };

const _$BrewfileEntryTypeEnumMap = {
  BrewfileEntryType.tap: 'tap',
  BrewfileEntryType.brew: 'brew',
  BrewfileEntryType.cask: 'cask',
  BrewfileEntryType.mas: 'mas',
  BrewfileEntryType.whalebrew: 'whalebrew',
  BrewfileEntryType.vscode: 'vscode',
};

_Brewfile _$BrewfileFromJson(Map<String, dynamic> json) => _Brewfile(
  entries: (json['entries'] as List<dynamic>)
      .map((e) => BrewfileEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BrewfileToJson(_Brewfile instance) => <String, dynamic>{
  'entries': instance.entries,
};
