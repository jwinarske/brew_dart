// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formula.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormulaVersions {

 String get stable; String? get head; bool? get bottle;
/// Create a copy of FormulaVersions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaVersionsCopyWith<FormulaVersions> get copyWith => _$FormulaVersionsCopyWithImpl<FormulaVersions>(this as FormulaVersions, _$identity);

  /// Serializes this FormulaVersions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormulaVersions&&(identical(other.stable, stable) || other.stable == stable)&&(identical(other.head, head) || other.head == head)&&(identical(other.bottle, bottle) || other.bottle == bottle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stable,head,bottle);

@override
String toString() {
  return 'FormulaVersions(stable: $stable, head: $head, bottle: $bottle)';
}


}

/// @nodoc
abstract mixin class $FormulaVersionsCopyWith<$Res>  {
  factory $FormulaVersionsCopyWith(FormulaVersions value, $Res Function(FormulaVersions) _then) = _$FormulaVersionsCopyWithImpl;
@useResult
$Res call({
 String stable, String? head, bool? bottle
});




}
/// @nodoc
class _$FormulaVersionsCopyWithImpl<$Res>
    implements $FormulaVersionsCopyWith<$Res> {
  _$FormulaVersionsCopyWithImpl(this._self, this._then);

  final FormulaVersions _self;
  final $Res Function(FormulaVersions) _then;

/// Create a copy of FormulaVersions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stable = null,Object? head = freezed,Object? bottle = freezed,}) {
  return _then(_self.copyWith(
stable: null == stable ? _self.stable : stable // ignore: cast_nullable_to_non_nullable
as String,head: freezed == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String?,bottle: freezed == bottle ? _self.bottle : bottle // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [FormulaVersions].
extension FormulaVersionsPatterns on FormulaVersions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormulaVersions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormulaVersions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormulaVersions value)  $default,){
final _that = this;
switch (_that) {
case _FormulaVersions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormulaVersions value)?  $default,){
final _that = this;
switch (_that) {
case _FormulaVersions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String stable,  String? head,  bool? bottle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormulaVersions() when $default != null:
return $default(_that.stable,_that.head,_that.bottle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String stable,  String? head,  bool? bottle)  $default,) {final _that = this;
switch (_that) {
case _FormulaVersions():
return $default(_that.stable,_that.head,_that.bottle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String stable,  String? head,  bool? bottle)?  $default,) {final _that = this;
switch (_that) {
case _FormulaVersions() when $default != null:
return $default(_that.stable,_that.head,_that.bottle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormulaVersions implements FormulaVersions {
  const _FormulaVersions({required this.stable, this.head, this.bottle});
  factory _FormulaVersions.fromJson(Map<String, dynamic> json) => _$FormulaVersionsFromJson(json);

@override final  String stable;
@override final  String? head;
@override final  bool? bottle;

/// Create a copy of FormulaVersions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaVersionsCopyWith<_FormulaVersions> get copyWith => __$FormulaVersionsCopyWithImpl<_FormulaVersions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaVersionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormulaVersions&&(identical(other.stable, stable) || other.stable == stable)&&(identical(other.head, head) || other.head == head)&&(identical(other.bottle, bottle) || other.bottle == bottle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stable,head,bottle);

@override
String toString() {
  return 'FormulaVersions(stable: $stable, head: $head, bottle: $bottle)';
}


}

/// @nodoc
abstract mixin class _$FormulaVersionsCopyWith<$Res> implements $FormulaVersionsCopyWith<$Res> {
  factory _$FormulaVersionsCopyWith(_FormulaVersions value, $Res Function(_FormulaVersions) _then) = __$FormulaVersionsCopyWithImpl;
@override @useResult
$Res call({
 String stable, String? head, bool? bottle
});




}
/// @nodoc
class __$FormulaVersionsCopyWithImpl<$Res>
    implements _$FormulaVersionsCopyWith<$Res> {
  __$FormulaVersionsCopyWithImpl(this._self, this._then);

  final _FormulaVersions _self;
  final $Res Function(_FormulaVersions) _then;

/// Create a copy of FormulaVersions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stable = null,Object? head = freezed,Object? bottle = freezed,}) {
  return _then(_FormulaVersions(
stable: null == stable ? _self.stable : stable // ignore: cast_nullable_to_non_nullable
as String,head: freezed == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String?,bottle: freezed == bottle ? _self.bottle : bottle // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$InstalledVersion {

 String get version;@JsonKey(name: 'used_options') List<String>? get usedOptions;@JsonKey(name: 'built_as_bottle') bool? get builtAsBottle;@JsonKey(name: 'poured_from_bottle') bool? get pouredFromBottle; int? get time;@JsonKey(name: 'runtime_dependencies') List<RuntimeDependency>? get runtimeDependencies;@JsonKey(name: 'installed_as_dependency') bool? get installedAsDependency;@JsonKey(name: 'installed_on_request') bool? get installedOnRequest;
/// Create a copy of InstalledVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstalledVersionCopyWith<InstalledVersion> get copyWith => _$InstalledVersionCopyWithImpl<InstalledVersion>(this as InstalledVersion, _$identity);

  /// Serializes this InstalledVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InstalledVersion&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.usedOptions, usedOptions)&&(identical(other.builtAsBottle, builtAsBottle) || other.builtAsBottle == builtAsBottle)&&(identical(other.pouredFromBottle, pouredFromBottle) || other.pouredFromBottle == pouredFromBottle)&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other.runtimeDependencies, runtimeDependencies)&&(identical(other.installedAsDependency, installedAsDependency) || other.installedAsDependency == installedAsDependency)&&(identical(other.installedOnRequest, installedOnRequest) || other.installedOnRequest == installedOnRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,const DeepCollectionEquality().hash(usedOptions),builtAsBottle,pouredFromBottle,time,const DeepCollectionEquality().hash(runtimeDependencies),installedAsDependency,installedOnRequest);

@override
String toString() {
  return 'InstalledVersion(version: $version, usedOptions: $usedOptions, builtAsBottle: $builtAsBottle, pouredFromBottle: $pouredFromBottle, time: $time, runtimeDependencies: $runtimeDependencies, installedAsDependency: $installedAsDependency, installedOnRequest: $installedOnRequest)';
}


}

/// @nodoc
abstract mixin class $InstalledVersionCopyWith<$Res>  {
  factory $InstalledVersionCopyWith(InstalledVersion value, $Res Function(InstalledVersion) _then) = _$InstalledVersionCopyWithImpl;
@useResult
$Res call({
 String version,@JsonKey(name: 'used_options') List<String>? usedOptions,@JsonKey(name: 'built_as_bottle') bool? builtAsBottle,@JsonKey(name: 'poured_from_bottle') bool? pouredFromBottle, int? time,@JsonKey(name: 'runtime_dependencies') List<RuntimeDependency>? runtimeDependencies,@JsonKey(name: 'installed_as_dependency') bool? installedAsDependency,@JsonKey(name: 'installed_on_request') bool? installedOnRequest
});




}
/// @nodoc
class _$InstalledVersionCopyWithImpl<$Res>
    implements $InstalledVersionCopyWith<$Res> {
  _$InstalledVersionCopyWithImpl(this._self, this._then);

  final InstalledVersion _self;
  final $Res Function(InstalledVersion) _then;

/// Create a copy of InstalledVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? usedOptions = freezed,Object? builtAsBottle = freezed,Object? pouredFromBottle = freezed,Object? time = freezed,Object? runtimeDependencies = freezed,Object? installedAsDependency = freezed,Object? installedOnRequest = freezed,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,usedOptions: freezed == usedOptions ? _self.usedOptions : usedOptions // ignore: cast_nullable_to_non_nullable
as List<String>?,builtAsBottle: freezed == builtAsBottle ? _self.builtAsBottle : builtAsBottle // ignore: cast_nullable_to_non_nullable
as bool?,pouredFromBottle: freezed == pouredFromBottle ? _self.pouredFromBottle : pouredFromBottle // ignore: cast_nullable_to_non_nullable
as bool?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int?,runtimeDependencies: freezed == runtimeDependencies ? _self.runtimeDependencies : runtimeDependencies // ignore: cast_nullable_to_non_nullable
as List<RuntimeDependency>?,installedAsDependency: freezed == installedAsDependency ? _self.installedAsDependency : installedAsDependency // ignore: cast_nullable_to_non_nullable
as bool?,installedOnRequest: freezed == installedOnRequest ? _self.installedOnRequest : installedOnRequest // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [InstalledVersion].
extension InstalledVersionPatterns on InstalledVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InstalledVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InstalledVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InstalledVersion value)  $default,){
final _that = this;
switch (_that) {
case _InstalledVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InstalledVersion value)?  $default,){
final _that = this;
switch (_that) {
case _InstalledVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version, @JsonKey(name: 'used_options')  List<String>? usedOptions, @JsonKey(name: 'built_as_bottle')  bool? builtAsBottle, @JsonKey(name: 'poured_from_bottle')  bool? pouredFromBottle,  int? time, @JsonKey(name: 'runtime_dependencies')  List<RuntimeDependency>? runtimeDependencies, @JsonKey(name: 'installed_as_dependency')  bool? installedAsDependency, @JsonKey(name: 'installed_on_request')  bool? installedOnRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InstalledVersion() when $default != null:
return $default(_that.version,_that.usedOptions,_that.builtAsBottle,_that.pouredFromBottle,_that.time,_that.runtimeDependencies,_that.installedAsDependency,_that.installedOnRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version, @JsonKey(name: 'used_options')  List<String>? usedOptions, @JsonKey(name: 'built_as_bottle')  bool? builtAsBottle, @JsonKey(name: 'poured_from_bottle')  bool? pouredFromBottle,  int? time, @JsonKey(name: 'runtime_dependencies')  List<RuntimeDependency>? runtimeDependencies, @JsonKey(name: 'installed_as_dependency')  bool? installedAsDependency, @JsonKey(name: 'installed_on_request')  bool? installedOnRequest)  $default,) {final _that = this;
switch (_that) {
case _InstalledVersion():
return $default(_that.version,_that.usedOptions,_that.builtAsBottle,_that.pouredFromBottle,_that.time,_that.runtimeDependencies,_that.installedAsDependency,_that.installedOnRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version, @JsonKey(name: 'used_options')  List<String>? usedOptions, @JsonKey(name: 'built_as_bottle')  bool? builtAsBottle, @JsonKey(name: 'poured_from_bottle')  bool? pouredFromBottle,  int? time, @JsonKey(name: 'runtime_dependencies')  List<RuntimeDependency>? runtimeDependencies, @JsonKey(name: 'installed_as_dependency')  bool? installedAsDependency, @JsonKey(name: 'installed_on_request')  bool? installedOnRequest)?  $default,) {final _that = this;
switch (_that) {
case _InstalledVersion() when $default != null:
return $default(_that.version,_that.usedOptions,_that.builtAsBottle,_that.pouredFromBottle,_that.time,_that.runtimeDependencies,_that.installedAsDependency,_that.installedOnRequest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InstalledVersion implements InstalledVersion {
  const _InstalledVersion({required this.version, @JsonKey(name: 'used_options') final  List<String>? usedOptions, @JsonKey(name: 'built_as_bottle') this.builtAsBottle, @JsonKey(name: 'poured_from_bottle') this.pouredFromBottle, this.time, @JsonKey(name: 'runtime_dependencies') final  List<RuntimeDependency>? runtimeDependencies, @JsonKey(name: 'installed_as_dependency') this.installedAsDependency, @JsonKey(name: 'installed_on_request') this.installedOnRequest}): _usedOptions = usedOptions,_runtimeDependencies = runtimeDependencies;
  factory _InstalledVersion.fromJson(Map<String, dynamic> json) => _$InstalledVersionFromJson(json);

@override final  String version;
 final  List<String>? _usedOptions;
@override@JsonKey(name: 'used_options') List<String>? get usedOptions {
  final value = _usedOptions;
  if (value == null) return null;
  if (_usedOptions is EqualUnmodifiableListView) return _usedOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'built_as_bottle') final  bool? builtAsBottle;
@override@JsonKey(name: 'poured_from_bottle') final  bool? pouredFromBottle;
@override final  int? time;
 final  List<RuntimeDependency>? _runtimeDependencies;
@override@JsonKey(name: 'runtime_dependencies') List<RuntimeDependency>? get runtimeDependencies {
  final value = _runtimeDependencies;
  if (value == null) return null;
  if (_runtimeDependencies is EqualUnmodifiableListView) return _runtimeDependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'installed_as_dependency') final  bool? installedAsDependency;
@override@JsonKey(name: 'installed_on_request') final  bool? installedOnRequest;

/// Create a copy of InstalledVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstalledVersionCopyWith<_InstalledVersion> get copyWith => __$InstalledVersionCopyWithImpl<_InstalledVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstalledVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstalledVersion&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._usedOptions, _usedOptions)&&(identical(other.builtAsBottle, builtAsBottle) || other.builtAsBottle == builtAsBottle)&&(identical(other.pouredFromBottle, pouredFromBottle) || other.pouredFromBottle == pouredFromBottle)&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other._runtimeDependencies, _runtimeDependencies)&&(identical(other.installedAsDependency, installedAsDependency) || other.installedAsDependency == installedAsDependency)&&(identical(other.installedOnRequest, installedOnRequest) || other.installedOnRequest == installedOnRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,const DeepCollectionEquality().hash(_usedOptions),builtAsBottle,pouredFromBottle,time,const DeepCollectionEquality().hash(_runtimeDependencies),installedAsDependency,installedOnRequest);

@override
String toString() {
  return 'InstalledVersion(version: $version, usedOptions: $usedOptions, builtAsBottle: $builtAsBottle, pouredFromBottle: $pouredFromBottle, time: $time, runtimeDependencies: $runtimeDependencies, installedAsDependency: $installedAsDependency, installedOnRequest: $installedOnRequest)';
}


}

/// @nodoc
abstract mixin class _$InstalledVersionCopyWith<$Res> implements $InstalledVersionCopyWith<$Res> {
  factory _$InstalledVersionCopyWith(_InstalledVersion value, $Res Function(_InstalledVersion) _then) = __$InstalledVersionCopyWithImpl;
@override @useResult
$Res call({
 String version,@JsonKey(name: 'used_options') List<String>? usedOptions,@JsonKey(name: 'built_as_bottle') bool? builtAsBottle,@JsonKey(name: 'poured_from_bottle') bool? pouredFromBottle, int? time,@JsonKey(name: 'runtime_dependencies') List<RuntimeDependency>? runtimeDependencies,@JsonKey(name: 'installed_as_dependency') bool? installedAsDependency,@JsonKey(name: 'installed_on_request') bool? installedOnRequest
});




}
/// @nodoc
class __$InstalledVersionCopyWithImpl<$Res>
    implements _$InstalledVersionCopyWith<$Res> {
  __$InstalledVersionCopyWithImpl(this._self, this._then);

  final _InstalledVersion _self;
  final $Res Function(_InstalledVersion) _then;

/// Create a copy of InstalledVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? usedOptions = freezed,Object? builtAsBottle = freezed,Object? pouredFromBottle = freezed,Object? time = freezed,Object? runtimeDependencies = freezed,Object? installedAsDependency = freezed,Object? installedOnRequest = freezed,}) {
  return _then(_InstalledVersion(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,usedOptions: freezed == usedOptions ? _self._usedOptions : usedOptions // ignore: cast_nullable_to_non_nullable
as List<String>?,builtAsBottle: freezed == builtAsBottle ? _self.builtAsBottle : builtAsBottle // ignore: cast_nullable_to_non_nullable
as bool?,pouredFromBottle: freezed == pouredFromBottle ? _self.pouredFromBottle : pouredFromBottle // ignore: cast_nullable_to_non_nullable
as bool?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int?,runtimeDependencies: freezed == runtimeDependencies ? _self._runtimeDependencies : runtimeDependencies // ignore: cast_nullable_to_non_nullable
as List<RuntimeDependency>?,installedAsDependency: freezed == installedAsDependency ? _self.installedAsDependency : installedAsDependency // ignore: cast_nullable_to_non_nullable
as bool?,installedOnRequest: freezed == installedOnRequest ? _self.installedOnRequest : installedOnRequest // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$RuntimeDependency {

@JsonKey(name: 'full_name') String get fullName; String? get version; int? get revision;@JsonKey(name: 'pkg_version') String? get pkgVersion;@JsonKey(name: 'declared_directly') bool? get declaredDirectly;
/// Create a copy of RuntimeDependency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuntimeDependencyCopyWith<RuntimeDependency> get copyWith => _$RuntimeDependencyCopyWithImpl<RuntimeDependency>(this as RuntimeDependency, _$identity);

  /// Serializes this RuntimeDependency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuntimeDependency&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.version, version) || other.version == version)&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.pkgVersion, pkgVersion) || other.pkgVersion == pkgVersion)&&(identical(other.declaredDirectly, declaredDirectly) || other.declaredDirectly == declaredDirectly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,version,revision,pkgVersion,declaredDirectly);

@override
String toString() {
  return 'RuntimeDependency(fullName: $fullName, version: $version, revision: $revision, pkgVersion: $pkgVersion, declaredDirectly: $declaredDirectly)';
}


}

/// @nodoc
abstract mixin class $RuntimeDependencyCopyWith<$Res>  {
  factory $RuntimeDependencyCopyWith(RuntimeDependency value, $Res Function(RuntimeDependency) _then) = _$RuntimeDependencyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String fullName, String? version, int? revision,@JsonKey(name: 'pkg_version') String? pkgVersion,@JsonKey(name: 'declared_directly') bool? declaredDirectly
});




}
/// @nodoc
class _$RuntimeDependencyCopyWithImpl<$Res>
    implements $RuntimeDependencyCopyWith<$Res> {
  _$RuntimeDependencyCopyWithImpl(this._self, this._then);

  final RuntimeDependency _self;
  final $Res Function(RuntimeDependency) _then;

/// Create a copy of RuntimeDependency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? version = freezed,Object? revision = freezed,Object? pkgVersion = freezed,Object? declaredDirectly = freezed,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,revision: freezed == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int?,pkgVersion: freezed == pkgVersion ? _self.pkgVersion : pkgVersion // ignore: cast_nullable_to_non_nullable
as String?,declaredDirectly: freezed == declaredDirectly ? _self.declaredDirectly : declaredDirectly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [RuntimeDependency].
extension RuntimeDependencyPatterns on RuntimeDependency {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RuntimeDependency value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RuntimeDependency() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RuntimeDependency value)  $default,){
final _that = this;
switch (_that) {
case _RuntimeDependency():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RuntimeDependency value)?  $default,){
final _that = this;
switch (_that) {
case _RuntimeDependency() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName,  String? version,  int? revision, @JsonKey(name: 'pkg_version')  String? pkgVersion, @JsonKey(name: 'declared_directly')  bool? declaredDirectly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuntimeDependency() when $default != null:
return $default(_that.fullName,_that.version,_that.revision,_that.pkgVersion,_that.declaredDirectly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName,  String? version,  int? revision, @JsonKey(name: 'pkg_version')  String? pkgVersion, @JsonKey(name: 'declared_directly')  bool? declaredDirectly)  $default,) {final _that = this;
switch (_that) {
case _RuntimeDependency():
return $default(_that.fullName,_that.version,_that.revision,_that.pkgVersion,_that.declaredDirectly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String fullName,  String? version,  int? revision, @JsonKey(name: 'pkg_version')  String? pkgVersion, @JsonKey(name: 'declared_directly')  bool? declaredDirectly)?  $default,) {final _that = this;
switch (_that) {
case _RuntimeDependency() when $default != null:
return $default(_that.fullName,_that.version,_that.revision,_that.pkgVersion,_that.declaredDirectly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RuntimeDependency implements RuntimeDependency {
  const _RuntimeDependency({@JsonKey(name: 'full_name') required this.fullName, this.version, this.revision, @JsonKey(name: 'pkg_version') this.pkgVersion, @JsonKey(name: 'declared_directly') this.declaredDirectly});
  factory _RuntimeDependency.fromJson(Map<String, dynamic> json) => _$RuntimeDependencyFromJson(json);

@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String? version;
@override final  int? revision;
@override@JsonKey(name: 'pkg_version') final  String? pkgVersion;
@override@JsonKey(name: 'declared_directly') final  bool? declaredDirectly;

/// Create a copy of RuntimeDependency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuntimeDependencyCopyWith<_RuntimeDependency> get copyWith => __$RuntimeDependencyCopyWithImpl<_RuntimeDependency>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RuntimeDependencyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuntimeDependency&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.version, version) || other.version == version)&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.pkgVersion, pkgVersion) || other.pkgVersion == pkgVersion)&&(identical(other.declaredDirectly, declaredDirectly) || other.declaredDirectly == declaredDirectly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,version,revision,pkgVersion,declaredDirectly);

@override
String toString() {
  return 'RuntimeDependency(fullName: $fullName, version: $version, revision: $revision, pkgVersion: $pkgVersion, declaredDirectly: $declaredDirectly)';
}


}

/// @nodoc
abstract mixin class _$RuntimeDependencyCopyWith<$Res> implements $RuntimeDependencyCopyWith<$Res> {
  factory _$RuntimeDependencyCopyWith(_RuntimeDependency value, $Res Function(_RuntimeDependency) _then) = __$RuntimeDependencyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String fullName, String? version, int? revision,@JsonKey(name: 'pkg_version') String? pkgVersion,@JsonKey(name: 'declared_directly') bool? declaredDirectly
});




}
/// @nodoc
class __$RuntimeDependencyCopyWithImpl<$Res>
    implements _$RuntimeDependencyCopyWith<$Res> {
  __$RuntimeDependencyCopyWithImpl(this._self, this._then);

  final _RuntimeDependency _self;
  final $Res Function(_RuntimeDependency) _then;

/// Create a copy of RuntimeDependency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? version = freezed,Object? revision = freezed,Object? pkgVersion = freezed,Object? declaredDirectly = freezed,}) {
  return _then(_RuntimeDependency(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,revision: freezed == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int?,pkgVersion: freezed == pkgVersion ? _self.pkgVersion : pkgVersion // ignore: cast_nullable_to_non_nullable
as String?,declaredDirectly: freezed == declaredDirectly ? _self.declaredDirectly : declaredDirectly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Formula {

 String get name;@JsonKey(name: 'full_name') String get fullName; String? get tap; String get desc; String? get license; String get homepage; FormulaVersions get versions; Map<String, dynamic>? get urls; int? get revision;@JsonKey(name: 'version_scheme') int? get versionScheme; Map<String, dynamic>? get bottle;@JsonKey(name: 'keg_only') bool get kegOnly;@JsonKey(name: 'keg_only_reason') Map<String, dynamic>? get kegOnlyReason; dynamic get options; List<String> get dependencies;@JsonKey(name: 'build_dependencies') List<String> get buildDependencies;@JsonKey(name: 'optional_dependencies') List<String> get optionalDependencies;@JsonKey(name: 'recommended_dependencies') List<String> get recommendedDependencies;@JsonKey(name: 'uses_from_macos') List<dynamic>? get usesFromMacos; bool get deprecated;@JsonKey(name: 'deprecation_date') String? get deprecationDate;@JsonKey(name: 'deprecation_reason') String? get deprecationReason; bool get disabled;@JsonKey(name: 'disable_date') String? get disableDate;@JsonKey(name: 'disable_reason') String? get disableReason;@JsonKey(name: 'post_install_defined') bool? get postInstallDefined;@JsonKey(name: 'service') Map<String, dynamic>? get service;@JsonKey(name: 'tap_git_head') String? get tapGitHead; List<InstalledVersion>? get installed;@JsonKey(name: 'linked_keg') String? get linkedKeg; bool? get pinned; bool? get outdated;
/// Create a copy of Formula
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaCopyWith<Formula> get copyWith => _$FormulaCopyWithImpl<Formula>(this as Formula, _$identity);

  /// Serializes this Formula to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Formula&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.tap, tap) || other.tap == tap)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.license, license) || other.license == license)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.versions, versions) || other.versions == versions)&&const DeepCollectionEquality().equals(other.urls, urls)&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.versionScheme, versionScheme) || other.versionScheme == versionScheme)&&const DeepCollectionEquality().equals(other.bottle, bottle)&&(identical(other.kegOnly, kegOnly) || other.kegOnly == kegOnly)&&const DeepCollectionEquality().equals(other.kegOnlyReason, kegOnlyReason)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.dependencies, dependencies)&&const DeepCollectionEquality().equals(other.buildDependencies, buildDependencies)&&const DeepCollectionEquality().equals(other.optionalDependencies, optionalDependencies)&&const DeepCollectionEquality().equals(other.recommendedDependencies, recommendedDependencies)&&const DeepCollectionEquality().equals(other.usesFromMacos, usesFromMacos)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.deprecationDate, deprecationDate) || other.deprecationDate == deprecationDate)&&(identical(other.deprecationReason, deprecationReason) || other.deprecationReason == deprecationReason)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.disableDate, disableDate) || other.disableDate == disableDate)&&(identical(other.disableReason, disableReason) || other.disableReason == disableReason)&&(identical(other.postInstallDefined, postInstallDefined) || other.postInstallDefined == postInstallDefined)&&const DeepCollectionEquality().equals(other.service, service)&&(identical(other.tapGitHead, tapGitHead) || other.tapGitHead == tapGitHead)&&const DeepCollectionEquality().equals(other.installed, installed)&&(identical(other.linkedKeg, linkedKeg) || other.linkedKeg == linkedKeg)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.outdated, outdated) || other.outdated == outdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,fullName,tap,desc,license,homepage,versions,const DeepCollectionEquality().hash(urls),revision,versionScheme,const DeepCollectionEquality().hash(bottle),kegOnly,const DeepCollectionEquality().hash(kegOnlyReason),const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(dependencies),const DeepCollectionEquality().hash(buildDependencies),const DeepCollectionEquality().hash(optionalDependencies),const DeepCollectionEquality().hash(recommendedDependencies),const DeepCollectionEquality().hash(usesFromMacos),deprecated,deprecationDate,deprecationReason,disabled,disableDate,disableReason,postInstallDefined,const DeepCollectionEquality().hash(service),tapGitHead,const DeepCollectionEquality().hash(installed),linkedKeg,pinned,outdated]);

@override
String toString() {
  return 'Formula(name: $name, fullName: $fullName, tap: $tap, desc: $desc, license: $license, homepage: $homepage, versions: $versions, urls: $urls, revision: $revision, versionScheme: $versionScheme, bottle: $bottle, kegOnly: $kegOnly, kegOnlyReason: $kegOnlyReason, options: $options, dependencies: $dependencies, buildDependencies: $buildDependencies, optionalDependencies: $optionalDependencies, recommendedDependencies: $recommendedDependencies, usesFromMacos: $usesFromMacos, deprecated: $deprecated, deprecationDate: $deprecationDate, deprecationReason: $deprecationReason, disabled: $disabled, disableDate: $disableDate, disableReason: $disableReason, postInstallDefined: $postInstallDefined, service: $service, tapGitHead: $tapGitHead, installed: $installed, linkedKeg: $linkedKeg, pinned: $pinned, outdated: $outdated)';
}


}

/// @nodoc
abstract mixin class $FormulaCopyWith<$Res>  {
  factory $FormulaCopyWith(Formula value, $Res Function(Formula) _then) = _$FormulaCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'full_name') String fullName, String? tap, String desc, String? license, String homepage, FormulaVersions versions, Map<String, dynamic>? urls, int? revision,@JsonKey(name: 'version_scheme') int? versionScheme, Map<String, dynamic>? bottle,@JsonKey(name: 'keg_only') bool kegOnly,@JsonKey(name: 'keg_only_reason') Map<String, dynamic>? kegOnlyReason, dynamic options, List<String> dependencies,@JsonKey(name: 'build_dependencies') List<String> buildDependencies,@JsonKey(name: 'optional_dependencies') List<String> optionalDependencies,@JsonKey(name: 'recommended_dependencies') List<String> recommendedDependencies,@JsonKey(name: 'uses_from_macos') List<dynamic>? usesFromMacos, bool deprecated,@JsonKey(name: 'deprecation_date') String? deprecationDate,@JsonKey(name: 'deprecation_reason') String? deprecationReason, bool disabled,@JsonKey(name: 'disable_date') String? disableDate,@JsonKey(name: 'disable_reason') String? disableReason,@JsonKey(name: 'post_install_defined') bool? postInstallDefined,@JsonKey(name: 'service') Map<String, dynamic>? service,@JsonKey(name: 'tap_git_head') String? tapGitHead, List<InstalledVersion>? installed,@JsonKey(name: 'linked_keg') String? linkedKeg, bool? pinned, bool? outdated
});


$FormulaVersionsCopyWith<$Res> get versions;

}
/// @nodoc
class _$FormulaCopyWithImpl<$Res>
    implements $FormulaCopyWith<$Res> {
  _$FormulaCopyWithImpl(this._self, this._then);

  final Formula _self;
  final $Res Function(Formula) _then;

/// Create a copy of Formula
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? fullName = null,Object? tap = freezed,Object? desc = null,Object? license = freezed,Object? homepage = null,Object? versions = null,Object? urls = freezed,Object? revision = freezed,Object? versionScheme = freezed,Object? bottle = freezed,Object? kegOnly = null,Object? kegOnlyReason = freezed,Object? options = freezed,Object? dependencies = null,Object? buildDependencies = null,Object? optionalDependencies = null,Object? recommendedDependencies = null,Object? usesFromMacos = freezed,Object? deprecated = null,Object? deprecationDate = freezed,Object? deprecationReason = freezed,Object? disabled = null,Object? disableDate = freezed,Object? disableReason = freezed,Object? postInstallDefined = freezed,Object? service = freezed,Object? tapGitHead = freezed,Object? installed = freezed,Object? linkedKeg = freezed,Object? pinned = freezed,Object? outdated = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as FormulaVersions,urls: freezed == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,revision: freezed == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int?,versionScheme: freezed == versionScheme ? _self.versionScheme : versionScheme // ignore: cast_nullable_to_non_nullable
as int?,bottle: freezed == bottle ? _self.bottle : bottle // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,kegOnly: null == kegOnly ? _self.kegOnly : kegOnly // ignore: cast_nullable_to_non_nullable
as bool,kegOnlyReason: freezed == kegOnlyReason ? _self.kegOnlyReason : kegOnlyReason // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as dynamic,dependencies: null == dependencies ? _self.dependencies : dependencies // ignore: cast_nullable_to_non_nullable
as List<String>,buildDependencies: null == buildDependencies ? _self.buildDependencies : buildDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,optionalDependencies: null == optionalDependencies ? _self.optionalDependencies : optionalDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,recommendedDependencies: null == recommendedDependencies ? _self.recommendedDependencies : recommendedDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,usesFromMacos: freezed == usesFromMacos ? _self.usesFromMacos : usesFromMacos // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,deprecationDate: freezed == deprecationDate ? _self.deprecationDate : deprecationDate // ignore: cast_nullable_to_non_nullable
as String?,deprecationReason: freezed == deprecationReason ? _self.deprecationReason : deprecationReason // ignore: cast_nullable_to_non_nullable
as String?,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,disableDate: freezed == disableDate ? _self.disableDate : disableDate // ignore: cast_nullable_to_non_nullable
as String?,disableReason: freezed == disableReason ? _self.disableReason : disableReason // ignore: cast_nullable_to_non_nullable
as String?,postInstallDefined: freezed == postInstallDefined ? _self.postInstallDefined : postInstallDefined // ignore: cast_nullable_to_non_nullable
as bool?,service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,tapGitHead: freezed == tapGitHead ? _self.tapGitHead : tapGitHead // ignore: cast_nullable_to_non_nullable
as String?,installed: freezed == installed ? _self.installed : installed // ignore: cast_nullable_to_non_nullable
as List<InstalledVersion>?,linkedKeg: freezed == linkedKeg ? _self.linkedKeg : linkedKeg // ignore: cast_nullable_to_non_nullable
as String?,pinned: freezed == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool?,outdated: freezed == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of Formula
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormulaVersionsCopyWith<$Res> get versions {
  
  return $FormulaVersionsCopyWith<$Res>(_self.versions, (value) {
    return _then(_self.copyWith(versions: value));
  });
}
}


/// Adds pattern-matching-related methods to [Formula].
extension FormulaPatterns on Formula {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Formula value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Formula() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Formula value)  $default,){
final _that = this;
switch (_that) {
case _Formula():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Formula value)?  $default,){
final _that = this;
switch (_that) {
case _Formula() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'full_name')  String fullName,  String? tap,  String desc,  String? license,  String homepage,  FormulaVersions versions,  Map<String, dynamic>? urls,  int? revision, @JsonKey(name: 'version_scheme')  int? versionScheme,  Map<String, dynamic>? bottle, @JsonKey(name: 'keg_only')  bool kegOnly, @JsonKey(name: 'keg_only_reason')  Map<String, dynamic>? kegOnlyReason,  dynamic options,  List<String> dependencies, @JsonKey(name: 'build_dependencies')  List<String> buildDependencies, @JsonKey(name: 'optional_dependencies')  List<String> optionalDependencies, @JsonKey(name: 'recommended_dependencies')  List<String> recommendedDependencies, @JsonKey(name: 'uses_from_macos')  List<dynamic>? usesFromMacos,  bool deprecated, @JsonKey(name: 'deprecation_date')  String? deprecationDate, @JsonKey(name: 'deprecation_reason')  String? deprecationReason,  bool disabled, @JsonKey(name: 'disable_date')  String? disableDate, @JsonKey(name: 'disable_reason')  String? disableReason, @JsonKey(name: 'post_install_defined')  bool? postInstallDefined, @JsonKey(name: 'service')  Map<String, dynamic>? service, @JsonKey(name: 'tap_git_head')  String? tapGitHead,  List<InstalledVersion>? installed, @JsonKey(name: 'linked_keg')  String? linkedKeg,  bool? pinned,  bool? outdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Formula() when $default != null:
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.urls,_that.revision,_that.versionScheme,_that.bottle,_that.kegOnly,_that.kegOnlyReason,_that.options,_that.dependencies,_that.buildDependencies,_that.optionalDependencies,_that.recommendedDependencies,_that.usesFromMacos,_that.deprecated,_that.deprecationDate,_that.deprecationReason,_that.disabled,_that.disableDate,_that.disableReason,_that.postInstallDefined,_that.service,_that.tapGitHead,_that.installed,_that.linkedKeg,_that.pinned,_that.outdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'full_name')  String fullName,  String? tap,  String desc,  String? license,  String homepage,  FormulaVersions versions,  Map<String, dynamic>? urls,  int? revision, @JsonKey(name: 'version_scheme')  int? versionScheme,  Map<String, dynamic>? bottle, @JsonKey(name: 'keg_only')  bool kegOnly, @JsonKey(name: 'keg_only_reason')  Map<String, dynamic>? kegOnlyReason,  dynamic options,  List<String> dependencies, @JsonKey(name: 'build_dependencies')  List<String> buildDependencies, @JsonKey(name: 'optional_dependencies')  List<String> optionalDependencies, @JsonKey(name: 'recommended_dependencies')  List<String> recommendedDependencies, @JsonKey(name: 'uses_from_macos')  List<dynamic>? usesFromMacos,  bool deprecated, @JsonKey(name: 'deprecation_date')  String? deprecationDate, @JsonKey(name: 'deprecation_reason')  String? deprecationReason,  bool disabled, @JsonKey(name: 'disable_date')  String? disableDate, @JsonKey(name: 'disable_reason')  String? disableReason, @JsonKey(name: 'post_install_defined')  bool? postInstallDefined, @JsonKey(name: 'service')  Map<String, dynamic>? service, @JsonKey(name: 'tap_git_head')  String? tapGitHead,  List<InstalledVersion>? installed, @JsonKey(name: 'linked_keg')  String? linkedKeg,  bool? pinned,  bool? outdated)  $default,) {final _that = this;
switch (_that) {
case _Formula():
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.urls,_that.revision,_that.versionScheme,_that.bottle,_that.kegOnly,_that.kegOnlyReason,_that.options,_that.dependencies,_that.buildDependencies,_that.optionalDependencies,_that.recommendedDependencies,_that.usesFromMacos,_that.deprecated,_that.deprecationDate,_that.deprecationReason,_that.disabled,_that.disableDate,_that.disableReason,_that.postInstallDefined,_that.service,_that.tapGitHead,_that.installed,_that.linkedKeg,_that.pinned,_that.outdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'full_name')  String fullName,  String? tap,  String desc,  String? license,  String homepage,  FormulaVersions versions,  Map<String, dynamic>? urls,  int? revision, @JsonKey(name: 'version_scheme')  int? versionScheme,  Map<String, dynamic>? bottle, @JsonKey(name: 'keg_only')  bool kegOnly, @JsonKey(name: 'keg_only_reason')  Map<String, dynamic>? kegOnlyReason,  dynamic options,  List<String> dependencies, @JsonKey(name: 'build_dependencies')  List<String> buildDependencies, @JsonKey(name: 'optional_dependencies')  List<String> optionalDependencies, @JsonKey(name: 'recommended_dependencies')  List<String> recommendedDependencies, @JsonKey(name: 'uses_from_macos')  List<dynamic>? usesFromMacos,  bool deprecated, @JsonKey(name: 'deprecation_date')  String? deprecationDate, @JsonKey(name: 'deprecation_reason')  String? deprecationReason,  bool disabled, @JsonKey(name: 'disable_date')  String? disableDate, @JsonKey(name: 'disable_reason')  String? disableReason, @JsonKey(name: 'post_install_defined')  bool? postInstallDefined, @JsonKey(name: 'service')  Map<String, dynamic>? service, @JsonKey(name: 'tap_git_head')  String? tapGitHead,  List<InstalledVersion>? installed, @JsonKey(name: 'linked_keg')  String? linkedKeg,  bool? pinned,  bool? outdated)?  $default,) {final _that = this;
switch (_that) {
case _Formula() when $default != null:
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.urls,_that.revision,_that.versionScheme,_that.bottle,_that.kegOnly,_that.kegOnlyReason,_that.options,_that.dependencies,_that.buildDependencies,_that.optionalDependencies,_that.recommendedDependencies,_that.usesFromMacos,_that.deprecated,_that.deprecationDate,_that.deprecationReason,_that.disabled,_that.disableDate,_that.disableReason,_that.postInstallDefined,_that.service,_that.tapGitHead,_that.installed,_that.linkedKeg,_that.pinned,_that.outdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Formula implements Formula {
  const _Formula({required this.name, @JsonKey(name: 'full_name') required this.fullName, this.tap, required this.desc, this.license, required this.homepage, required this.versions, final  Map<String, dynamic>? urls, this.revision, @JsonKey(name: 'version_scheme') this.versionScheme, final  Map<String, dynamic>? bottle, @JsonKey(name: 'keg_only') this.kegOnly = false, @JsonKey(name: 'keg_only_reason') final  Map<String, dynamic>? kegOnlyReason, this.options, final  List<String> dependencies = const [], @JsonKey(name: 'build_dependencies') final  List<String> buildDependencies = const [], @JsonKey(name: 'optional_dependencies') final  List<String> optionalDependencies = const [], @JsonKey(name: 'recommended_dependencies') final  List<String> recommendedDependencies = const [], @JsonKey(name: 'uses_from_macos') final  List<dynamic>? usesFromMacos, this.deprecated = false, @JsonKey(name: 'deprecation_date') this.deprecationDate, @JsonKey(name: 'deprecation_reason') this.deprecationReason, this.disabled = false, @JsonKey(name: 'disable_date') this.disableDate, @JsonKey(name: 'disable_reason') this.disableReason, @JsonKey(name: 'post_install_defined') this.postInstallDefined, @JsonKey(name: 'service') final  Map<String, dynamic>? service, @JsonKey(name: 'tap_git_head') this.tapGitHead, final  List<InstalledVersion>? installed, @JsonKey(name: 'linked_keg') this.linkedKeg, this.pinned, this.outdated}): _urls = urls,_bottle = bottle,_kegOnlyReason = kegOnlyReason,_dependencies = dependencies,_buildDependencies = buildDependencies,_optionalDependencies = optionalDependencies,_recommendedDependencies = recommendedDependencies,_usesFromMacos = usesFromMacos,_service = service,_installed = installed;
  factory _Formula.fromJson(Map<String, dynamic> json) => _$FormulaFromJson(json);

@override final  String name;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String? tap;
@override final  String desc;
@override final  String? license;
@override final  String homepage;
@override final  FormulaVersions versions;
 final  Map<String, dynamic>? _urls;
@override Map<String, dynamic>? get urls {
  final value = _urls;
  if (value == null) return null;
  if (_urls is EqualUnmodifiableMapView) return _urls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  int? revision;
@override@JsonKey(name: 'version_scheme') final  int? versionScheme;
 final  Map<String, dynamic>? _bottle;
@override Map<String, dynamic>? get bottle {
  final value = _bottle;
  if (value == null) return null;
  if (_bottle is EqualUnmodifiableMapView) return _bottle;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'keg_only') final  bool kegOnly;
 final  Map<String, dynamic>? _kegOnlyReason;
@override@JsonKey(name: 'keg_only_reason') Map<String, dynamic>? get kegOnlyReason {
  final value = _kegOnlyReason;
  if (value == null) return null;
  if (_kegOnlyReason is EqualUnmodifiableMapView) return _kegOnlyReason;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  dynamic options;
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

 final  List<String> _recommendedDependencies;
@override@JsonKey(name: 'recommended_dependencies') List<String> get recommendedDependencies {
  if (_recommendedDependencies is EqualUnmodifiableListView) return _recommendedDependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendedDependencies);
}

 final  List<dynamic>? _usesFromMacos;
@override@JsonKey(name: 'uses_from_macos') List<dynamic>? get usesFromMacos {
  final value = _usesFromMacos;
  if (value == null) return null;
  if (_usesFromMacos is EqualUnmodifiableListView) return _usesFromMacos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool deprecated;
@override@JsonKey(name: 'deprecation_date') final  String? deprecationDate;
@override@JsonKey(name: 'deprecation_reason') final  String? deprecationReason;
@override@JsonKey() final  bool disabled;
@override@JsonKey(name: 'disable_date') final  String? disableDate;
@override@JsonKey(name: 'disable_reason') final  String? disableReason;
@override@JsonKey(name: 'post_install_defined') final  bool? postInstallDefined;
 final  Map<String, dynamic>? _service;
@override@JsonKey(name: 'service') Map<String, dynamic>? get service {
  final value = _service;
  if (value == null) return null;
  if (_service is EqualUnmodifiableMapView) return _service;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'tap_git_head') final  String? tapGitHead;
 final  List<InstalledVersion>? _installed;
@override List<InstalledVersion>? get installed {
  final value = _installed;
  if (value == null) return null;
  if (_installed is EqualUnmodifiableListView) return _installed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'linked_keg') final  String? linkedKeg;
@override final  bool? pinned;
@override final  bool? outdated;

/// Create a copy of Formula
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaCopyWith<_Formula> get copyWith => __$FormulaCopyWithImpl<_Formula>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Formula&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.tap, tap) || other.tap == tap)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.license, license) || other.license == license)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.versions, versions) || other.versions == versions)&&const DeepCollectionEquality().equals(other._urls, _urls)&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.versionScheme, versionScheme) || other.versionScheme == versionScheme)&&const DeepCollectionEquality().equals(other._bottle, _bottle)&&(identical(other.kegOnly, kegOnly) || other.kegOnly == kegOnly)&&const DeepCollectionEquality().equals(other._kegOnlyReason, _kegOnlyReason)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other._dependencies, _dependencies)&&const DeepCollectionEquality().equals(other._buildDependencies, _buildDependencies)&&const DeepCollectionEquality().equals(other._optionalDependencies, _optionalDependencies)&&const DeepCollectionEquality().equals(other._recommendedDependencies, _recommendedDependencies)&&const DeepCollectionEquality().equals(other._usesFromMacos, _usesFromMacos)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.deprecationDate, deprecationDate) || other.deprecationDate == deprecationDate)&&(identical(other.deprecationReason, deprecationReason) || other.deprecationReason == deprecationReason)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.disableDate, disableDate) || other.disableDate == disableDate)&&(identical(other.disableReason, disableReason) || other.disableReason == disableReason)&&(identical(other.postInstallDefined, postInstallDefined) || other.postInstallDefined == postInstallDefined)&&const DeepCollectionEquality().equals(other._service, _service)&&(identical(other.tapGitHead, tapGitHead) || other.tapGitHead == tapGitHead)&&const DeepCollectionEquality().equals(other._installed, _installed)&&(identical(other.linkedKeg, linkedKeg) || other.linkedKeg == linkedKeg)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.outdated, outdated) || other.outdated == outdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,fullName,tap,desc,license,homepage,versions,const DeepCollectionEquality().hash(_urls),revision,versionScheme,const DeepCollectionEquality().hash(_bottle),kegOnly,const DeepCollectionEquality().hash(_kegOnlyReason),const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(_dependencies),const DeepCollectionEquality().hash(_buildDependencies),const DeepCollectionEquality().hash(_optionalDependencies),const DeepCollectionEquality().hash(_recommendedDependencies),const DeepCollectionEquality().hash(_usesFromMacos),deprecated,deprecationDate,deprecationReason,disabled,disableDate,disableReason,postInstallDefined,const DeepCollectionEquality().hash(_service),tapGitHead,const DeepCollectionEquality().hash(_installed),linkedKeg,pinned,outdated]);

@override
String toString() {
  return 'Formula(name: $name, fullName: $fullName, tap: $tap, desc: $desc, license: $license, homepage: $homepage, versions: $versions, urls: $urls, revision: $revision, versionScheme: $versionScheme, bottle: $bottle, kegOnly: $kegOnly, kegOnlyReason: $kegOnlyReason, options: $options, dependencies: $dependencies, buildDependencies: $buildDependencies, optionalDependencies: $optionalDependencies, recommendedDependencies: $recommendedDependencies, usesFromMacos: $usesFromMacos, deprecated: $deprecated, deprecationDate: $deprecationDate, deprecationReason: $deprecationReason, disabled: $disabled, disableDate: $disableDate, disableReason: $disableReason, postInstallDefined: $postInstallDefined, service: $service, tapGitHead: $tapGitHead, installed: $installed, linkedKeg: $linkedKeg, pinned: $pinned, outdated: $outdated)';
}


}

/// @nodoc
abstract mixin class _$FormulaCopyWith<$Res> implements $FormulaCopyWith<$Res> {
  factory _$FormulaCopyWith(_Formula value, $Res Function(_Formula) _then) = __$FormulaCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'full_name') String fullName, String? tap, String desc, String? license, String homepage, FormulaVersions versions, Map<String, dynamic>? urls, int? revision,@JsonKey(name: 'version_scheme') int? versionScheme, Map<String, dynamic>? bottle,@JsonKey(name: 'keg_only') bool kegOnly,@JsonKey(name: 'keg_only_reason') Map<String, dynamic>? kegOnlyReason, dynamic options, List<String> dependencies,@JsonKey(name: 'build_dependencies') List<String> buildDependencies,@JsonKey(name: 'optional_dependencies') List<String> optionalDependencies,@JsonKey(name: 'recommended_dependencies') List<String> recommendedDependencies,@JsonKey(name: 'uses_from_macos') List<dynamic>? usesFromMacos, bool deprecated,@JsonKey(name: 'deprecation_date') String? deprecationDate,@JsonKey(name: 'deprecation_reason') String? deprecationReason, bool disabled,@JsonKey(name: 'disable_date') String? disableDate,@JsonKey(name: 'disable_reason') String? disableReason,@JsonKey(name: 'post_install_defined') bool? postInstallDefined,@JsonKey(name: 'service') Map<String, dynamic>? service,@JsonKey(name: 'tap_git_head') String? tapGitHead, List<InstalledVersion>? installed,@JsonKey(name: 'linked_keg') String? linkedKeg, bool? pinned, bool? outdated
});


@override $FormulaVersionsCopyWith<$Res> get versions;

}
/// @nodoc
class __$FormulaCopyWithImpl<$Res>
    implements _$FormulaCopyWith<$Res> {
  __$FormulaCopyWithImpl(this._self, this._then);

  final _Formula _self;
  final $Res Function(_Formula) _then;

/// Create a copy of Formula
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? fullName = null,Object? tap = freezed,Object? desc = null,Object? license = freezed,Object? homepage = null,Object? versions = null,Object? urls = freezed,Object? revision = freezed,Object? versionScheme = freezed,Object? bottle = freezed,Object? kegOnly = null,Object? kegOnlyReason = freezed,Object? options = freezed,Object? dependencies = null,Object? buildDependencies = null,Object? optionalDependencies = null,Object? recommendedDependencies = null,Object? usesFromMacos = freezed,Object? deprecated = null,Object? deprecationDate = freezed,Object? deprecationReason = freezed,Object? disabled = null,Object? disableDate = freezed,Object? disableReason = freezed,Object? postInstallDefined = freezed,Object? service = freezed,Object? tapGitHead = freezed,Object? installed = freezed,Object? linkedKeg = freezed,Object? pinned = freezed,Object? outdated = freezed,}) {
  return _then(_Formula(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as FormulaVersions,urls: freezed == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,revision: freezed == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int?,versionScheme: freezed == versionScheme ? _self.versionScheme : versionScheme // ignore: cast_nullable_to_non_nullable
as int?,bottle: freezed == bottle ? _self._bottle : bottle // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,kegOnly: null == kegOnly ? _self.kegOnly : kegOnly // ignore: cast_nullable_to_non_nullable
as bool,kegOnlyReason: freezed == kegOnlyReason ? _self._kegOnlyReason : kegOnlyReason // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as dynamic,dependencies: null == dependencies ? _self._dependencies : dependencies // ignore: cast_nullable_to_non_nullable
as List<String>,buildDependencies: null == buildDependencies ? _self._buildDependencies : buildDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,optionalDependencies: null == optionalDependencies ? _self._optionalDependencies : optionalDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,recommendedDependencies: null == recommendedDependencies ? _self._recommendedDependencies : recommendedDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,usesFromMacos: freezed == usesFromMacos ? _self._usesFromMacos : usesFromMacos // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,deprecationDate: freezed == deprecationDate ? _self.deprecationDate : deprecationDate // ignore: cast_nullable_to_non_nullable
as String?,deprecationReason: freezed == deprecationReason ? _self.deprecationReason : deprecationReason // ignore: cast_nullable_to_non_nullable
as String?,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,disableDate: freezed == disableDate ? _self.disableDate : disableDate // ignore: cast_nullable_to_non_nullable
as String?,disableReason: freezed == disableReason ? _self.disableReason : disableReason // ignore: cast_nullable_to_non_nullable
as String?,postInstallDefined: freezed == postInstallDefined ? _self.postInstallDefined : postInstallDefined // ignore: cast_nullable_to_non_nullable
as bool?,service: freezed == service ? _self._service : service // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,tapGitHead: freezed == tapGitHead ? _self.tapGitHead : tapGitHead // ignore: cast_nullable_to_non_nullable
as String?,installed: freezed == installed ? _self._installed : installed // ignore: cast_nullable_to_non_nullable
as List<InstalledVersion>?,linkedKeg: freezed == linkedKeg ? _self.linkedKeg : linkedKeg // ignore: cast_nullable_to_non_nullable
as String?,pinned: freezed == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool?,outdated: freezed == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of Formula
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormulaVersionsCopyWith<$Res> get versions {
  
  return $FormulaVersionsCopyWith<$Res>(_self.versions, (value) {
    return _then(_self.copyWith(versions: value));
  });
}
}

// dart format on
