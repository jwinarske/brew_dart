// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brew_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrewConfig {

 String get homebrewVersion; String get origin; String get coreOrigin; String get prefix; String get cellar; String get caskroom; String? get head; String? get homebrewRubyVersion; String? get cpu; String? get os; String? get macosVersion; String? get xcode; String? get clt; String? get rosetta2;/// All raw key-value pairs from `brew config` output.
 Map<String, String> get raw;
/// Create a copy of BrewConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrewConfigCopyWith<BrewConfig> get copyWith => _$BrewConfigCopyWithImpl<BrewConfig>(this as BrewConfig, _$identity);

  /// Serializes this BrewConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrewConfig&&(identical(other.homebrewVersion, homebrewVersion) || other.homebrewVersion == homebrewVersion)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.coreOrigin, coreOrigin) || other.coreOrigin == coreOrigin)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.cellar, cellar) || other.cellar == cellar)&&(identical(other.caskroom, caskroom) || other.caskroom == caskroom)&&(identical(other.head, head) || other.head == head)&&(identical(other.homebrewRubyVersion, homebrewRubyVersion) || other.homebrewRubyVersion == homebrewRubyVersion)&&(identical(other.cpu, cpu) || other.cpu == cpu)&&(identical(other.os, os) || other.os == os)&&(identical(other.macosVersion, macosVersion) || other.macosVersion == macosVersion)&&(identical(other.xcode, xcode) || other.xcode == xcode)&&(identical(other.clt, clt) || other.clt == clt)&&(identical(other.rosetta2, rosetta2) || other.rosetta2 == rosetta2)&&const DeepCollectionEquality().equals(other.raw, raw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,homebrewVersion,origin,coreOrigin,prefix,cellar,caskroom,head,homebrewRubyVersion,cpu,os,macosVersion,xcode,clt,rosetta2,const DeepCollectionEquality().hash(raw));

@override
String toString() {
  return 'BrewConfig(homebrewVersion: $homebrewVersion, origin: $origin, coreOrigin: $coreOrigin, prefix: $prefix, cellar: $cellar, caskroom: $caskroom, head: $head, homebrewRubyVersion: $homebrewRubyVersion, cpu: $cpu, os: $os, macosVersion: $macosVersion, xcode: $xcode, clt: $clt, rosetta2: $rosetta2, raw: $raw)';
}


}

/// @nodoc
abstract mixin class $BrewConfigCopyWith<$Res>  {
  factory $BrewConfigCopyWith(BrewConfig value, $Res Function(BrewConfig) _then) = _$BrewConfigCopyWithImpl;
@useResult
$Res call({
 String homebrewVersion, String origin, String coreOrigin, String prefix, String cellar, String caskroom, String? head, String? homebrewRubyVersion, String? cpu, String? os, String? macosVersion, String? xcode, String? clt, String? rosetta2, Map<String, String> raw
});




}
/// @nodoc
class _$BrewConfigCopyWithImpl<$Res>
    implements $BrewConfigCopyWith<$Res> {
  _$BrewConfigCopyWithImpl(this._self, this._then);

  final BrewConfig _self;
  final $Res Function(BrewConfig) _then;

/// Create a copy of BrewConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homebrewVersion = null,Object? origin = null,Object? coreOrigin = null,Object? prefix = null,Object? cellar = null,Object? caskroom = null,Object? head = freezed,Object? homebrewRubyVersion = freezed,Object? cpu = freezed,Object? os = freezed,Object? macosVersion = freezed,Object? xcode = freezed,Object? clt = freezed,Object? rosetta2 = freezed,Object? raw = null,}) {
  return _then(_self.copyWith(
homebrewVersion: null == homebrewVersion ? _self.homebrewVersion : homebrewVersion // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,coreOrigin: null == coreOrigin ? _self.coreOrigin : coreOrigin // ignore: cast_nullable_to_non_nullable
as String,prefix: null == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String,cellar: null == cellar ? _self.cellar : cellar // ignore: cast_nullable_to_non_nullable
as String,caskroom: null == caskroom ? _self.caskroom : caskroom // ignore: cast_nullable_to_non_nullable
as String,head: freezed == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String?,homebrewRubyVersion: freezed == homebrewRubyVersion ? _self.homebrewRubyVersion : homebrewRubyVersion // ignore: cast_nullable_to_non_nullable
as String?,cpu: freezed == cpu ? _self.cpu : cpu // ignore: cast_nullable_to_non_nullable
as String?,os: freezed == os ? _self.os : os // ignore: cast_nullable_to_non_nullable
as String?,macosVersion: freezed == macosVersion ? _self.macosVersion : macosVersion // ignore: cast_nullable_to_non_nullable
as String?,xcode: freezed == xcode ? _self.xcode : xcode // ignore: cast_nullable_to_non_nullable
as String?,clt: freezed == clt ? _self.clt : clt // ignore: cast_nullable_to_non_nullable
as String?,rosetta2: freezed == rosetta2 ? _self.rosetta2 : rosetta2 // ignore: cast_nullable_to_non_nullable
as String?,raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [BrewConfig].
extension BrewConfigPatterns on BrewConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrewConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrewConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrewConfig value)  $default,){
final _that = this;
switch (_that) {
case _BrewConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrewConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BrewConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String homebrewVersion,  String origin,  String coreOrigin,  String prefix,  String cellar,  String caskroom,  String? head,  String? homebrewRubyVersion,  String? cpu,  String? os,  String? macosVersion,  String? xcode,  String? clt,  String? rosetta2,  Map<String, String> raw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrewConfig() when $default != null:
return $default(_that.homebrewVersion,_that.origin,_that.coreOrigin,_that.prefix,_that.cellar,_that.caskroom,_that.head,_that.homebrewRubyVersion,_that.cpu,_that.os,_that.macosVersion,_that.xcode,_that.clt,_that.rosetta2,_that.raw);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String homebrewVersion,  String origin,  String coreOrigin,  String prefix,  String cellar,  String caskroom,  String? head,  String? homebrewRubyVersion,  String? cpu,  String? os,  String? macosVersion,  String? xcode,  String? clt,  String? rosetta2,  Map<String, String> raw)  $default,) {final _that = this;
switch (_that) {
case _BrewConfig():
return $default(_that.homebrewVersion,_that.origin,_that.coreOrigin,_that.prefix,_that.cellar,_that.caskroom,_that.head,_that.homebrewRubyVersion,_that.cpu,_that.os,_that.macosVersion,_that.xcode,_that.clt,_that.rosetta2,_that.raw);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String homebrewVersion,  String origin,  String coreOrigin,  String prefix,  String cellar,  String caskroom,  String? head,  String? homebrewRubyVersion,  String? cpu,  String? os,  String? macosVersion,  String? xcode,  String? clt,  String? rosetta2,  Map<String, String> raw)?  $default,) {final _that = this;
switch (_that) {
case _BrewConfig() when $default != null:
return $default(_that.homebrewVersion,_that.origin,_that.coreOrigin,_that.prefix,_that.cellar,_that.caskroom,_that.head,_that.homebrewRubyVersion,_that.cpu,_that.os,_that.macosVersion,_that.xcode,_that.clt,_that.rosetta2,_that.raw);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrewConfig implements BrewConfig {
  const _BrewConfig({required this.homebrewVersion, required this.origin, required this.coreOrigin, required this.prefix, required this.cellar, required this.caskroom, this.head, this.homebrewRubyVersion, this.cpu, this.os, this.macosVersion, this.xcode, this.clt, this.rosetta2, required final  Map<String, String> raw}): _raw = raw;
  factory _BrewConfig.fromJson(Map<String, dynamic> json) => _$BrewConfigFromJson(json);

@override final  String homebrewVersion;
@override final  String origin;
@override final  String coreOrigin;
@override final  String prefix;
@override final  String cellar;
@override final  String caskroom;
@override final  String? head;
@override final  String? homebrewRubyVersion;
@override final  String? cpu;
@override final  String? os;
@override final  String? macosVersion;
@override final  String? xcode;
@override final  String? clt;
@override final  String? rosetta2;
/// All raw key-value pairs from `brew config` output.
 final  Map<String, String> _raw;
/// All raw key-value pairs from `brew config` output.
@override Map<String, String> get raw {
  if (_raw is EqualUnmodifiableMapView) return _raw;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_raw);
}


/// Create a copy of BrewConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrewConfigCopyWith<_BrewConfig> get copyWith => __$BrewConfigCopyWithImpl<_BrewConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrewConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrewConfig&&(identical(other.homebrewVersion, homebrewVersion) || other.homebrewVersion == homebrewVersion)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.coreOrigin, coreOrigin) || other.coreOrigin == coreOrigin)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.cellar, cellar) || other.cellar == cellar)&&(identical(other.caskroom, caskroom) || other.caskroom == caskroom)&&(identical(other.head, head) || other.head == head)&&(identical(other.homebrewRubyVersion, homebrewRubyVersion) || other.homebrewRubyVersion == homebrewRubyVersion)&&(identical(other.cpu, cpu) || other.cpu == cpu)&&(identical(other.os, os) || other.os == os)&&(identical(other.macosVersion, macosVersion) || other.macosVersion == macosVersion)&&(identical(other.xcode, xcode) || other.xcode == xcode)&&(identical(other.clt, clt) || other.clt == clt)&&(identical(other.rosetta2, rosetta2) || other.rosetta2 == rosetta2)&&const DeepCollectionEquality().equals(other._raw, _raw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,homebrewVersion,origin,coreOrigin,prefix,cellar,caskroom,head,homebrewRubyVersion,cpu,os,macosVersion,xcode,clt,rosetta2,const DeepCollectionEquality().hash(_raw));

@override
String toString() {
  return 'BrewConfig(homebrewVersion: $homebrewVersion, origin: $origin, coreOrigin: $coreOrigin, prefix: $prefix, cellar: $cellar, caskroom: $caskroom, head: $head, homebrewRubyVersion: $homebrewRubyVersion, cpu: $cpu, os: $os, macosVersion: $macosVersion, xcode: $xcode, clt: $clt, rosetta2: $rosetta2, raw: $raw)';
}


}

/// @nodoc
abstract mixin class _$BrewConfigCopyWith<$Res> implements $BrewConfigCopyWith<$Res> {
  factory _$BrewConfigCopyWith(_BrewConfig value, $Res Function(_BrewConfig) _then) = __$BrewConfigCopyWithImpl;
@override @useResult
$Res call({
 String homebrewVersion, String origin, String coreOrigin, String prefix, String cellar, String caskroom, String? head, String? homebrewRubyVersion, String? cpu, String? os, String? macosVersion, String? xcode, String? clt, String? rosetta2, Map<String, String> raw
});




}
/// @nodoc
class __$BrewConfigCopyWithImpl<$Res>
    implements _$BrewConfigCopyWith<$Res> {
  __$BrewConfigCopyWithImpl(this._self, this._then);

  final _BrewConfig _self;
  final $Res Function(_BrewConfig) _then;

/// Create a copy of BrewConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homebrewVersion = null,Object? origin = null,Object? coreOrigin = null,Object? prefix = null,Object? cellar = null,Object? caskroom = null,Object? head = freezed,Object? homebrewRubyVersion = freezed,Object? cpu = freezed,Object? os = freezed,Object? macosVersion = freezed,Object? xcode = freezed,Object? clt = freezed,Object? rosetta2 = freezed,Object? raw = null,}) {
  return _then(_BrewConfig(
homebrewVersion: null == homebrewVersion ? _self.homebrewVersion : homebrewVersion // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,coreOrigin: null == coreOrigin ? _self.coreOrigin : coreOrigin // ignore: cast_nullable_to_non_nullable
as String,prefix: null == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String,cellar: null == cellar ? _self.cellar : cellar // ignore: cast_nullable_to_non_nullable
as String,caskroom: null == caskroom ? _self.caskroom : caskroom // ignore: cast_nullable_to_non_nullable
as String,head: freezed == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String?,homebrewRubyVersion: freezed == homebrewRubyVersion ? _self.homebrewRubyVersion : homebrewRubyVersion // ignore: cast_nullable_to_non_nullable
as String?,cpu: freezed == cpu ? _self.cpu : cpu // ignore: cast_nullable_to_non_nullable
as String?,os: freezed == os ? _self.os : os // ignore: cast_nullable_to_non_nullable
as String?,macosVersion: freezed == macosVersion ? _self.macosVersion : macosVersion // ignore: cast_nullable_to_non_nullable
as String?,xcode: freezed == xcode ? _self.xcode : xcode // ignore: cast_nullable_to_non_nullable
as String?,clt: freezed == clt ? _self.clt : clt // ignore: cast_nullable_to_non_nullable
as String?,rosetta2: freezed == rosetta2 ? _self.rosetta2 : rosetta2 // ignore: cast_nullable_to_non_nullable
as String?,raw: null == raw ? _self._raw : raw // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
