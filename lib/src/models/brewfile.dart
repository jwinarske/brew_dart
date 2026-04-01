import 'package:freezed_annotation/freezed_annotation.dart';

part 'brewfile.freezed.dart';
part 'brewfile.g.dart';

/// The type of entry in a Brewfile.
enum BrewfileEntryType { tap, brew, cask, mas, whalebrew, vscode }

/// A single declaration in a Brewfile.
@freezed
abstract class BrewfileEntry with _$BrewfileEntry {
  const factory BrewfileEntry({
    required BrewfileEntryType type,
    required String name,

    /// Optional arguments (e.g. `args: ["with-openssl"]`).
    @Default({}) Map<String, dynamic> options,
  }) = _BrewfileEntry;

  factory BrewfileEntry.fromJson(Map<String, dynamic> json) =>
      _$BrewfileEntryFromJson(json);
}

/// A parsed Brewfile.
@freezed
abstract class Brewfile with _$Brewfile {
  const factory Brewfile({required List<BrewfileEntry> entries}) = _Brewfile;

  factory Brewfile.fromJson(Map<String, dynamic> json) =>
      _$BrewfileFromJson(json);
}
