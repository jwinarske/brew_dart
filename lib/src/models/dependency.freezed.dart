// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dependency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MissingDependency {

/// The formula that has missing dependencies.
 String get formula;/// The dependency names that are missing.
 List<String> get missingDeps;
/// Create a copy of MissingDependency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MissingDependencyCopyWith<MissingDependency> get copyWith => _$MissingDependencyCopyWithImpl<MissingDependency>(this as MissingDependency, _$identity);

  /// Serializes this MissingDependency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MissingDependency&&(identical(other.formula, formula) || other.formula == formula)&&const DeepCollectionEquality().equals(other.missingDeps, missingDeps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,formula,const DeepCollectionEquality().hash(missingDeps));

@override
String toString() {
  return 'MissingDependency(formula: $formula, missingDeps: $missingDeps)';
}


}

/// @nodoc
abstract mixin class $MissingDependencyCopyWith<$Res>  {
  factory $MissingDependencyCopyWith(MissingDependency value, $Res Function(MissingDependency) _then) = _$MissingDependencyCopyWithImpl;
@useResult
$Res call({
 String formula, List<String> missingDeps
});




}
/// @nodoc
class _$MissingDependencyCopyWithImpl<$Res>
    implements $MissingDependencyCopyWith<$Res> {
  _$MissingDependencyCopyWithImpl(this._self, this._then);

  final MissingDependency _self;
  final $Res Function(MissingDependency) _then;

/// Create a copy of MissingDependency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formula = null,Object? missingDeps = null,}) {
  return _then(_self.copyWith(
formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,missingDeps: null == missingDeps ? _self.missingDeps : missingDeps // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [MissingDependency].
extension MissingDependencyPatterns on MissingDependency {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MissingDependency value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MissingDependency() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MissingDependency value)  $default,){
final _that = this;
switch (_that) {
case _MissingDependency():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MissingDependency value)?  $default,){
final _that = this;
switch (_that) {
case _MissingDependency() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String formula,  List<String> missingDeps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MissingDependency() when $default != null:
return $default(_that.formula,_that.missingDeps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String formula,  List<String> missingDeps)  $default,) {final _that = this;
switch (_that) {
case _MissingDependency():
return $default(_that.formula,_that.missingDeps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String formula,  List<String> missingDeps)?  $default,) {final _that = this;
switch (_that) {
case _MissingDependency() when $default != null:
return $default(_that.formula,_that.missingDeps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MissingDependency implements MissingDependency {
  const _MissingDependency({required this.formula, required final  List<String> missingDeps}): _missingDeps = missingDeps;
  factory _MissingDependency.fromJson(Map<String, dynamic> json) => _$MissingDependencyFromJson(json);

/// The formula that has missing dependencies.
@override final  String formula;
/// The dependency names that are missing.
 final  List<String> _missingDeps;
/// The dependency names that are missing.
@override List<String> get missingDeps {
  if (_missingDeps is EqualUnmodifiableListView) return _missingDeps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missingDeps);
}


/// Create a copy of MissingDependency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MissingDependencyCopyWith<_MissingDependency> get copyWith => __$MissingDependencyCopyWithImpl<_MissingDependency>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MissingDependencyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MissingDependency&&(identical(other.formula, formula) || other.formula == formula)&&const DeepCollectionEquality().equals(other._missingDeps, _missingDeps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,formula,const DeepCollectionEquality().hash(_missingDeps));

@override
String toString() {
  return 'MissingDependency(formula: $formula, missingDeps: $missingDeps)';
}


}

/// @nodoc
abstract mixin class _$MissingDependencyCopyWith<$Res> implements $MissingDependencyCopyWith<$Res> {
  factory _$MissingDependencyCopyWith(_MissingDependency value, $Res Function(_MissingDependency) _then) = __$MissingDependencyCopyWithImpl;
@override @useResult
$Res call({
 String formula, List<String> missingDeps
});




}
/// @nodoc
class __$MissingDependencyCopyWithImpl<$Res>
    implements _$MissingDependencyCopyWith<$Res> {
  __$MissingDependencyCopyWithImpl(this._self, this._then);

  final _MissingDependency _self;
  final $Res Function(_MissingDependency) _then;

/// Create a copy of MissingDependency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formula = null,Object? missingDeps = null,}) {
  return _then(_MissingDependency(
formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,missingDeps: null == missingDeps ? _self._missingDeps : missingDeps // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
