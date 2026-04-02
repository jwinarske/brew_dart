// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tap {

 String get name; String? get user; String? get repo; String? get path; bool? get installed; bool? get official;@JsonKey(name: 'formula_names') List<String> get formulaNames;@JsonKey(name: 'formula_files') List<String> get formulaFiles;@JsonKey(name: 'cask_tokens') List<String> get caskTokens;@JsonKey(name: 'cask_files') List<String> get caskFiles;@JsonKey(name: 'command_files') List<String> get commandFiles;@JsonKey(name: 'formula_count') int? get formulaCount;@JsonKey(name: 'cask_count') int? get caskCount; String? get remote;@JsonKey(name: 'custom_remote') bool? get customRemote;@JsonKey(name: 'private') bool? get isPrivate;
/// Create a copy of Tap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TapCopyWith<Tap> get copyWith => _$TapCopyWithImpl<Tap>(this as Tap, _$identity);

  /// Serializes this Tap to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tap&&(identical(other.name, name) || other.name == name)&&(identical(other.user, user) || other.user == user)&&(identical(other.repo, repo) || other.repo == repo)&&(identical(other.path, path) || other.path == path)&&(identical(other.installed, installed) || other.installed == installed)&&(identical(other.official, official) || other.official == official)&&const DeepCollectionEquality().equals(other.formulaNames, formulaNames)&&const DeepCollectionEquality().equals(other.formulaFiles, formulaFiles)&&const DeepCollectionEquality().equals(other.caskTokens, caskTokens)&&const DeepCollectionEquality().equals(other.caskFiles, caskFiles)&&const DeepCollectionEquality().equals(other.commandFiles, commandFiles)&&(identical(other.formulaCount, formulaCount) || other.formulaCount == formulaCount)&&(identical(other.caskCount, caskCount) || other.caskCount == caskCount)&&(identical(other.remote, remote) || other.remote == remote)&&(identical(other.customRemote, customRemote) || other.customRemote == customRemote)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,user,repo,path,installed,official,const DeepCollectionEquality().hash(formulaNames),const DeepCollectionEquality().hash(formulaFiles),const DeepCollectionEquality().hash(caskTokens),const DeepCollectionEquality().hash(caskFiles),const DeepCollectionEquality().hash(commandFiles),formulaCount,caskCount,remote,customRemote,isPrivate);

@override
String toString() {
  return 'Tap(name: $name, user: $user, repo: $repo, path: $path, installed: $installed, official: $official, formulaNames: $formulaNames, formulaFiles: $formulaFiles, caskTokens: $caskTokens, caskFiles: $caskFiles, commandFiles: $commandFiles, formulaCount: $formulaCount, caskCount: $caskCount, remote: $remote, customRemote: $customRemote, isPrivate: $isPrivate)';
}


}

/// @nodoc
abstract mixin class $TapCopyWith<$Res>  {
  factory $TapCopyWith(Tap value, $Res Function(Tap) _then) = _$TapCopyWithImpl;
@useResult
$Res call({
 String name, String? user, String? repo, String? path, bool? installed, bool? official,@JsonKey(name: 'formula_names') List<String> formulaNames,@JsonKey(name: 'formula_files') List<String> formulaFiles,@JsonKey(name: 'cask_tokens') List<String> caskTokens,@JsonKey(name: 'cask_files') List<String> caskFiles,@JsonKey(name: 'command_files') List<String> commandFiles,@JsonKey(name: 'formula_count') int? formulaCount,@JsonKey(name: 'cask_count') int? caskCount, String? remote,@JsonKey(name: 'custom_remote') bool? customRemote,@JsonKey(name: 'private') bool? isPrivate
});




}
/// @nodoc
class _$TapCopyWithImpl<$Res>
    implements $TapCopyWith<$Res> {
  _$TapCopyWithImpl(this._self, this._then);

  final Tap _self;
  final $Res Function(Tap) _then;

/// Create a copy of Tap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? user = freezed,Object? repo = freezed,Object? path = freezed,Object? installed = freezed,Object? official = freezed,Object? formulaNames = null,Object? formulaFiles = null,Object? caskTokens = null,Object? caskFiles = null,Object? commandFiles = null,Object? formulaCount = freezed,Object? caskCount = freezed,Object? remote = freezed,Object? customRemote = freezed,Object? isPrivate = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String?,repo: freezed == repo ? _self.repo : repo // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,installed: freezed == installed ? _self.installed : installed // ignore: cast_nullable_to_non_nullable
as bool?,official: freezed == official ? _self.official : official // ignore: cast_nullable_to_non_nullable
as bool?,formulaNames: null == formulaNames ? _self.formulaNames : formulaNames // ignore: cast_nullable_to_non_nullable
as List<String>,formulaFiles: null == formulaFiles ? _self.formulaFiles : formulaFiles // ignore: cast_nullable_to_non_nullable
as List<String>,caskTokens: null == caskTokens ? _self.caskTokens : caskTokens // ignore: cast_nullable_to_non_nullable
as List<String>,caskFiles: null == caskFiles ? _self.caskFiles : caskFiles // ignore: cast_nullable_to_non_nullable
as List<String>,commandFiles: null == commandFiles ? _self.commandFiles : commandFiles // ignore: cast_nullable_to_non_nullable
as List<String>,formulaCount: freezed == formulaCount ? _self.formulaCount : formulaCount // ignore: cast_nullable_to_non_nullable
as int?,caskCount: freezed == caskCount ? _self.caskCount : caskCount // ignore: cast_nullable_to_non_nullable
as int?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as String?,customRemote: freezed == customRemote ? _self.customRemote : customRemote // ignore: cast_nullable_to_non_nullable
as bool?,isPrivate: freezed == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tap].
extension TapPatterns on Tap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tap value)  $default,){
final _that = this;
switch (_that) {
case _Tap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tap value)?  $default,){
final _that = this;
switch (_that) {
case _Tap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? user,  String? repo,  String? path,  bool? installed,  bool? official, @JsonKey(name: 'formula_names')  List<String> formulaNames, @JsonKey(name: 'formula_files')  List<String> formulaFiles, @JsonKey(name: 'cask_tokens')  List<String> caskTokens, @JsonKey(name: 'cask_files')  List<String> caskFiles, @JsonKey(name: 'command_files')  List<String> commandFiles, @JsonKey(name: 'formula_count')  int? formulaCount, @JsonKey(name: 'cask_count')  int? caskCount,  String? remote, @JsonKey(name: 'custom_remote')  bool? customRemote, @JsonKey(name: 'private')  bool? isPrivate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tap() when $default != null:
return $default(_that.name,_that.user,_that.repo,_that.path,_that.installed,_that.official,_that.formulaNames,_that.formulaFiles,_that.caskTokens,_that.caskFiles,_that.commandFiles,_that.formulaCount,_that.caskCount,_that.remote,_that.customRemote,_that.isPrivate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? user,  String? repo,  String? path,  bool? installed,  bool? official, @JsonKey(name: 'formula_names')  List<String> formulaNames, @JsonKey(name: 'formula_files')  List<String> formulaFiles, @JsonKey(name: 'cask_tokens')  List<String> caskTokens, @JsonKey(name: 'cask_files')  List<String> caskFiles, @JsonKey(name: 'command_files')  List<String> commandFiles, @JsonKey(name: 'formula_count')  int? formulaCount, @JsonKey(name: 'cask_count')  int? caskCount,  String? remote, @JsonKey(name: 'custom_remote')  bool? customRemote, @JsonKey(name: 'private')  bool? isPrivate)  $default,) {final _that = this;
switch (_that) {
case _Tap():
return $default(_that.name,_that.user,_that.repo,_that.path,_that.installed,_that.official,_that.formulaNames,_that.formulaFiles,_that.caskTokens,_that.caskFiles,_that.commandFiles,_that.formulaCount,_that.caskCount,_that.remote,_that.customRemote,_that.isPrivate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? user,  String? repo,  String? path,  bool? installed,  bool? official, @JsonKey(name: 'formula_names')  List<String> formulaNames, @JsonKey(name: 'formula_files')  List<String> formulaFiles, @JsonKey(name: 'cask_tokens')  List<String> caskTokens, @JsonKey(name: 'cask_files')  List<String> caskFiles, @JsonKey(name: 'command_files')  List<String> commandFiles, @JsonKey(name: 'formula_count')  int? formulaCount, @JsonKey(name: 'cask_count')  int? caskCount,  String? remote, @JsonKey(name: 'custom_remote')  bool? customRemote, @JsonKey(name: 'private')  bool? isPrivate)?  $default,) {final _that = this;
switch (_that) {
case _Tap() when $default != null:
return $default(_that.name,_that.user,_that.repo,_that.path,_that.installed,_that.official,_that.formulaNames,_that.formulaFiles,_that.caskTokens,_that.caskFiles,_that.commandFiles,_that.formulaCount,_that.caskCount,_that.remote,_that.customRemote,_that.isPrivate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tap implements Tap {
  const _Tap({required this.name, this.user, this.repo, this.path, this.installed, this.official, @JsonKey(name: 'formula_names') final  List<String> formulaNames = const [], @JsonKey(name: 'formula_files') final  List<String> formulaFiles = const [], @JsonKey(name: 'cask_tokens') final  List<String> caskTokens = const [], @JsonKey(name: 'cask_files') final  List<String> caskFiles = const [], @JsonKey(name: 'command_files') final  List<String> commandFiles = const [], @JsonKey(name: 'formula_count') this.formulaCount, @JsonKey(name: 'cask_count') this.caskCount, this.remote, @JsonKey(name: 'custom_remote') this.customRemote, @JsonKey(name: 'private') this.isPrivate}): _formulaNames = formulaNames,_formulaFiles = formulaFiles,_caskTokens = caskTokens,_caskFiles = caskFiles,_commandFiles = commandFiles;
  factory _Tap.fromJson(Map<String, dynamic> json) => _$TapFromJson(json);

@override final  String name;
@override final  String? user;
@override final  String? repo;
@override final  String? path;
@override final  bool? installed;
@override final  bool? official;
 final  List<String> _formulaNames;
@override@JsonKey(name: 'formula_names') List<String> get formulaNames {
  if (_formulaNames is EqualUnmodifiableListView) return _formulaNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_formulaNames);
}

 final  List<String> _formulaFiles;
@override@JsonKey(name: 'formula_files') List<String> get formulaFiles {
  if (_formulaFiles is EqualUnmodifiableListView) return _formulaFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_formulaFiles);
}

 final  List<String> _caskTokens;
@override@JsonKey(name: 'cask_tokens') List<String> get caskTokens {
  if (_caskTokens is EqualUnmodifiableListView) return _caskTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_caskTokens);
}

 final  List<String> _caskFiles;
@override@JsonKey(name: 'cask_files') List<String> get caskFiles {
  if (_caskFiles is EqualUnmodifiableListView) return _caskFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_caskFiles);
}

 final  List<String> _commandFiles;
@override@JsonKey(name: 'command_files') List<String> get commandFiles {
  if (_commandFiles is EqualUnmodifiableListView) return _commandFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commandFiles);
}

@override@JsonKey(name: 'formula_count') final  int? formulaCount;
@override@JsonKey(name: 'cask_count') final  int? caskCount;
@override final  String? remote;
@override@JsonKey(name: 'custom_remote') final  bool? customRemote;
@override@JsonKey(name: 'private') final  bool? isPrivate;

/// Create a copy of Tap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TapCopyWith<_Tap> get copyWith => __$TapCopyWithImpl<_Tap>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TapToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tap&&(identical(other.name, name) || other.name == name)&&(identical(other.user, user) || other.user == user)&&(identical(other.repo, repo) || other.repo == repo)&&(identical(other.path, path) || other.path == path)&&(identical(other.installed, installed) || other.installed == installed)&&(identical(other.official, official) || other.official == official)&&const DeepCollectionEquality().equals(other._formulaNames, _formulaNames)&&const DeepCollectionEquality().equals(other._formulaFiles, _formulaFiles)&&const DeepCollectionEquality().equals(other._caskTokens, _caskTokens)&&const DeepCollectionEquality().equals(other._caskFiles, _caskFiles)&&const DeepCollectionEquality().equals(other._commandFiles, _commandFiles)&&(identical(other.formulaCount, formulaCount) || other.formulaCount == formulaCount)&&(identical(other.caskCount, caskCount) || other.caskCount == caskCount)&&(identical(other.remote, remote) || other.remote == remote)&&(identical(other.customRemote, customRemote) || other.customRemote == customRemote)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,user,repo,path,installed,official,const DeepCollectionEquality().hash(_formulaNames),const DeepCollectionEquality().hash(_formulaFiles),const DeepCollectionEquality().hash(_caskTokens),const DeepCollectionEquality().hash(_caskFiles),const DeepCollectionEquality().hash(_commandFiles),formulaCount,caskCount,remote,customRemote,isPrivate);

@override
String toString() {
  return 'Tap(name: $name, user: $user, repo: $repo, path: $path, installed: $installed, official: $official, formulaNames: $formulaNames, formulaFiles: $formulaFiles, caskTokens: $caskTokens, caskFiles: $caskFiles, commandFiles: $commandFiles, formulaCount: $formulaCount, caskCount: $caskCount, remote: $remote, customRemote: $customRemote, isPrivate: $isPrivate)';
}


}

/// @nodoc
abstract mixin class _$TapCopyWith<$Res> implements $TapCopyWith<$Res> {
  factory _$TapCopyWith(_Tap value, $Res Function(_Tap) _then) = __$TapCopyWithImpl;
@override @useResult
$Res call({
 String name, String? user, String? repo, String? path, bool? installed, bool? official,@JsonKey(name: 'formula_names') List<String> formulaNames,@JsonKey(name: 'formula_files') List<String> formulaFiles,@JsonKey(name: 'cask_tokens') List<String> caskTokens,@JsonKey(name: 'cask_files') List<String> caskFiles,@JsonKey(name: 'command_files') List<String> commandFiles,@JsonKey(name: 'formula_count') int? formulaCount,@JsonKey(name: 'cask_count') int? caskCount, String? remote,@JsonKey(name: 'custom_remote') bool? customRemote,@JsonKey(name: 'private') bool? isPrivate
});




}
/// @nodoc
class __$TapCopyWithImpl<$Res>
    implements _$TapCopyWith<$Res> {
  __$TapCopyWithImpl(this._self, this._then);

  final _Tap _self;
  final $Res Function(_Tap) _then;

/// Create a copy of Tap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? user = freezed,Object? repo = freezed,Object? path = freezed,Object? installed = freezed,Object? official = freezed,Object? formulaNames = null,Object? formulaFiles = null,Object? caskTokens = null,Object? caskFiles = null,Object? commandFiles = null,Object? formulaCount = freezed,Object? caskCount = freezed,Object? remote = freezed,Object? customRemote = freezed,Object? isPrivate = freezed,}) {
  return _then(_Tap(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String?,repo: freezed == repo ? _self.repo : repo // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,installed: freezed == installed ? _self.installed : installed // ignore: cast_nullable_to_non_nullable
as bool?,official: freezed == official ? _self.official : official // ignore: cast_nullable_to_non_nullable
as bool?,formulaNames: null == formulaNames ? _self._formulaNames : formulaNames // ignore: cast_nullable_to_non_nullable
as List<String>,formulaFiles: null == formulaFiles ? _self._formulaFiles : formulaFiles // ignore: cast_nullable_to_non_nullable
as List<String>,caskTokens: null == caskTokens ? _self._caskTokens : caskTokens // ignore: cast_nullable_to_non_nullable
as List<String>,caskFiles: null == caskFiles ? _self._caskFiles : caskFiles // ignore: cast_nullable_to_non_nullable
as List<String>,commandFiles: null == commandFiles ? _self._commandFiles : commandFiles // ignore: cast_nullable_to_non_nullable
as List<String>,formulaCount: freezed == formulaCount ? _self.formulaCount : formulaCount // ignore: cast_nullable_to_non_nullable
as int?,caskCount: freezed == caskCount ? _self.caskCount : caskCount // ignore: cast_nullable_to_non_nullable
as int?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as String?,customRemote: freezed == customRemote ? _self.customRemote : customRemote // ignore: cast_nullable_to_non_nullable
as bool?,isPrivate: freezed == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
