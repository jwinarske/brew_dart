// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrewService {

 String get name; ServiceStatus get status; String? get user; String? get file;
/// Create a copy of BrewService
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrewServiceCopyWith<BrewService> get copyWith => _$BrewServiceCopyWithImpl<BrewService>(this as BrewService, _$identity);

  /// Serializes this BrewService to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrewService&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&(identical(other.file, file) || other.file == file));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,status,user,file);

@override
String toString() {
  return 'BrewService(name: $name, status: $status, user: $user, file: $file)';
}


}

/// @nodoc
abstract mixin class $BrewServiceCopyWith<$Res>  {
  factory $BrewServiceCopyWith(BrewService value, $Res Function(BrewService) _then) = _$BrewServiceCopyWithImpl;
@useResult
$Res call({
 String name, ServiceStatus status, String? user, String? file
});




}
/// @nodoc
class _$BrewServiceCopyWithImpl<$Res>
    implements $BrewServiceCopyWith<$Res> {
  _$BrewServiceCopyWithImpl(this._self, this._then);

  final BrewService _self;
  final $Res Function(BrewService) _then;

/// Create a copy of BrewService
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? status = null,Object? user = freezed,Object? file = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ServiceStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String?,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BrewService].
extension BrewServicePatterns on BrewService {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrewService value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrewService() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrewService value)  $default,){
final _that = this;
switch (_that) {
case _BrewService():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrewService value)?  $default,){
final _that = this;
switch (_that) {
case _BrewService() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  ServiceStatus status,  String? user,  String? file)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrewService() when $default != null:
return $default(_that.name,_that.status,_that.user,_that.file);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  ServiceStatus status,  String? user,  String? file)  $default,) {final _that = this;
switch (_that) {
case _BrewService():
return $default(_that.name,_that.status,_that.user,_that.file);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  ServiceStatus status,  String? user,  String? file)?  $default,) {final _that = this;
switch (_that) {
case _BrewService() when $default != null:
return $default(_that.name,_that.status,_that.user,_that.file);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrewService implements BrewService {
  const _BrewService({required this.name, required this.status, this.user, this.file});
  factory _BrewService.fromJson(Map<String, dynamic> json) => _$BrewServiceFromJson(json);

@override final  String name;
@override final  ServiceStatus status;
@override final  String? user;
@override final  String? file;

/// Create a copy of BrewService
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrewServiceCopyWith<_BrewService> get copyWith => __$BrewServiceCopyWithImpl<_BrewService>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrewServiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrewService&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&(identical(other.file, file) || other.file == file));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,status,user,file);

@override
String toString() {
  return 'BrewService(name: $name, status: $status, user: $user, file: $file)';
}


}

/// @nodoc
abstract mixin class _$BrewServiceCopyWith<$Res> implements $BrewServiceCopyWith<$Res> {
  factory _$BrewServiceCopyWith(_BrewService value, $Res Function(_BrewService) _then) = __$BrewServiceCopyWithImpl;
@override @useResult
$Res call({
 String name, ServiceStatus status, String? user, String? file
});




}
/// @nodoc
class __$BrewServiceCopyWithImpl<$Res>
    implements _$BrewServiceCopyWith<$Res> {
  __$BrewServiceCopyWithImpl(this._self, this._then);

  final _BrewService _self;
  final $Res Function(_BrewService) _then;

/// Create a copy of BrewService
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? status = null,Object? user = freezed,Object? file = freezed,}) {
  return _then(_BrewService(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ServiceStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String?,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
