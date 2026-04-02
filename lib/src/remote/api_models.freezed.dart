// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormulaSummary {

 String get name;@JsonKey(name: 'full_name') String get fullName; String? get tap; String get desc; String? get license; String get homepage;@JsonKey(name: 'versions') Map<String, dynamic> get versions; bool get deprecated; bool get disabled;
/// Create a copy of FormulaSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaSummaryCopyWith<FormulaSummary> get copyWith => _$FormulaSummaryCopyWithImpl<FormulaSummary>(this as FormulaSummary, _$identity);

  /// Serializes this FormulaSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormulaSummary&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.tap, tap) || other.tap == tap)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.license, license) || other.license == license)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&const DeepCollectionEquality().equals(other.versions, versions)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fullName,tap,desc,license,homepage,const DeepCollectionEquality().hash(versions),deprecated,disabled);

@override
String toString() {
  return 'FormulaSummary(name: $name, fullName: $fullName, tap: $tap, desc: $desc, license: $license, homepage: $homepage, versions: $versions, deprecated: $deprecated, disabled: $disabled)';
}


}

/// @nodoc
abstract mixin class $FormulaSummaryCopyWith<$Res>  {
  factory $FormulaSummaryCopyWith(FormulaSummary value, $Res Function(FormulaSummary) _then) = _$FormulaSummaryCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'full_name') String fullName, String? tap, String desc, String? license, String homepage,@JsonKey(name: 'versions') Map<String, dynamic> versions, bool deprecated, bool disabled
});




}
/// @nodoc
class _$FormulaSummaryCopyWithImpl<$Res>
    implements $FormulaSummaryCopyWith<$Res> {
  _$FormulaSummaryCopyWithImpl(this._self, this._then);

  final FormulaSummary _self;
  final $Res Function(FormulaSummary) _then;

/// Create a copy of FormulaSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? fullName = null,Object? tap = freezed,Object? desc = null,Object? license = freezed,Object? homepage = null,Object? versions = null,Object? deprecated = null,Object? disabled = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FormulaSummary].
extension FormulaSummaryPatterns on FormulaSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormulaSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormulaSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormulaSummary value)  $default,){
final _that = this;
switch (_that) {
case _FormulaSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormulaSummary value)?  $default,){
final _that = this;
switch (_that) {
case _FormulaSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'full_name')  String fullName,  String? tap,  String desc,  String? license,  String homepage, @JsonKey(name: 'versions')  Map<String, dynamic> versions,  bool deprecated,  bool disabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormulaSummary() when $default != null:
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.deprecated,_that.disabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'full_name')  String fullName,  String? tap,  String desc,  String? license,  String homepage, @JsonKey(name: 'versions')  Map<String, dynamic> versions,  bool deprecated,  bool disabled)  $default,) {final _that = this;
switch (_that) {
case _FormulaSummary():
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.deprecated,_that.disabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'full_name')  String fullName,  String? tap,  String desc,  String? license,  String homepage, @JsonKey(name: 'versions')  Map<String, dynamic> versions,  bool deprecated,  bool disabled)?  $default,) {final _that = this;
switch (_that) {
case _FormulaSummary() when $default != null:
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.deprecated,_that.disabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormulaSummary implements FormulaSummary {
  const _FormulaSummary({required this.name, @JsonKey(name: 'full_name') required this.fullName, this.tap, required this.desc, this.license, required this.homepage, @JsonKey(name: 'versions') required final  Map<String, dynamic> versions, this.deprecated = false, this.disabled = false}): _versions = versions;
  factory _FormulaSummary.fromJson(Map<String, dynamic> json) => _$FormulaSummaryFromJson(json);

@override final  String name;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String? tap;
@override final  String desc;
@override final  String? license;
@override final  String homepage;
 final  Map<String, dynamic> _versions;
@override@JsonKey(name: 'versions') Map<String, dynamic> get versions {
  if (_versions is EqualUnmodifiableMapView) return _versions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_versions);
}

@override@JsonKey() final  bool deprecated;
@override@JsonKey() final  bool disabled;

/// Create a copy of FormulaSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaSummaryCopyWith<_FormulaSummary> get copyWith => __$FormulaSummaryCopyWithImpl<_FormulaSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormulaSummary&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.tap, tap) || other.tap == tap)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.license, license) || other.license == license)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&const DeepCollectionEquality().equals(other._versions, _versions)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fullName,tap,desc,license,homepage,const DeepCollectionEquality().hash(_versions),deprecated,disabled);

@override
String toString() {
  return 'FormulaSummary(name: $name, fullName: $fullName, tap: $tap, desc: $desc, license: $license, homepage: $homepage, versions: $versions, deprecated: $deprecated, disabled: $disabled)';
}


}

/// @nodoc
abstract mixin class _$FormulaSummaryCopyWith<$Res> implements $FormulaSummaryCopyWith<$Res> {
  factory _$FormulaSummaryCopyWith(_FormulaSummary value, $Res Function(_FormulaSummary) _then) = __$FormulaSummaryCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'full_name') String fullName, String? tap, String desc, String? license, String homepage,@JsonKey(name: 'versions') Map<String, dynamic> versions, bool deprecated, bool disabled
});




}
/// @nodoc
class __$FormulaSummaryCopyWithImpl<$Res>
    implements _$FormulaSummaryCopyWith<$Res> {
  __$FormulaSummaryCopyWithImpl(this._self, this._then);

  final _FormulaSummary _self;
  final $Res Function(_FormulaSummary) _then;

/// Create a copy of FormulaSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? fullName = null,Object? tap = freezed,Object? desc = null,Object? license = freezed,Object? homepage = null,Object? versions = null,Object? deprecated = null,Object? disabled = null,}) {
  return _then(_FormulaSummary(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,versions: null == versions ? _self._versions : versions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$CaskSummary {

 String get token;@JsonKey(name: 'full_token') String? get fullToken; String? get tap; List<String>? get name; String get desc; String get homepage; String get version; bool get deprecated; bool get disabled;
/// Create a copy of CaskSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaskSummaryCopyWith<CaskSummary> get copyWith => _$CaskSummaryCopyWithImpl<CaskSummary>(this as CaskSummary, _$identity);

  /// Serializes this CaskSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaskSummary&&(identical(other.token, token) || other.token == token)&&(identical(other.fullToken, fullToken) || other.fullToken == fullToken)&&(identical(other.tap, tap) || other.tap == tap)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.version, version) || other.version == version)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,fullToken,tap,const DeepCollectionEquality().hash(name),desc,homepage,version,deprecated,disabled);

@override
String toString() {
  return 'CaskSummary(token: $token, fullToken: $fullToken, tap: $tap, name: $name, desc: $desc, homepage: $homepage, version: $version, deprecated: $deprecated, disabled: $disabled)';
}


}

/// @nodoc
abstract mixin class $CaskSummaryCopyWith<$Res>  {
  factory $CaskSummaryCopyWith(CaskSummary value, $Res Function(CaskSummary) _then) = _$CaskSummaryCopyWithImpl;
@useResult
$Res call({
 String token,@JsonKey(name: 'full_token') String? fullToken, String? tap, List<String>? name, String desc, String homepage, String version, bool deprecated, bool disabled
});




}
/// @nodoc
class _$CaskSummaryCopyWithImpl<$Res>
    implements $CaskSummaryCopyWith<$Res> {
  _$CaskSummaryCopyWithImpl(this._self, this._then);

  final CaskSummary _self;
  final $Res Function(CaskSummary) _then;

/// Create a copy of CaskSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? fullToken = freezed,Object? tap = freezed,Object? name = freezed,Object? desc = null,Object? homepage = null,Object? version = null,Object? deprecated = null,Object? disabled = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,fullToken: freezed == fullToken ? _self.fullToken : fullToken // ignore: cast_nullable_to_non_nullable
as String?,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as List<String>?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CaskSummary].
extension CaskSummaryPatterns on CaskSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaskSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaskSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaskSummary value)  $default,){
final _that = this;
switch (_that) {
case _CaskSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaskSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CaskSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  String? tap,  List<String>? name,  String desc,  String homepage,  String version,  bool deprecated,  bool disabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaskSummary() when $default != null:
return $default(_that.token,_that.fullToken,_that.tap,_that.name,_that.desc,_that.homepage,_that.version,_that.deprecated,_that.disabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  String? tap,  List<String>? name,  String desc,  String homepage,  String version,  bool deprecated,  bool disabled)  $default,) {final _that = this;
switch (_that) {
case _CaskSummary():
return $default(_that.token,_that.fullToken,_that.tap,_that.name,_that.desc,_that.homepage,_that.version,_that.deprecated,_that.disabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  String? tap,  List<String>? name,  String desc,  String homepage,  String version,  bool deprecated,  bool disabled)?  $default,) {final _that = this;
switch (_that) {
case _CaskSummary() when $default != null:
return $default(_that.token,_that.fullToken,_that.tap,_that.name,_that.desc,_that.homepage,_that.version,_that.deprecated,_that.disabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CaskSummary implements CaskSummary {
  const _CaskSummary({required this.token, @JsonKey(name: 'full_token') this.fullToken, this.tap, final  List<String>? name, required this.desc, required this.homepage, required this.version, this.deprecated = false, this.disabled = false}): _name = name;
  factory _CaskSummary.fromJson(Map<String, dynamic> json) => _$CaskSummaryFromJson(json);

@override final  String token;
@override@JsonKey(name: 'full_token') final  String? fullToken;
@override final  String? tap;
 final  List<String>? _name;
@override List<String>? get name {
  final value = _name;
  if (value == null) return null;
  if (_name is EqualUnmodifiableListView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String desc;
@override final  String homepage;
@override final  String version;
@override@JsonKey() final  bool deprecated;
@override@JsonKey() final  bool disabled;

/// Create a copy of CaskSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaskSummaryCopyWith<_CaskSummary> get copyWith => __$CaskSummaryCopyWithImpl<_CaskSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaskSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaskSummary&&(identical(other.token, token) || other.token == token)&&(identical(other.fullToken, fullToken) || other.fullToken == fullToken)&&(identical(other.tap, tap) || other.tap == tap)&&const DeepCollectionEquality().equals(other._name, _name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.version, version) || other.version == version)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,fullToken,tap,const DeepCollectionEquality().hash(_name),desc,homepage,version,deprecated,disabled);

@override
String toString() {
  return 'CaskSummary(token: $token, fullToken: $fullToken, tap: $tap, name: $name, desc: $desc, homepage: $homepage, version: $version, deprecated: $deprecated, disabled: $disabled)';
}


}

/// @nodoc
abstract mixin class _$CaskSummaryCopyWith<$Res> implements $CaskSummaryCopyWith<$Res> {
  factory _$CaskSummaryCopyWith(_CaskSummary value, $Res Function(_CaskSummary) _then) = __$CaskSummaryCopyWithImpl;
@override @useResult
$Res call({
 String token,@JsonKey(name: 'full_token') String? fullToken, String? tap, List<String>? name, String desc, String homepage, String version, bool deprecated, bool disabled
});




}
/// @nodoc
class __$CaskSummaryCopyWithImpl<$Res>
    implements _$CaskSummaryCopyWith<$Res> {
  __$CaskSummaryCopyWithImpl(this._self, this._then);

  final _CaskSummary _self;
  final $Res Function(_CaskSummary) _then;

/// Create a copy of CaskSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? fullToken = freezed,Object? tap = freezed,Object? name = freezed,Object? desc = null,Object? homepage = null,Object? version = null,Object? deprecated = null,Object? disabled = null,}) {
  return _then(_CaskSummary(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,fullToken: freezed == fullToken ? _self.fullToken : fullToken // ignore: cast_nullable_to_non_nullable
as String?,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as List<String>?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$FormulaDetail {

 String get name;@JsonKey(name: 'full_name') String get fullName; String? get tap; String get desc; String? get license; String get homepage; Map<String, dynamic> get versions; List<String> get dependencies;@JsonKey(name: 'build_dependencies') List<String> get buildDependencies;@JsonKey(name: 'optional_dependencies') List<String> get optionalDependencies;@JsonKey(name: 'keg_only') bool get kegOnly; bool get deprecated; bool get disabled;/// Analytics data if included in the response.
 Map<String, dynamic>? get analytics;@JsonKey(name: 'analytics_linux') Map<String, dynamic>? get analyticsLinux;@JsonKey(name: 'generated_date') String? get generatedDate;
/// Create a copy of FormulaDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaDetailCopyWith<FormulaDetail> get copyWith => _$FormulaDetailCopyWithImpl<FormulaDetail>(this as FormulaDetail, _$identity);

  /// Serializes this FormulaDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormulaDetail&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.tap, tap) || other.tap == tap)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.license, license) || other.license == license)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&const DeepCollectionEquality().equals(other.versions, versions)&&const DeepCollectionEquality().equals(other.dependencies, dependencies)&&const DeepCollectionEquality().equals(other.buildDependencies, buildDependencies)&&const DeepCollectionEquality().equals(other.optionalDependencies, optionalDependencies)&&(identical(other.kegOnly, kegOnly) || other.kegOnly == kegOnly)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&const DeepCollectionEquality().equals(other.analytics, analytics)&&const DeepCollectionEquality().equals(other.analyticsLinux, analyticsLinux)&&(identical(other.generatedDate, generatedDate) || other.generatedDate == generatedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fullName,tap,desc,license,homepage,const DeepCollectionEquality().hash(versions),const DeepCollectionEquality().hash(dependencies),const DeepCollectionEquality().hash(buildDependencies),const DeepCollectionEquality().hash(optionalDependencies),kegOnly,deprecated,disabled,const DeepCollectionEquality().hash(analytics),const DeepCollectionEquality().hash(analyticsLinux),generatedDate);

@override
String toString() {
  return 'FormulaDetail(name: $name, fullName: $fullName, tap: $tap, desc: $desc, license: $license, homepage: $homepage, versions: $versions, dependencies: $dependencies, buildDependencies: $buildDependencies, optionalDependencies: $optionalDependencies, kegOnly: $kegOnly, deprecated: $deprecated, disabled: $disabled, analytics: $analytics, analyticsLinux: $analyticsLinux, generatedDate: $generatedDate)';
}


}

/// @nodoc
abstract mixin class $FormulaDetailCopyWith<$Res>  {
  factory $FormulaDetailCopyWith(FormulaDetail value, $Res Function(FormulaDetail) _then) = _$FormulaDetailCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'full_name') String fullName, String? tap, String desc, String? license, String homepage, Map<String, dynamic> versions, List<String> dependencies,@JsonKey(name: 'build_dependencies') List<String> buildDependencies,@JsonKey(name: 'optional_dependencies') List<String> optionalDependencies,@JsonKey(name: 'keg_only') bool kegOnly, bool deprecated, bool disabled, Map<String, dynamic>? analytics,@JsonKey(name: 'analytics_linux') Map<String, dynamic>? analyticsLinux,@JsonKey(name: 'generated_date') String? generatedDate
});




}
/// @nodoc
class _$FormulaDetailCopyWithImpl<$Res>
    implements $FormulaDetailCopyWith<$Res> {
  _$FormulaDetailCopyWithImpl(this._self, this._then);

  final FormulaDetail _self;
  final $Res Function(FormulaDetail) _then;

/// Create a copy of FormulaDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? fullName = null,Object? tap = freezed,Object? desc = null,Object? license = freezed,Object? homepage = null,Object? versions = null,Object? dependencies = null,Object? buildDependencies = null,Object? optionalDependencies = null,Object? kegOnly = null,Object? deprecated = null,Object? disabled = null,Object? analytics = freezed,Object? analyticsLinux = freezed,Object? generatedDate = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,dependencies: null == dependencies ? _self.dependencies : dependencies // ignore: cast_nullable_to_non_nullable
as List<String>,buildDependencies: null == buildDependencies ? _self.buildDependencies : buildDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,optionalDependencies: null == optionalDependencies ? _self.optionalDependencies : optionalDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,kegOnly: null == kegOnly ? _self.kegOnly : kegOnly // ignore: cast_nullable_to_non_nullable
as bool,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,analytics: freezed == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,analyticsLinux: freezed == analyticsLinux ? _self.analyticsLinux : analyticsLinux // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,generatedDate: freezed == generatedDate ? _self.generatedDate : generatedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FormulaDetail].
extension FormulaDetailPatterns on FormulaDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormulaDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormulaDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormulaDetail value)  $default,){
final _that = this;
switch (_that) {
case _FormulaDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormulaDetail value)?  $default,){
final _that = this;
switch (_that) {
case _FormulaDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'full_name')  String fullName,  String? tap,  String desc,  String? license,  String homepage,  Map<String, dynamic> versions,  List<String> dependencies, @JsonKey(name: 'build_dependencies')  List<String> buildDependencies, @JsonKey(name: 'optional_dependencies')  List<String> optionalDependencies, @JsonKey(name: 'keg_only')  bool kegOnly,  bool deprecated,  bool disabled,  Map<String, dynamic>? analytics, @JsonKey(name: 'analytics_linux')  Map<String, dynamic>? analyticsLinux, @JsonKey(name: 'generated_date')  String? generatedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormulaDetail() when $default != null:
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.dependencies,_that.buildDependencies,_that.optionalDependencies,_that.kegOnly,_that.deprecated,_that.disabled,_that.analytics,_that.analyticsLinux,_that.generatedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'full_name')  String fullName,  String? tap,  String desc,  String? license,  String homepage,  Map<String, dynamic> versions,  List<String> dependencies, @JsonKey(name: 'build_dependencies')  List<String> buildDependencies, @JsonKey(name: 'optional_dependencies')  List<String> optionalDependencies, @JsonKey(name: 'keg_only')  bool kegOnly,  bool deprecated,  bool disabled,  Map<String, dynamic>? analytics, @JsonKey(name: 'analytics_linux')  Map<String, dynamic>? analyticsLinux, @JsonKey(name: 'generated_date')  String? generatedDate)  $default,) {final _that = this;
switch (_that) {
case _FormulaDetail():
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.dependencies,_that.buildDependencies,_that.optionalDependencies,_that.kegOnly,_that.deprecated,_that.disabled,_that.analytics,_that.analyticsLinux,_that.generatedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'full_name')  String fullName,  String? tap,  String desc,  String? license,  String homepage,  Map<String, dynamic> versions,  List<String> dependencies, @JsonKey(name: 'build_dependencies')  List<String> buildDependencies, @JsonKey(name: 'optional_dependencies')  List<String> optionalDependencies, @JsonKey(name: 'keg_only')  bool kegOnly,  bool deprecated,  bool disabled,  Map<String, dynamic>? analytics, @JsonKey(name: 'analytics_linux')  Map<String, dynamic>? analyticsLinux, @JsonKey(name: 'generated_date')  String? generatedDate)?  $default,) {final _that = this;
switch (_that) {
case _FormulaDetail() when $default != null:
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.dependencies,_that.buildDependencies,_that.optionalDependencies,_that.kegOnly,_that.deprecated,_that.disabled,_that.analytics,_that.analyticsLinux,_that.generatedDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormulaDetail implements FormulaDetail {
  const _FormulaDetail({required this.name, @JsonKey(name: 'full_name') required this.fullName, this.tap, required this.desc, this.license, required this.homepage, required final  Map<String, dynamic> versions, final  List<String> dependencies = const [], @JsonKey(name: 'build_dependencies') final  List<String> buildDependencies = const [], @JsonKey(name: 'optional_dependencies') final  List<String> optionalDependencies = const [], @JsonKey(name: 'keg_only') this.kegOnly = false, this.deprecated = false, this.disabled = false, final  Map<String, dynamic>? analytics, @JsonKey(name: 'analytics_linux') final  Map<String, dynamic>? analyticsLinux, @JsonKey(name: 'generated_date') this.generatedDate}): _versions = versions,_dependencies = dependencies,_buildDependencies = buildDependencies,_optionalDependencies = optionalDependencies,_analytics = analytics,_analyticsLinux = analyticsLinux;
  factory _FormulaDetail.fromJson(Map<String, dynamic> json) => _$FormulaDetailFromJson(json);

@override final  String name;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String? tap;
@override final  String desc;
@override final  String? license;
@override final  String homepage;
 final  Map<String, dynamic> _versions;
@override Map<String, dynamic> get versions {
  if (_versions is EqualUnmodifiableMapView) return _versions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_versions);
}

 final  List<String> _dependencies;
@override@JsonKey() List<String> get dependencies {
  if (_dependencies is EqualUnmodifiableListView) return _dependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dependencies);
}

 final  List<String> _buildDependencies;
@override@JsonKey(name: 'build_dependencies') List<String> get buildDependencies {
  if (_buildDependencies is EqualUnmodifiableListView) return _buildDependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_buildDependencies);
}

 final  List<String> _optionalDependencies;
@override@JsonKey(name: 'optional_dependencies') List<String> get optionalDependencies {
  if (_optionalDependencies is EqualUnmodifiableListView) return _optionalDependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optionalDependencies);
}

@override@JsonKey(name: 'keg_only') final  bool kegOnly;
@override@JsonKey() final  bool deprecated;
@override@JsonKey() final  bool disabled;
/// Analytics data if included in the response.
 final  Map<String, dynamic>? _analytics;
/// Analytics data if included in the response.
@override Map<String, dynamic>? get analytics {
  final value = _analytics;
  if (value == null) return null;
  if (_analytics is EqualUnmodifiableMapView) return _analytics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _analyticsLinux;
@override@JsonKey(name: 'analytics_linux') Map<String, dynamic>? get analyticsLinux {
  final value = _analyticsLinux;
  if (value == null) return null;
  if (_analyticsLinux is EqualUnmodifiableMapView) return _analyticsLinux;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'generated_date') final  String? generatedDate;

/// Create a copy of FormulaDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaDetailCopyWith<_FormulaDetail> get copyWith => __$FormulaDetailCopyWithImpl<_FormulaDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormulaDetail&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.tap, tap) || other.tap == tap)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.license, license) || other.license == license)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&const DeepCollectionEquality().equals(other._versions, _versions)&&const DeepCollectionEquality().equals(other._dependencies, _dependencies)&&const DeepCollectionEquality().equals(other._buildDependencies, _buildDependencies)&&const DeepCollectionEquality().equals(other._optionalDependencies, _optionalDependencies)&&(identical(other.kegOnly, kegOnly) || other.kegOnly == kegOnly)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&const DeepCollectionEquality().equals(other._analytics, _analytics)&&const DeepCollectionEquality().equals(other._analyticsLinux, _analyticsLinux)&&(identical(other.generatedDate, generatedDate) || other.generatedDate == generatedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fullName,tap,desc,license,homepage,const DeepCollectionEquality().hash(_versions),const DeepCollectionEquality().hash(_dependencies),const DeepCollectionEquality().hash(_buildDependencies),const DeepCollectionEquality().hash(_optionalDependencies),kegOnly,deprecated,disabled,const DeepCollectionEquality().hash(_analytics),const DeepCollectionEquality().hash(_analyticsLinux),generatedDate);

@override
String toString() {
  return 'FormulaDetail(name: $name, fullName: $fullName, tap: $tap, desc: $desc, license: $license, homepage: $homepage, versions: $versions, dependencies: $dependencies, buildDependencies: $buildDependencies, optionalDependencies: $optionalDependencies, kegOnly: $kegOnly, deprecated: $deprecated, disabled: $disabled, analytics: $analytics, analyticsLinux: $analyticsLinux, generatedDate: $generatedDate)';
}


}

/// @nodoc
abstract mixin class _$FormulaDetailCopyWith<$Res> implements $FormulaDetailCopyWith<$Res> {
  factory _$FormulaDetailCopyWith(_FormulaDetail value, $Res Function(_FormulaDetail) _then) = __$FormulaDetailCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'full_name') String fullName, String? tap, String desc, String? license, String homepage, Map<String, dynamic> versions, List<String> dependencies,@JsonKey(name: 'build_dependencies') List<String> buildDependencies,@JsonKey(name: 'optional_dependencies') List<String> optionalDependencies,@JsonKey(name: 'keg_only') bool kegOnly, bool deprecated, bool disabled, Map<String, dynamic>? analytics,@JsonKey(name: 'analytics_linux') Map<String, dynamic>? analyticsLinux,@JsonKey(name: 'generated_date') String? generatedDate
});




}
/// @nodoc
class __$FormulaDetailCopyWithImpl<$Res>
    implements _$FormulaDetailCopyWith<$Res> {
  __$FormulaDetailCopyWithImpl(this._self, this._then);

  final _FormulaDetail _self;
  final $Res Function(_FormulaDetail) _then;

/// Create a copy of FormulaDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? fullName = null,Object? tap = freezed,Object? desc = null,Object? license = freezed,Object? homepage = null,Object? versions = null,Object? dependencies = null,Object? buildDependencies = null,Object? optionalDependencies = null,Object? kegOnly = null,Object? deprecated = null,Object? disabled = null,Object? analytics = freezed,Object? analyticsLinux = freezed,Object? generatedDate = freezed,}) {
  return _then(_FormulaDetail(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,versions: null == versions ? _self._versions : versions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,dependencies: null == dependencies ? _self._dependencies : dependencies // ignore: cast_nullable_to_non_nullable
as List<String>,buildDependencies: null == buildDependencies ? _self._buildDependencies : buildDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,optionalDependencies: null == optionalDependencies ? _self._optionalDependencies : optionalDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,kegOnly: null == kegOnly ? _self.kegOnly : kegOnly // ignore: cast_nullable_to_non_nullable
as bool,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,analytics: freezed == analytics ? _self._analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,analyticsLinux: freezed == analyticsLinux ? _self._analyticsLinux : analyticsLinux // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,generatedDate: freezed == generatedDate ? _self.generatedDate : generatedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CaskDetail {

 String get token;@JsonKey(name: 'full_token') String? get fullToken; String? get tap; List<String>? get name; String get desc; String get homepage; String get version; String? get url; String? get sha256;@JsonKey(name: 'depends_on') Map<String, dynamic>? get dependsOn; List<String>? get conflicts;@JsonKey(name: 'auto_updates') bool? get autoUpdates; bool get deprecated; bool get disabled;/// Analytics data if included in the response.
 Map<String, dynamic>? get analytics;@JsonKey(name: 'generated_date') String? get generatedDate;
/// Create a copy of CaskDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaskDetailCopyWith<CaskDetail> get copyWith => _$CaskDetailCopyWithImpl<CaskDetail>(this as CaskDetail, _$identity);

  /// Serializes this CaskDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaskDetail&&(identical(other.token, token) || other.token == token)&&(identical(other.fullToken, fullToken) || other.fullToken == fullToken)&&(identical(other.tap, tap) || other.tap == tap)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.version, version) || other.version == version)&&(identical(other.url, url) || other.url == url)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&const DeepCollectionEquality().equals(other.dependsOn, dependsOn)&&const DeepCollectionEquality().equals(other.conflicts, conflicts)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&const DeepCollectionEquality().equals(other.analytics, analytics)&&(identical(other.generatedDate, generatedDate) || other.generatedDate == generatedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,fullToken,tap,const DeepCollectionEquality().hash(name),desc,homepage,version,url,sha256,const DeepCollectionEquality().hash(dependsOn),const DeepCollectionEquality().hash(conflicts),autoUpdates,deprecated,disabled,const DeepCollectionEquality().hash(analytics),generatedDate);

@override
String toString() {
  return 'CaskDetail(token: $token, fullToken: $fullToken, tap: $tap, name: $name, desc: $desc, homepage: $homepage, version: $version, url: $url, sha256: $sha256, dependsOn: $dependsOn, conflicts: $conflicts, autoUpdates: $autoUpdates, deprecated: $deprecated, disabled: $disabled, analytics: $analytics, generatedDate: $generatedDate)';
}


}

/// @nodoc
abstract mixin class $CaskDetailCopyWith<$Res>  {
  factory $CaskDetailCopyWith(CaskDetail value, $Res Function(CaskDetail) _then) = _$CaskDetailCopyWithImpl;
@useResult
$Res call({
 String token,@JsonKey(name: 'full_token') String? fullToken, String? tap, List<String>? name, String desc, String homepage, String version, String? url, String? sha256,@JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn, List<String>? conflicts,@JsonKey(name: 'auto_updates') bool? autoUpdates, bool deprecated, bool disabled, Map<String, dynamic>? analytics,@JsonKey(name: 'generated_date') String? generatedDate
});




}
/// @nodoc
class _$CaskDetailCopyWithImpl<$Res>
    implements $CaskDetailCopyWith<$Res> {
  _$CaskDetailCopyWithImpl(this._self, this._then);

  final CaskDetail _self;
  final $Res Function(CaskDetail) _then;

/// Create a copy of CaskDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? fullToken = freezed,Object? tap = freezed,Object? name = freezed,Object? desc = null,Object? homepage = null,Object? version = null,Object? url = freezed,Object? sha256 = freezed,Object? dependsOn = freezed,Object? conflicts = freezed,Object? autoUpdates = freezed,Object? deprecated = null,Object? disabled = null,Object? analytics = freezed,Object? generatedDate = freezed,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,fullToken: freezed == fullToken ? _self.fullToken : fullToken // ignore: cast_nullable_to_non_nullable
as String?,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as List<String>?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,sha256: freezed == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String?,dependsOn: freezed == dependsOn ? _self.dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,conflicts: freezed == conflicts ? _self.conflicts : conflicts // ignore: cast_nullable_to_non_nullable
as List<String>?,autoUpdates: freezed == autoUpdates ? _self.autoUpdates : autoUpdates // ignore: cast_nullable_to_non_nullable
as bool?,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,analytics: freezed == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,generatedDate: freezed == generatedDate ? _self.generatedDate : generatedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CaskDetail].
extension CaskDetailPatterns on CaskDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaskDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaskDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaskDetail value)  $default,){
final _that = this;
switch (_that) {
case _CaskDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaskDetail value)?  $default,){
final _that = this;
switch (_that) {
case _CaskDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  String? tap,  List<String>? name,  String desc,  String homepage,  String version,  String? url,  String? sha256, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  List<String>? conflicts, @JsonKey(name: 'auto_updates')  bool? autoUpdates,  bool deprecated,  bool disabled,  Map<String, dynamic>? analytics, @JsonKey(name: 'generated_date')  String? generatedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaskDetail() when $default != null:
return $default(_that.token,_that.fullToken,_that.tap,_that.name,_that.desc,_that.homepage,_that.version,_that.url,_that.sha256,_that.dependsOn,_that.conflicts,_that.autoUpdates,_that.deprecated,_that.disabled,_that.analytics,_that.generatedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  String? tap,  List<String>? name,  String desc,  String homepage,  String version,  String? url,  String? sha256, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  List<String>? conflicts, @JsonKey(name: 'auto_updates')  bool? autoUpdates,  bool deprecated,  bool disabled,  Map<String, dynamic>? analytics, @JsonKey(name: 'generated_date')  String? generatedDate)  $default,) {final _that = this;
switch (_that) {
case _CaskDetail():
return $default(_that.token,_that.fullToken,_that.tap,_that.name,_that.desc,_that.homepage,_that.version,_that.url,_that.sha256,_that.dependsOn,_that.conflicts,_that.autoUpdates,_that.deprecated,_that.disabled,_that.analytics,_that.generatedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  String? tap,  List<String>? name,  String desc,  String homepage,  String version,  String? url,  String? sha256, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  List<String>? conflicts, @JsonKey(name: 'auto_updates')  bool? autoUpdates,  bool deprecated,  bool disabled,  Map<String, dynamic>? analytics, @JsonKey(name: 'generated_date')  String? generatedDate)?  $default,) {final _that = this;
switch (_that) {
case _CaskDetail() when $default != null:
return $default(_that.token,_that.fullToken,_that.tap,_that.name,_that.desc,_that.homepage,_that.version,_that.url,_that.sha256,_that.dependsOn,_that.conflicts,_that.autoUpdates,_that.deprecated,_that.disabled,_that.analytics,_that.generatedDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CaskDetail implements CaskDetail {
  const _CaskDetail({required this.token, @JsonKey(name: 'full_token') this.fullToken, this.tap, final  List<String>? name, required this.desc, required this.homepage, required this.version, this.url, this.sha256, @JsonKey(name: 'depends_on') final  Map<String, dynamic>? dependsOn, final  List<String>? conflicts, @JsonKey(name: 'auto_updates') this.autoUpdates, this.deprecated = false, this.disabled = false, final  Map<String, dynamic>? analytics, @JsonKey(name: 'generated_date') this.generatedDate}): _name = name,_dependsOn = dependsOn,_conflicts = conflicts,_analytics = analytics;
  factory _CaskDetail.fromJson(Map<String, dynamic> json) => _$CaskDetailFromJson(json);

@override final  String token;
@override@JsonKey(name: 'full_token') final  String? fullToken;
@override final  String? tap;
 final  List<String>? _name;
@override List<String>? get name {
  final value = _name;
  if (value == null) return null;
  if (_name is EqualUnmodifiableListView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String desc;
@override final  String homepage;
@override final  String version;
@override final  String? url;
@override final  String? sha256;
 final  Map<String, dynamic>? _dependsOn;
@override@JsonKey(name: 'depends_on') Map<String, dynamic>? get dependsOn {
  final value = _dependsOn;
  if (value == null) return null;
  if (_dependsOn is EqualUnmodifiableMapView) return _dependsOn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<String>? _conflicts;
@override List<String>? get conflicts {
  final value = _conflicts;
  if (value == null) return null;
  if (_conflicts is EqualUnmodifiableListView) return _conflicts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'auto_updates') final  bool? autoUpdates;
@override@JsonKey() final  bool deprecated;
@override@JsonKey() final  bool disabled;
/// Analytics data if included in the response.
 final  Map<String, dynamic>? _analytics;
/// Analytics data if included in the response.
@override Map<String, dynamic>? get analytics {
  final value = _analytics;
  if (value == null) return null;
  if (_analytics is EqualUnmodifiableMapView) return _analytics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'generated_date') final  String? generatedDate;

/// Create a copy of CaskDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaskDetailCopyWith<_CaskDetail> get copyWith => __$CaskDetailCopyWithImpl<_CaskDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaskDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaskDetail&&(identical(other.token, token) || other.token == token)&&(identical(other.fullToken, fullToken) || other.fullToken == fullToken)&&(identical(other.tap, tap) || other.tap == tap)&&const DeepCollectionEquality().equals(other._name, _name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.version, version) || other.version == version)&&(identical(other.url, url) || other.url == url)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&const DeepCollectionEquality().equals(other._dependsOn, _dependsOn)&&const DeepCollectionEquality().equals(other._conflicts, _conflicts)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&const DeepCollectionEquality().equals(other._analytics, _analytics)&&(identical(other.generatedDate, generatedDate) || other.generatedDate == generatedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,fullToken,tap,const DeepCollectionEquality().hash(_name),desc,homepage,version,url,sha256,const DeepCollectionEquality().hash(_dependsOn),const DeepCollectionEquality().hash(_conflicts),autoUpdates,deprecated,disabled,const DeepCollectionEquality().hash(_analytics),generatedDate);

@override
String toString() {
  return 'CaskDetail(token: $token, fullToken: $fullToken, tap: $tap, name: $name, desc: $desc, homepage: $homepage, version: $version, url: $url, sha256: $sha256, dependsOn: $dependsOn, conflicts: $conflicts, autoUpdates: $autoUpdates, deprecated: $deprecated, disabled: $disabled, analytics: $analytics, generatedDate: $generatedDate)';
}


}

/// @nodoc
abstract mixin class _$CaskDetailCopyWith<$Res> implements $CaskDetailCopyWith<$Res> {
  factory _$CaskDetailCopyWith(_CaskDetail value, $Res Function(_CaskDetail) _then) = __$CaskDetailCopyWithImpl;
@override @useResult
$Res call({
 String token,@JsonKey(name: 'full_token') String? fullToken, String? tap, List<String>? name, String desc, String homepage, String version, String? url, String? sha256,@JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn, List<String>? conflicts,@JsonKey(name: 'auto_updates') bool? autoUpdates, bool deprecated, bool disabled, Map<String, dynamic>? analytics,@JsonKey(name: 'generated_date') String? generatedDate
});




}
/// @nodoc
class __$CaskDetailCopyWithImpl<$Res>
    implements _$CaskDetailCopyWith<$Res> {
  __$CaskDetailCopyWithImpl(this._self, this._then);

  final _CaskDetail _self;
  final $Res Function(_CaskDetail) _then;

/// Create a copy of CaskDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? fullToken = freezed,Object? tap = freezed,Object? name = freezed,Object? desc = null,Object? homepage = null,Object? version = null,Object? url = freezed,Object? sha256 = freezed,Object? dependsOn = freezed,Object? conflicts = freezed,Object? autoUpdates = freezed,Object? deprecated = null,Object? disabled = null,Object? analytics = freezed,Object? generatedDate = freezed,}) {
  return _then(_CaskDetail(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,fullToken: freezed == fullToken ? _self.fullToken : fullToken // ignore: cast_nullable_to_non_nullable
as String?,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as List<String>?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,sha256: freezed == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String?,dependsOn: freezed == dependsOn ? _self._dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,conflicts: freezed == conflicts ? _self._conflicts : conflicts // ignore: cast_nullable_to_non_nullable
as List<String>?,autoUpdates: freezed == autoUpdates ? _self.autoUpdates : autoUpdates // ignore: cast_nullable_to_non_nullable
as bool?,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,analytics: freezed == analytics ? _self._analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,generatedDate: freezed == generatedDate ? _self.generatedDate : generatedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AnalyticsData {

 String get category;@JsonKey(name: 'total_items') int get totalItems;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String get endDate;@JsonKey(name: 'total_count') int get totalCount;/// Map of formula name -> install count.
 Map<String, int> get items;
/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsDataCopyWith<AnalyticsData> get copyWith => _$AnalyticsDataCopyWithImpl<AnalyticsData>(this as AnalyticsData, _$identity);

  /// Serializes this AnalyticsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsData&&(identical(other.category, category) || other.category == category)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,totalItems,startDate,endDate,totalCount,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'AnalyticsData(category: $category, totalItems: $totalItems, startDate: $startDate, endDate: $endDate, totalCount: $totalCount, items: $items)';
}


}

/// @nodoc
abstract mixin class $AnalyticsDataCopyWith<$Res>  {
  factory $AnalyticsDataCopyWith(AnalyticsData value, $Res Function(AnalyticsData) _then) = _$AnalyticsDataCopyWithImpl;
@useResult
$Res call({
 String category,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_count') int totalCount, Map<String, int> items
});




}
/// @nodoc
class _$AnalyticsDataCopyWithImpl<$Res>
    implements $AnalyticsDataCopyWith<$Res> {
  _$AnalyticsDataCopyWithImpl(this._self, this._then);

  final AnalyticsData _self;
  final $Res Function(AnalyticsData) _then;

/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? totalItems = null,Object? startDate = null,Object? endDate = null,Object? totalCount = null,Object? items = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsData].
extension AnalyticsDataPatterns on AnalyticsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsData value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsData value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  Map<String, int> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  Map<String, int> items)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsData():
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  Map<String, int> items)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsData implements AnalyticsData {
  const _AnalyticsData({required this.category, @JsonKey(name: 'total_items') required this.totalItems, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'total_count') required this.totalCount, required final  Map<String, int> items}): _items = items;
  factory _AnalyticsData.fromJson(Map<String, dynamic> json) => _$AnalyticsDataFromJson(json);

@override final  String category;
@override@JsonKey(name: 'total_items') final  int totalItems;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String endDate;
@override@JsonKey(name: 'total_count') final  int totalCount;
/// Map of formula name -> install count.
 final  Map<String, int> _items;
/// Map of formula name -> install count.
@override Map<String, int> get items {
  if (_items is EqualUnmodifiableMapView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_items);
}


/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsDataCopyWith<_AnalyticsData> get copyWith => __$AnalyticsDataCopyWithImpl<_AnalyticsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsData&&(identical(other.category, category) || other.category == category)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,totalItems,startDate,endDate,totalCount,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'AnalyticsData(category: $category, totalItems: $totalItems, startDate: $startDate, endDate: $endDate, totalCount: $totalCount, items: $items)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsDataCopyWith<$Res> implements $AnalyticsDataCopyWith<$Res> {
  factory _$AnalyticsDataCopyWith(_AnalyticsData value, $Res Function(_AnalyticsData) _then) = __$AnalyticsDataCopyWithImpl;
@override @useResult
$Res call({
 String category,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_count') int totalCount, Map<String, int> items
});




}
/// @nodoc
class __$AnalyticsDataCopyWithImpl<$Res>
    implements _$AnalyticsDataCopyWith<$Res> {
  __$AnalyticsDataCopyWithImpl(this._self, this._then);

  final _AnalyticsData _self;
  final $Res Function(_AnalyticsData) _then;

/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? totalItems = null,Object? startDate = null,Object? endDate = null,Object? totalCount = null,Object? items = null,}) {
  return _then(_AnalyticsData(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

// dart format on
