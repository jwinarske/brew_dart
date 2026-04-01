import 'package:freezed_annotation/freezed_annotation.dart';

part 'tap.freezed.dart';
part 'tap.g.dart';

/// A Homebrew tap as returned by `brew tap-info --json`.
@freezed
abstract class Tap with _$Tap {
  const factory Tap({
    required String name,
    String? user,
    String? repo,
    String? path,
    bool? installed,
    bool? official,
    @JsonKey(name: 'formula_names') @Default([]) List<String> formulaNames,
    @JsonKey(name: 'formula_files') @Default([]) List<String> formulaFiles,
    @JsonKey(name: 'cask_tokens') @Default([]) List<String> caskTokens,
    @JsonKey(name: 'cask_files') @Default([]) List<String> caskFiles,
    @JsonKey(name: 'command_files') @Default([]) List<String> commandFiles,
    @JsonKey(name: 'formula_count') int? formulaCount,
    @JsonKey(name: 'cask_count') int? caskCount,
    String? remote,
    @JsonKey(name: 'custom_remote') bool? customRemote,
    @JsonKey(name: 'private') bool? isPrivate,
  }) = _Tap;

  factory Tap.fromJson(Map<String, dynamic> json) => _$TapFromJson(json);
}
