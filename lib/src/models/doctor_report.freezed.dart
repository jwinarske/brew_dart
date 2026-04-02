// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Diagnostic {

 DiagnosticSeverity get severity; String get title; List<String> get details;
/// Create a copy of Diagnostic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnosticCopyWith<Diagnostic> get copyWith => _$DiagnosticCopyWithImpl<Diagnostic>(this as Diagnostic, _$identity);

  /// Serializes this Diagnostic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Diagnostic&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.details, details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,severity,title,const DeepCollectionEquality().hash(details));

@override
String toString() {
  return 'Diagnostic(severity: $severity, title: $title, details: $details)';
}


}

/// @nodoc
abstract mixin class $DiagnosticCopyWith<$Res>  {
  factory $DiagnosticCopyWith(Diagnostic value, $Res Function(Diagnostic) _then) = _$DiagnosticCopyWithImpl;
@useResult
$Res call({
 DiagnosticSeverity severity, String title, List<String> details
});




}
/// @nodoc
class _$DiagnosticCopyWithImpl<$Res>
    implements $DiagnosticCopyWith<$Res> {
  _$DiagnosticCopyWithImpl(this._self, this._then);

  final Diagnostic _self;
  final $Res Function(Diagnostic) _then;

/// Create a copy of Diagnostic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? severity = null,Object? title = null,Object? details = null,}) {
  return _then(_self.copyWith(
severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as DiagnosticSeverity,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Diagnostic].
extension DiagnosticPatterns on Diagnostic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Diagnostic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Diagnostic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Diagnostic value)  $default,){
final _that = this;
switch (_that) {
case _Diagnostic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Diagnostic value)?  $default,){
final _that = this;
switch (_that) {
case _Diagnostic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DiagnosticSeverity severity,  String title,  List<String> details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Diagnostic() when $default != null:
return $default(_that.severity,_that.title,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DiagnosticSeverity severity,  String title,  List<String> details)  $default,) {final _that = this;
switch (_that) {
case _Diagnostic():
return $default(_that.severity,_that.title,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DiagnosticSeverity severity,  String title,  List<String> details)?  $default,) {final _that = this;
switch (_that) {
case _Diagnostic() when $default != null:
return $default(_that.severity,_that.title,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Diagnostic implements Diagnostic {
  const _Diagnostic({required this.severity, required this.title, required final  List<String> details}): _details = details;
  factory _Diagnostic.fromJson(Map<String, dynamic> json) => _$DiagnosticFromJson(json);

@override final  DiagnosticSeverity severity;
@override final  String title;
 final  List<String> _details;
@override List<String> get details {
  if (_details is EqualUnmodifiableListView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_details);
}


/// Create a copy of Diagnostic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiagnosticCopyWith<_Diagnostic> get copyWith => __$DiagnosticCopyWithImpl<_Diagnostic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiagnosticToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Diagnostic&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,severity,title,const DeepCollectionEquality().hash(_details));

@override
String toString() {
  return 'Diagnostic(severity: $severity, title: $title, details: $details)';
}


}

/// @nodoc
abstract mixin class _$DiagnosticCopyWith<$Res> implements $DiagnosticCopyWith<$Res> {
  factory _$DiagnosticCopyWith(_Diagnostic value, $Res Function(_Diagnostic) _then) = __$DiagnosticCopyWithImpl;
@override @useResult
$Res call({
 DiagnosticSeverity severity, String title, List<String> details
});




}
/// @nodoc
class __$DiagnosticCopyWithImpl<$Res>
    implements _$DiagnosticCopyWith<$Res> {
  __$DiagnosticCopyWithImpl(this._self, this._then);

  final _Diagnostic _self;
  final $Res Function(_Diagnostic) _then;

/// Create a copy of Diagnostic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? severity = null,Object? title = null,Object? details = null,}) {
  return _then(_Diagnostic(
severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as DiagnosticSeverity,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$DoctorReport {

 bool get healthy; List<Diagnostic> get diagnostics;
/// Create a copy of DoctorReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorReportCopyWith<DoctorReport> get copyWith => _$DoctorReportCopyWithImpl<DoctorReport>(this as DoctorReport, _$identity);

  /// Serializes this DoctorReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorReport&&(identical(other.healthy, healthy) || other.healthy == healthy)&&const DeepCollectionEquality().equals(other.diagnostics, diagnostics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,healthy,const DeepCollectionEquality().hash(diagnostics));

@override
String toString() {
  return 'DoctorReport(healthy: $healthy, diagnostics: $diagnostics)';
}


}

/// @nodoc
abstract mixin class $DoctorReportCopyWith<$Res>  {
  factory $DoctorReportCopyWith(DoctorReport value, $Res Function(DoctorReport) _then) = _$DoctorReportCopyWithImpl;
@useResult
$Res call({
 bool healthy, List<Diagnostic> diagnostics
});




}
/// @nodoc
class _$DoctorReportCopyWithImpl<$Res>
    implements $DoctorReportCopyWith<$Res> {
  _$DoctorReportCopyWithImpl(this._self, this._then);

  final DoctorReport _self;
  final $Res Function(DoctorReport) _then;

/// Create a copy of DoctorReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? healthy = null,Object? diagnostics = null,}) {
  return _then(_self.copyWith(
healthy: null == healthy ? _self.healthy : healthy // ignore: cast_nullable_to_non_nullable
as bool,diagnostics: null == diagnostics ? _self.diagnostics : diagnostics // ignore: cast_nullable_to_non_nullable
as List<Diagnostic>,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorReport].
extension DoctorReportPatterns on DoctorReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorReport value)  $default,){
final _that = this;
switch (_that) {
case _DoctorReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorReport value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool healthy,  List<Diagnostic> diagnostics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorReport() when $default != null:
return $default(_that.healthy,_that.diagnostics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool healthy,  List<Diagnostic> diagnostics)  $default,) {final _that = this;
switch (_that) {
case _DoctorReport():
return $default(_that.healthy,_that.diagnostics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool healthy,  List<Diagnostic> diagnostics)?  $default,) {final _that = this;
switch (_that) {
case _DoctorReport() when $default != null:
return $default(_that.healthy,_that.diagnostics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorReport implements DoctorReport {
  const _DoctorReport({required this.healthy, required final  List<Diagnostic> diagnostics}): _diagnostics = diagnostics;
  factory _DoctorReport.fromJson(Map<String, dynamic> json) => _$DoctorReportFromJson(json);

@override final  bool healthy;
 final  List<Diagnostic> _diagnostics;
@override List<Diagnostic> get diagnostics {
  if (_diagnostics is EqualUnmodifiableListView) return _diagnostics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_diagnostics);
}


/// Create a copy of DoctorReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorReportCopyWith<_DoctorReport> get copyWith => __$DoctorReportCopyWithImpl<_DoctorReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorReport&&(identical(other.healthy, healthy) || other.healthy == healthy)&&const DeepCollectionEquality().equals(other._diagnostics, _diagnostics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,healthy,const DeepCollectionEquality().hash(_diagnostics));

@override
String toString() {
  return 'DoctorReport(healthy: $healthy, diagnostics: $diagnostics)';
}


}

/// @nodoc
abstract mixin class _$DoctorReportCopyWith<$Res> implements $DoctorReportCopyWith<$Res> {
  factory _$DoctorReportCopyWith(_DoctorReport value, $Res Function(_DoctorReport) _then) = __$DoctorReportCopyWithImpl;
@override @useResult
$Res call({
 bool healthy, List<Diagnostic> diagnostics
});




}
/// @nodoc
class __$DoctorReportCopyWithImpl<$Res>
    implements _$DoctorReportCopyWith<$Res> {
  __$DoctorReportCopyWithImpl(this._self, this._then);

  final _DoctorReport _self;
  final $Res Function(_DoctorReport) _then;

/// Create a copy of DoctorReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? healthy = null,Object? diagnostics = null,}) {
  return _then(_DoctorReport(
healthy: null == healthy ? _self.healthy : healthy // ignore: cast_nullable_to_non_nullable
as bool,diagnostics: null == diagnostics ? _self._diagnostics : diagnostics // ignore: cast_nullable_to_non_nullable
as List<Diagnostic>,
  ));
}


}

// dart format on
