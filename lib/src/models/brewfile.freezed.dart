// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brewfile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrewfileEntry {

 BrewfileEntryType get type; String get name;/// Optional arguments (e.g. `args: ["with-openssl"]`).
 Map<String, dynamic> get options;
/// Create a copy of BrewfileEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrewfileEntryCopyWith<BrewfileEntry> get copyWith => _$BrewfileEntryCopyWithImpl<BrewfileEntry>(this as BrewfileEntry, _$identity);

  /// Serializes this BrewfileEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrewfileEntry&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'BrewfileEntry(type: $type, name: $name, options: $options)';
}


}

/// @nodoc
abstract mixin class $BrewfileEntryCopyWith<$Res>  {
  factory $BrewfileEntryCopyWith(BrewfileEntry value, $Res Function(BrewfileEntry) _then) = _$BrewfileEntryCopyWithImpl;
@useResult
$Res call({
 BrewfileEntryType type, String name, Map<String, dynamic> options
});




}
/// @nodoc
class _$BrewfileEntryCopyWithImpl<$Res>
    implements $BrewfileEntryCopyWith<$Res> {
  _$BrewfileEntryCopyWithImpl(this._self, this._then);

  final BrewfileEntry _self;
  final $Res Function(BrewfileEntry) _then;

/// Create a copy of BrewfileEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? name = null,Object? options = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BrewfileEntryType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [BrewfileEntry].
extension BrewfileEntryPatterns on BrewfileEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrewfileEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrewfileEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrewfileEntry value)  $default,){
final _that = this;
switch (_that) {
case _BrewfileEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrewfileEntry value)?  $default,){
final _that = this;
switch (_that) {
case _BrewfileEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BrewfileEntryType type,  String name,  Map<String, dynamic> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrewfileEntry() when $default != null:
return $default(_that.type,_that.name,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BrewfileEntryType type,  String name,  Map<String, dynamic> options)  $default,) {final _that = this;
switch (_that) {
case _BrewfileEntry():
return $default(_that.type,_that.name,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BrewfileEntryType type,  String name,  Map<String, dynamic> options)?  $default,) {final _that = this;
switch (_that) {
case _BrewfileEntry() when $default != null:
return $default(_that.type,_that.name,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrewfileEntry implements BrewfileEntry {
  const _BrewfileEntry({required this.type, required this.name, final  Map<String, dynamic> options = const {}}): _options = options;
  factory _BrewfileEntry.fromJson(Map<String, dynamic> json) => _$BrewfileEntryFromJson(json);

@override final  BrewfileEntryType type;
@override final  String name;
/// Optional arguments (e.g. `args: ["with-openssl"]`).
 final  Map<String, dynamic> _options;
/// Optional arguments (e.g. `args: ["with-openssl"]`).
@override@JsonKey() Map<String, dynamic> get options {
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_options);
}


/// Create a copy of BrewfileEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrewfileEntryCopyWith<_BrewfileEntry> get copyWith => __$BrewfileEntryCopyWithImpl<_BrewfileEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrewfileEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrewfileEntry&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'BrewfileEntry(type: $type, name: $name, options: $options)';
}


}

/// @nodoc
abstract mixin class _$BrewfileEntryCopyWith<$Res> implements $BrewfileEntryCopyWith<$Res> {
  factory _$BrewfileEntryCopyWith(_BrewfileEntry value, $Res Function(_BrewfileEntry) _then) = __$BrewfileEntryCopyWithImpl;
@override @useResult
$Res call({
 BrewfileEntryType type, String name, Map<String, dynamic> options
});




}
/// @nodoc
class __$BrewfileEntryCopyWithImpl<$Res>
    implements _$BrewfileEntryCopyWith<$Res> {
  __$BrewfileEntryCopyWithImpl(this._self, this._then);

  final _BrewfileEntry _self;
  final $Res Function(_BrewfileEntry) _then;

/// Create a copy of BrewfileEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = null,Object? options = null,}) {
  return _then(_BrewfileEntry(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BrewfileEntryType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$Brewfile {

 List<BrewfileEntry> get entries;
/// Create a copy of Brewfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrewfileCopyWith<Brewfile> get copyWith => _$BrewfileCopyWithImpl<Brewfile>(this as Brewfile, _$identity);

  /// Serializes this Brewfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Brewfile&&const DeepCollectionEquality().equals(other.entries, entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(entries));

@override
String toString() {
  return 'Brewfile(entries: $entries)';
}


}

/// @nodoc
abstract mixin class $BrewfileCopyWith<$Res>  {
  factory $BrewfileCopyWith(Brewfile value, $Res Function(Brewfile) _then) = _$BrewfileCopyWithImpl;
@useResult
$Res call({
 List<BrewfileEntry> entries
});




}
/// @nodoc
class _$BrewfileCopyWithImpl<$Res>
    implements $BrewfileCopyWith<$Res> {
  _$BrewfileCopyWithImpl(this._self, this._then);

  final Brewfile _self;
  final $Res Function(Brewfile) _then;

/// Create a copy of Brewfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,}) {
  return _then(_self.copyWith(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<BrewfileEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [Brewfile].
extension BrewfilePatterns on Brewfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Brewfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Brewfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Brewfile value)  $default,){
final _that = this;
switch (_that) {
case _Brewfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Brewfile value)?  $default,){
final _that = this;
switch (_that) {
case _Brewfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BrewfileEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Brewfile() when $default != null:
return $default(_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BrewfileEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _Brewfile():
return $default(_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BrewfileEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _Brewfile() when $default != null:
return $default(_that.entries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Brewfile implements Brewfile {
  const _Brewfile({required final  List<BrewfileEntry> entries}): _entries = entries;
  factory _Brewfile.fromJson(Map<String, dynamic> json) => _$BrewfileFromJson(json);

 final  List<BrewfileEntry> _entries;
@override List<BrewfileEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of Brewfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrewfileCopyWith<_Brewfile> get copyWith => __$BrewfileCopyWithImpl<_Brewfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrewfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Brewfile&&const DeepCollectionEquality().equals(other._entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries));

@override
String toString() {
  return 'Brewfile(entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$BrewfileCopyWith<$Res> implements $BrewfileCopyWith<$Res> {
  factory _$BrewfileCopyWith(_Brewfile value, $Res Function(_Brewfile) _then) = __$BrewfileCopyWithImpl;
@override @useResult
$Res call({
 List<BrewfileEntry> entries
});




}
/// @nodoc
class __$BrewfileCopyWithImpl<$Res>
    implements _$BrewfileCopyWith<$Res> {
  __$BrewfileCopyWithImpl(this._self, this._then);

  final _Brewfile _self;
  final $Res Function(_Brewfile) _then;

/// Create a copy of Brewfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,}) {
  return _then(_Brewfile(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<BrewfileEntry>,
  ));
}


}

// dart format on
