import 'package:freezed_annotation/freezed_annotation.dart';

part 'brew_config.freezed.dart';
part 'brew_config.g.dart';

/// Parsed output of `brew config`.
@freezed
abstract class BrewConfig with _$BrewConfig {
  const factory BrewConfig({
    required String homebrewVersion,
    required String origin,
    required String coreOrigin,
    required String prefix,
    required String cellar,
    required String caskroom,
    String? head,
    String? homebrewRubyVersion,
    String? cpu,
    String? os,
    String? macosVersion,
    String? xcode,
    String? clt,
    String? rosetta2,

    /// All raw key-value pairs from `brew config` output.
    required Map<String, String> raw,
  }) = _BrewConfig;

  factory BrewConfig.fromJson(Map<String, dynamic> json) =>
      _$BrewConfigFromJson(json);
}
