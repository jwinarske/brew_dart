// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cask {

 String get token;@JsonKey(name: 'full_token') String? get fullToken; String? get tap; List<String>? get name; String get desc; String get homepage; String get version; String? get url;@JsonKey(name: 'url_specs') Map<String, dynamic>? get urlSpecs; String? get sha256; List<Map<String, dynamic>>? get artifacts; List<String>? get caveats;@JsonKey(name: 'depends_on') Map<String, dynamic>? get dependsOn; List<String>? get conflicts;@JsonKey(name: 'container') String? get container;@JsonKey(name: 'auto_updates') bool? get autoUpdates; bool get deprecated;@JsonKey(name: 'deprecation_date') String? get deprecationDate;@JsonKey(name: 'deprecation_reason') String? get deprecationReason; bool get disabled;@JsonKey(name: 'disable_date') String? get disableDate;@JsonKey(name: 'disable_reason') String? get disableReason;@JsonKey(name: 'tap_git_head') String? get tapGitHead;@JsonKey(name: 'installed') String? get installedVersion; bool? get outdated;
/// Create a copy of Cask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaskCopyWith<Cask> get copyWith => _$CaskCopyWithImpl<Cask>(this as Cask, _$identity);

  /// Serializes this Cask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cask&&(identical(other.token, token) || other.token == token)&&(identical(other.fullToken, fullToken) || other.fullToken == fullToken)&&(identical(other.tap, tap) || other.tap == tap)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.version, version) || other.version == version)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.urlSpecs, urlSpecs)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&const DeepCollectionEquality().equals(other.artifacts, artifacts)&&const DeepCollectionEquality().equals(other.caveats, caveats)&&const DeepCollectionEquality().equals(other.dependsOn, dependsOn)&&const DeepCollectionEquality().equals(other.conflicts, conflicts)&&(identical(other.container, container) || other.container == container)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.deprecationDate, deprecationDate) || other.deprecationDate == deprecationDate)&&(identical(other.deprecationReason, deprecationReason) || other.deprecationReason == deprecationReason)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.disableDate, disableDate) || other.disableDate == disableDate)&&(identical(other.disableReason, disableReason) || other.disableReason == disableReason)&&(identical(other.tapGitHead, tapGitHead) || other.tapGitHead == tapGitHead)&&(identical(other.installedVersion, installedVersion) || other.installedVersion == installedVersion)&&(identical(other.outdated, outdated) || other.outdated == outdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,token,fullToken,tap,const DeepCollectionEquality().hash(name),desc,homepage,version,url,const DeepCollectionEquality().hash(urlSpecs),sha256,const DeepCollectionEquality().hash(artifacts),const DeepCollectionEquality().hash(caveats),const DeepCollectionEquality().hash(dependsOn),const DeepCollectionEquality().hash(conflicts),container,autoUpdates,deprecated,deprecationDate,deprecationReason,disabled,disableDate,disableReason,tapGitHead,installedVersion,outdated]);

@override
String toString() {
  return 'Cask(token: $token, fullToken: $fullToken, tap: $tap, name: $name, desc: $desc, homepage: $homepage, version: $version, url: $url, urlSpecs: $urlSpecs, sha256: $sha256, artifacts: $artifacts, caveats: $caveats, dependsOn: $dependsOn, conflicts: $conflicts, container: $container, autoUpdates: $autoUpdates, deprecated: $deprecated, deprecationDate: $deprecationDate, deprecationReason: $deprecationReason, disabled: $disabled, disableDate: $disableDate, disableReason: $disableReason, tapGitHead: $tapGitHead, installedVersion: $installedVersion, outdated: $outdated)';
}


}

/// @nodoc
abstract mixin class $CaskCopyWith<$Res>  {
  factory $CaskCopyWith(Cask value, $Res Function(Cask) _then) = _$CaskCopyWithImpl;
@useResult
$Res call({
 String token,@JsonKey(name: 'full_token') String? fullToken, String? tap, List<String>? name, String desc, String homepage, String version, String? url,@JsonKey(name: 'url_specs') Map<String, dynamic>? urlSpecs, String? sha256, List<Map<String, dynamic>>? artifacts, List<String>? caveats,@JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn, List<String>? conflicts,@JsonKey(name: 'container') String? container,@JsonKey(name: 'auto_updates') bool? autoUpdates, bool deprecated,@JsonKey(name: 'deprecation_date') String? deprecationDate,@JsonKey(name: 'deprecation_reason') String? deprecationReason, bool disabled,@JsonKey(name: 'disable_date') String? disableDate,@JsonKey(name: 'disable_reason') String? disableReason,@JsonKey(name: 'tap_git_head') String? tapGitHead,@JsonKey(name: 'installed') String? installedVersion, bool? outdated
});




}
/// @nodoc
class _$CaskCopyWithImpl<$Res>
    implements $CaskCopyWith<$Res> {
  _$CaskCopyWithImpl(this._self, this._then);

  final Cask _self;
  final $Res Function(Cask) _then;

/// Create a copy of Cask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? fullToken = freezed,Object? tap = freezed,Object? name = freezed,Object? desc = null,Object? homepage = null,Object? version = null,Object? url = freezed,Object? urlSpecs = freezed,Object? sha256 = freezed,Object? artifacts = freezed,Object? caveats = freezed,Object? dependsOn = freezed,Object? conflicts = freezed,Object? container = freezed,Object? autoUpdates = freezed,Object? deprecated = null,Object? deprecationDate = freezed,Object? deprecationReason = freezed,Object? disabled = null,Object? disableDate = freezed,Object? disableReason = freezed,Object? tapGitHead = freezed,Object? installedVersion = freezed,Object? outdated = freezed,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,fullToken: freezed == fullToken ? _self.fullToken : fullToken // ignore: cast_nullable_to_non_nullable
as String?,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as List<String>?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlSpecs: freezed == urlSpecs ? _self.urlSpecs : urlSpecs // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,sha256: freezed == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String?,artifacts: freezed == artifacts ? _self.artifacts : artifacts // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,caveats: freezed == caveats ? _self.caveats : caveats // ignore: cast_nullable_to_non_nullable
as List<String>?,dependsOn: freezed == dependsOn ? _self.dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,conflicts: freezed == conflicts ? _self.conflicts : conflicts // ignore: cast_nullable_to_non_nullable
as List<String>?,container: freezed == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as String?,autoUpdates: freezed == autoUpdates ? _self.autoUpdates : autoUpdates // ignore: cast_nullable_to_non_nullable
as bool?,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,deprecationDate: freezed == deprecationDate ? _self.deprecationDate : deprecationDate // ignore: cast_nullable_to_non_nullable
as String?,deprecationReason: freezed == deprecationReason ? _self.deprecationReason : deprecationReason // ignore: cast_nullable_to_non_nullable
as String?,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,disableDate: freezed == disableDate ? _self.disableDate : disableDate // ignore: cast_nullable_to_non_nullable
as String?,disableReason: freezed == disableReason ? _self.disableReason : disableReason // ignore: cast_nullable_to_non_nullable
as String?,tapGitHead: freezed == tapGitHead ? _self.tapGitHead : tapGitHead // ignore: cast_nullable_to_non_nullable
as String?,installedVersion: freezed == installedVersion ? _self.installedVersion : installedVersion // ignore: cast_nullable_to_non_nullable
as String?,outdated: freezed == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Cask].
extension CaskPatterns on Cask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cask value)  $default,){
final _that = this;
switch (_that) {
case _Cask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cask value)?  $default,){
final _that = this;
switch (_that) {
case _Cask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  String? tap,  List<String>? name,  String desc,  String homepage,  String version,  String? url, @JsonKey(name: 'url_specs')  Map<String, dynamic>? urlSpecs,  String? sha256,  List<Map<String, dynamic>>? artifacts,  List<String>? caveats, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  List<String>? conflicts, @JsonKey(name: 'container')  String? container, @JsonKey(name: 'auto_updates')  bool? autoUpdates,  bool deprecated, @JsonKey(name: 'deprecation_date')  String? deprecationDate, @JsonKey(name: 'deprecation_reason')  String? deprecationReason,  bool disabled, @JsonKey(name: 'disable_date')  String? disableDate, @JsonKey(name: 'disable_reason')  String? disableReason, @JsonKey(name: 'tap_git_head')  String? tapGitHead, @JsonKey(name: 'installed')  String? installedVersion,  bool? outdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cask() when $default != null:
return $default(_that.token,_that.fullToken,_that.tap,_that.name,_that.desc,_that.homepage,_that.version,_that.url,_that.urlSpecs,_that.sha256,_that.artifacts,_that.caveats,_that.dependsOn,_that.conflicts,_that.container,_that.autoUpdates,_that.deprecated,_that.deprecationDate,_that.deprecationReason,_that.disabled,_that.disableDate,_that.disableReason,_that.tapGitHead,_that.installedVersion,_that.outdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  String? tap,  List<String>? name,  String desc,  String homepage,  String version,  String? url, @JsonKey(name: 'url_specs')  Map<String, dynamic>? urlSpecs,  String? sha256,  List<Map<String, dynamic>>? artifacts,  List<String>? caveats, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  List<String>? conflicts, @JsonKey(name: 'container')  String? container, @JsonKey(name: 'auto_updates')  bool? autoUpdates,  bool deprecated, @JsonKey(name: 'deprecation_date')  String? deprecationDate, @JsonKey(name: 'deprecation_reason')  String? deprecationReason,  bool disabled, @JsonKey(name: 'disable_date')  String? disableDate, @JsonKey(name: 'disable_reason')  String? disableReason, @JsonKey(name: 'tap_git_head')  String? tapGitHead, @JsonKey(name: 'installed')  String? installedVersion,  bool? outdated)  $default,) {final _that = this;
switch (_that) {
case _Cask():
return $default(_that.token,_that.fullToken,_that.tap,_that.name,_that.desc,_that.homepage,_that.version,_that.url,_that.urlSpecs,_that.sha256,_that.artifacts,_that.caveats,_that.dependsOn,_that.conflicts,_that.container,_that.autoUpdates,_that.deprecated,_that.deprecationDate,_that.deprecationReason,_that.disabled,_that.disableDate,_that.disableReason,_that.tapGitHead,_that.installedVersion,_that.outdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  String? tap,  List<String>? name,  String desc,  String homepage,  String version,  String? url, @JsonKey(name: 'url_specs')  Map<String, dynamic>? urlSpecs,  String? sha256,  List<Map<String, dynamic>>? artifacts,  List<String>? caveats, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  List<String>? conflicts, @JsonKey(name: 'container')  String? container, @JsonKey(name: 'auto_updates')  bool? autoUpdates,  bool deprecated, @JsonKey(name: 'deprecation_date')  String? deprecationDate, @JsonKey(name: 'deprecation_reason')  String? deprecationReason,  bool disabled, @JsonKey(name: 'disable_date')  String? disableDate, @JsonKey(name: 'disable_reason')  String? disableReason, @JsonKey(name: 'tap_git_head')  String? tapGitHead, @JsonKey(name: 'installed')  String? installedVersion,  bool? outdated)?  $default,) {final _that = this;
switch (_that) {
case _Cask() when $default != null:
return $default(_that.token,_that.fullToken,_that.tap,_that.name,_that.desc,_that.homepage,_that.version,_that.url,_that.urlSpecs,_that.sha256,_that.artifacts,_that.caveats,_that.dependsOn,_that.conflicts,_that.container,_that.autoUpdates,_that.deprecated,_that.deprecationDate,_that.deprecationReason,_that.disabled,_that.disableDate,_that.disableReason,_that.tapGitHead,_that.installedVersion,_that.outdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cask implements Cask {
  const _Cask({required this.token, @JsonKey(name: 'full_token') this.fullToken, this.tap, final  List<String>? name, required this.desc, required this.homepage, required this.version, this.url, @JsonKey(name: 'url_specs') final  Map<String, dynamic>? urlSpecs, this.sha256, final  List<Map<String, dynamic>>? artifacts, final  List<String>? caveats, @JsonKey(name: 'depends_on') final  Map<String, dynamic>? dependsOn, final  List<String>? conflicts, @JsonKey(name: 'container') this.container, @JsonKey(name: 'auto_updates') this.autoUpdates, this.deprecated = false, @JsonKey(name: 'deprecation_date') this.deprecationDate, @JsonKey(name: 'deprecation_reason') this.deprecationReason, this.disabled = false, @JsonKey(name: 'disable_date') this.disableDate, @JsonKey(name: 'disable_reason') this.disableReason, @JsonKey(name: 'tap_git_head') this.tapGitHead, @JsonKey(name: 'installed') this.installedVersion, this.outdated}): _name = name,_urlSpecs = urlSpecs,_artifacts = artifacts,_caveats = caveats,_dependsOn = dependsOn,_conflicts = conflicts;
  factory _Cask.fromJson(Map<String, dynamic> json) => _$CaskFromJson(json);

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
 final  Map<String, dynamic>? _urlSpecs;
@override@JsonKey(name: 'url_specs') Map<String, dynamic>? get urlSpecs {
  final value = _urlSpecs;
  if (value == null) return null;
  if (_urlSpecs is EqualUnmodifiableMapView) return _urlSpecs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? sha256;
 final  List<Map<String, dynamic>>? _artifacts;
@override List<Map<String, dynamic>>? get artifacts {
  final value = _artifacts;
  if (value == null) return null;
  if (_artifacts is EqualUnmodifiableListView) return _artifacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _caveats;
@override List<String>? get caveats {
  final value = _caveats;
  if (value == null) return null;
  if (_caveats is EqualUnmodifiableListView) return _caveats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

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

@override@JsonKey(name: 'container') final  String? container;
@override@JsonKey(name: 'auto_updates') final  bool? autoUpdates;
@override@JsonKey() final  bool deprecated;
@override@JsonKey(name: 'deprecation_date') final  String? deprecationDate;
@override@JsonKey(name: 'deprecation_reason') final  String? deprecationReason;
@override@JsonKey() final  bool disabled;
@override@JsonKey(name: 'disable_date') final  String? disableDate;
@override@JsonKey(name: 'disable_reason') final  String? disableReason;
@override@JsonKey(name: 'tap_git_head') final  String? tapGitHead;
@override@JsonKey(name: 'installed') final  String? installedVersion;
@override final  bool? outdated;

/// Create a copy of Cask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaskCopyWith<_Cask> get copyWith => __$CaskCopyWithImpl<_Cask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cask&&(identical(other.token, token) || other.token == token)&&(identical(other.fullToken, fullToken) || other.fullToken == fullToken)&&(identical(other.tap, tap) || other.tap == tap)&&const DeepCollectionEquality().equals(other._name, _name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.version, version) || other.version == version)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._urlSpecs, _urlSpecs)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&const DeepCollectionEquality().equals(other._artifacts, _artifacts)&&const DeepCollectionEquality().equals(other._caveats, _caveats)&&const DeepCollectionEquality().equals(other._dependsOn, _dependsOn)&&const DeepCollectionEquality().equals(other._conflicts, _conflicts)&&(identical(other.container, container) || other.container == container)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.deprecationDate, deprecationDate) || other.deprecationDate == deprecationDate)&&(identical(other.deprecationReason, deprecationReason) || other.deprecationReason == deprecationReason)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.disableDate, disableDate) || other.disableDate == disableDate)&&(identical(other.disableReason, disableReason) || other.disableReason == disableReason)&&(identical(other.tapGitHead, tapGitHead) || other.tapGitHead == tapGitHead)&&(identical(other.installedVersion, installedVersion) || other.installedVersion == installedVersion)&&(identical(other.outdated, outdated) || other.outdated == outdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,token,fullToken,tap,const DeepCollectionEquality().hash(_name),desc,homepage,version,url,const DeepCollectionEquality().hash(_urlSpecs),sha256,const DeepCollectionEquality().hash(_artifacts),const DeepCollectionEquality().hash(_caveats),const DeepCollectionEquality().hash(_dependsOn),const DeepCollectionEquality().hash(_conflicts),container,autoUpdates,deprecated,deprecationDate,deprecationReason,disabled,disableDate,disableReason,tapGitHead,installedVersion,outdated]);

@override
String toString() {
  return 'Cask(token: $token, fullToken: $fullToken, tap: $tap, name: $name, desc: $desc, homepage: $homepage, version: $version, url: $url, urlSpecs: $urlSpecs, sha256: $sha256, artifacts: $artifacts, caveats: $caveats, dependsOn: $dependsOn, conflicts: $conflicts, container: $container, autoUpdates: $autoUpdates, deprecated: $deprecated, deprecationDate: $deprecationDate, deprecationReason: $deprecationReason, disabled: $disabled, disableDate: $disableDate, disableReason: $disableReason, tapGitHead: $tapGitHead, installedVersion: $installedVersion, outdated: $outdated)';
}


}

/// @nodoc
abstract mixin class _$CaskCopyWith<$Res> implements $CaskCopyWith<$Res> {
  factory _$CaskCopyWith(_Cask value, $Res Function(_Cask) _then) = __$CaskCopyWithImpl;
@override @useResult
$Res call({
 String token,@JsonKey(name: 'full_token') String? fullToken, String? tap, List<String>? name, String desc, String homepage, String version, String? url,@JsonKey(name: 'url_specs') Map<String, dynamic>? urlSpecs, String? sha256, List<Map<String, dynamic>>? artifacts, List<String>? caveats,@JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn, List<String>? conflicts,@JsonKey(name: 'container') String? container,@JsonKey(name: 'auto_updates') bool? autoUpdates, bool deprecated,@JsonKey(name: 'deprecation_date') String? deprecationDate,@JsonKey(name: 'deprecation_reason') String? deprecationReason, bool disabled,@JsonKey(name: 'disable_date') String? disableDate,@JsonKey(name: 'disable_reason') String? disableReason,@JsonKey(name: 'tap_git_head') String? tapGitHead,@JsonKey(name: 'installed') String? installedVersion, bool? outdated
});




}
/// @nodoc
class __$CaskCopyWithImpl<$Res>
    implements _$CaskCopyWith<$Res> {
  __$CaskCopyWithImpl(this._self, this._then);

  final _Cask _self;
  final $Res Function(_Cask) _then;

/// Create a copy of Cask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? fullToken = freezed,Object? tap = freezed,Object? name = freezed,Object? desc = null,Object? homepage = null,Object? version = null,Object? url = freezed,Object? urlSpecs = freezed,Object? sha256 = freezed,Object? artifacts = freezed,Object? caveats = freezed,Object? dependsOn = freezed,Object? conflicts = freezed,Object? container = freezed,Object? autoUpdates = freezed,Object? deprecated = null,Object? deprecationDate = freezed,Object? deprecationReason = freezed,Object? disabled = null,Object? disableDate = freezed,Object? disableReason = freezed,Object? tapGitHead = freezed,Object? installedVersion = freezed,Object? outdated = freezed,}) {
  return _then(_Cask(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,fullToken: freezed == fullToken ? _self.fullToken : fullToken // ignore: cast_nullable_to_non_nullable
as String?,tap: freezed == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as List<String>?,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlSpecs: freezed == urlSpecs ? _self._urlSpecs : urlSpecs // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,sha256: freezed == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String?,artifacts: freezed == artifacts ? _self._artifacts : artifacts // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,caveats: freezed == caveats ? _self._caveats : caveats // ignore: cast_nullable_to_non_nullable
as List<String>?,dependsOn: freezed == dependsOn ? _self._dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,conflicts: freezed == conflicts ? _self._conflicts : conflicts // ignore: cast_nullable_to_non_nullable
as List<String>?,container: freezed == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as String?,autoUpdates: freezed == autoUpdates ? _self.autoUpdates : autoUpdates // ignore: cast_nullable_to_non_nullable
as bool?,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,deprecationDate: freezed == deprecationDate ? _self.deprecationDate : deprecationDate // ignore: cast_nullable_to_non_nullable
as String?,deprecationReason: freezed == deprecationReason ? _self.deprecationReason : deprecationReason // ignore: cast_nullable_to_non_nullable
as String?,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,disableDate: freezed == disableDate ? _self.disableDate : disableDate // ignore: cast_nullable_to_non_nullable
as String?,disableReason: freezed == disableReason ? _self.disableReason : disableReason // ignore: cast_nullable_to_non_nullable
as String?,tapGitHead: freezed == tapGitHead ? _self.tapGitHead : tapGitHead // ignore: cast_nullable_to_non_nullable
as String?,installedVersion: freezed == installedVersion ? _self.installedVersion : installedVersion // ignore: cast_nullable_to_non_nullable
as String?,outdated: freezed == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
