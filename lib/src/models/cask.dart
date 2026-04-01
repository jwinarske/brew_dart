import 'package:freezed_annotation/freezed_annotation.dart';

part 'cask.freezed.dart';
part 'cask.g.dart';

/// A Homebrew cask as returned by `brew info --json=v2`.
@freezed
class Cask with _$Cask {
  const factory Cask({
    required String token,
    @JsonKey(name: 'full_token') String? fullToken,
    String? tap,
    List<String>? name,
    required String desc,
    required String homepage,
    required String version,
    String? url,
    @JsonKey(name: 'url_specs') Map<String, dynamic>? urlSpecs,
    String? sha256,
    List<Map<String, dynamic>>? artifacts,
    List<String>? caveats,
    @JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn,
    List<String>? conflicts,
    @JsonKey(name: 'container') String? container,
    @JsonKey(name: 'auto_updates') bool? autoUpdates,
    @Default(false) bool deprecated,
    @JsonKey(name: 'deprecation_date') String? deprecationDate,
    @JsonKey(name: 'deprecation_reason') String? deprecationReason,
    @Default(false) bool disabled,
    @JsonKey(name: 'disable_date') String? disableDate,
    @JsonKey(name: 'disable_reason') String? disableReason,
    @JsonKey(name: 'tap_git_head') String? tapGitHead,
    @JsonKey(name: 'installed') String? installedVersion,
    bool? outdated,
  }) = _Cask;

  factory Cask.fromJson(Map<String, dynamic> json) => _$CaskFromJson(json);
}
