import 'package:freezed_annotation/freezed_annotation.dart';

part 'dependency.freezed.dart';
part 'dependency.g.dart';

/// A missing dependency as reported by `brew missing`.
///
/// Output format: `<formula>: <missing_dep1> <missing_dep2> ...`
@freezed
class MissingDependency with _$MissingDependency {
  const factory MissingDependency({
    /// The formula that has missing dependencies.
    required String formula,

    /// The dependency names that are missing.
    required List<String> missingDeps,
  }) = _MissingDependency;

  factory MissingDependency.fromJson(Map<String, dynamic> json) =>
      _$MissingDependencyFromJson(json);
}
