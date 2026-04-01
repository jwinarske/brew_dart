import 'package:freezed_annotation/freezed_annotation.dart';

part 'outdated_package.freezed.dart';
part 'outdated_package.g.dart';

/// An outdated package as returned by `brew outdated --json=v2`.
@freezed
abstract class OutdatedPackage with _$OutdatedPackage {
  const factory OutdatedPackage({
    required String name,
    @JsonKey(name: 'current_version') required String currentVersion,
    @JsonKey(name: 'installed_versions')
    @Default([])
    List<String> installedVersions,
    @JsonKey(name: 'latest_version') required String latestVersion,
    @Default(false) bool pinned,

    /// True if this is a cask, false if it's a formula.
    @Default(false) bool isCask,
  }) = _OutdatedPackage;

  factory OutdatedPackage.fromJson(Map<String, dynamic> json) =>
      _$OutdatedPackageFromJson(json);
}
