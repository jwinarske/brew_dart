// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outdated_package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OutdatedPackage {

 String get name;@JsonKey(name: 'current_version') String get currentVersion;@JsonKey(name: 'installed_versions') List<String> get installedVersions;@JsonKey(name: 'latest_version') String get latestVersion; bool get pinned;/// True if this is a cask, false if it's a formula.
 bool get isCask;
/// Create a copy of OutdatedPackage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutdatedPackageCopyWith<OutdatedPackage> get copyWith => _$OutdatedPackageCopyWithImpl<OutdatedPackage>(this as OutdatedPackage, _$identity);

  /// Serializes this OutdatedPackage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutdatedPackage&&(identical(other.name, name) || other.name == name)&&(identical(other.currentVersion, currentVersion) || other.currentVersion == currentVersion)&&const DeepCollectionEquality().equals(other.installedVersions, installedVersions)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.isCask, isCask) || other.isCask == isCask));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,currentVersion,const DeepCollectionEquality().hash(installedVersions),latestVersion,pinned,isCask);

@override
String toString() {
  return 'OutdatedPackage(name: $name, currentVersion: $currentVersion, installedVersions: $installedVersions, latestVersion: $latestVersion, pinned: $pinned, isCask: $isCask)';
}


}

/// @nodoc
abstract mixin class $OutdatedPackageCopyWith<$Res>  {
  factory $OutdatedPackageCopyWith(OutdatedPackage value, $Res Function(OutdatedPackage) _then) = _$OutdatedPackageCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'current_version') String currentVersion,@JsonKey(name: 'installed_versions') List<String> installedVersions,@JsonKey(name: 'latest_version') String latestVersion, bool pinned, bool isCask
});




}
/// @nodoc
class _$OutdatedPackageCopyWithImpl<$Res>
    implements $OutdatedPackageCopyWith<$Res> {
  _$OutdatedPackageCopyWithImpl(this._self, this._then);

  final OutdatedPackage _self;
  final $Res Function(OutdatedPackage) _then;

/// Create a copy of OutdatedPackage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? currentVersion = null,Object? installedVersions = null,Object? latestVersion = null,Object? pinned = null,Object? isCask = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currentVersion: null == currentVersion ? _self.currentVersion : currentVersion // ignore: cast_nullable_to_non_nullable
as String,installedVersions: null == installedVersions ? _self.installedVersions : installedVersions // ignore: cast_nullable_to_non_nullable
as List<String>,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,isCask: null == isCask ? _self.isCask : isCask // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OutdatedPackage].
extension OutdatedPackagePatterns on OutdatedPackage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutdatedPackage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutdatedPackage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutdatedPackage value)  $default,){
final _that = this;
switch (_that) {
case _OutdatedPackage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutdatedPackage value)?  $default,){
final _that = this;
switch (_that) {
case _OutdatedPackage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'current_version')  String currentVersion, @JsonKey(name: 'installed_versions')  List<String> installedVersions, @JsonKey(name: 'latest_version')  String latestVersion,  bool pinned,  bool isCask)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutdatedPackage() when $default != null:
return $default(_that.name,_that.currentVersion,_that.installedVersions,_that.latestVersion,_that.pinned,_that.isCask);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'current_version')  String currentVersion, @JsonKey(name: 'installed_versions')  List<String> installedVersions, @JsonKey(name: 'latest_version')  String latestVersion,  bool pinned,  bool isCask)  $default,) {final _that = this;
switch (_that) {
case _OutdatedPackage():
return $default(_that.name,_that.currentVersion,_that.installedVersions,_that.latestVersion,_that.pinned,_that.isCask);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'current_version')  String currentVersion, @JsonKey(name: 'installed_versions')  List<String> installedVersions, @JsonKey(name: 'latest_version')  String latestVersion,  bool pinned,  bool isCask)?  $default,) {final _that = this;
switch (_that) {
case _OutdatedPackage() when $default != null:
return $default(_that.name,_that.currentVersion,_that.installedVersions,_that.latestVersion,_that.pinned,_that.isCask);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutdatedPackage implements OutdatedPackage {
  const _OutdatedPackage({required this.name, @JsonKey(name: 'current_version') required this.currentVersion, @JsonKey(name: 'installed_versions') final  List<String> installedVersions = const [], @JsonKey(name: 'latest_version') required this.latestVersion, this.pinned = false, this.isCask = false}): _installedVersions = installedVersions;
  factory _OutdatedPackage.fromJson(Map<String, dynamic> json) => _$OutdatedPackageFromJson(json);

@override final  String name;
@override@JsonKey(name: 'current_version') final  String currentVersion;
 final  List<String> _installedVersions;
@override@JsonKey(name: 'installed_versions') List<String> get installedVersions {
  if (_installedVersions is EqualUnmodifiableListView) return _installedVersions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedVersions);
}

@override@JsonKey(name: 'latest_version') final  String latestVersion;
@override@JsonKey() final  bool pinned;
/// True if this is a cask, false if it's a formula.
@override@JsonKey() final  bool isCask;

/// Create a copy of OutdatedPackage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutdatedPackageCopyWith<_OutdatedPackage> get copyWith => __$OutdatedPackageCopyWithImpl<_OutdatedPackage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutdatedPackageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutdatedPackage&&(identical(other.name, name) || other.name == name)&&(identical(other.currentVersion, currentVersion) || other.currentVersion == currentVersion)&&const DeepCollectionEquality().equals(other._installedVersions, _installedVersions)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.isCask, isCask) || other.isCask == isCask));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,currentVersion,const DeepCollectionEquality().hash(_installedVersions),latestVersion,pinned,isCask);

@override
String toString() {
  return 'OutdatedPackage(name: $name, currentVersion: $currentVersion, installedVersions: $installedVersions, latestVersion: $latestVersion, pinned: $pinned, isCask: $isCask)';
}


}

/// @nodoc
abstract mixin class _$OutdatedPackageCopyWith<$Res> implements $OutdatedPackageCopyWith<$Res> {
  factory _$OutdatedPackageCopyWith(_OutdatedPackage value, $Res Function(_OutdatedPackage) _then) = __$OutdatedPackageCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'current_version') String currentVersion,@JsonKey(name: 'installed_versions') List<String> installedVersions,@JsonKey(name: 'latest_version') String latestVersion, bool pinned, bool isCask
});




}
/// @nodoc
class __$OutdatedPackageCopyWithImpl<$Res>
    implements _$OutdatedPackageCopyWith<$Res> {
  __$OutdatedPackageCopyWithImpl(this._self, this._then);

  final _OutdatedPackage _self;
  final $Res Function(_OutdatedPackage) _then;

/// Create a copy of OutdatedPackage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? currentVersion = null,Object? installedVersions = null,Object? latestVersion = null,Object? pinned = null,Object? isCask = null,}) {
  return _then(_OutdatedPackage(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currentVersion: null == currentVersion ? _self.currentVersion : currentVersion // ignore: cast_nullable_to_non_nullable
as String,installedVersions: null == installedVersions ? _self._installedVersions : installedVersions // ignore: cast_nullable_to_non_nullable
as List<String>,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,isCask: null == isCask ? _self.isCask : isCask // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
