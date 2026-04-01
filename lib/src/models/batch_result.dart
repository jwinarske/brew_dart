/// Base class for single-package mutation results (install, uninstall, upgrade).
class MutationResult {
  /// The package name this result applies to.
  final String package;

  /// Whether the operation succeeded.
  final bool success;

  /// The process exit code.
  final int exitCode;

  /// Combined stdout output from the command.
  final String output;

  /// Error message from stderr, if any.
  final String? errorMessage;

  /// How long the operation took.
  final Duration elapsed;

  const MutationResult({
    required this.package,
    required this.success,
    required this.exitCode,
    required this.output,
    this.errorMessage,
    required this.elapsed,
  });

  @override
  String toString() =>
      'MutationResult(package: $package, success: $success, '
      'exitCode: $exitCode, elapsed: ${elapsed.inSeconds}s)';
}

/// Result of installing a single package via `brew install`.
class InstallResult extends MutationResult {
  const InstallResult({
    required super.package,
    required super.success,
    required super.exitCode,
    required super.output,
    super.errorMessage,
    required super.elapsed,
  });
}

/// Result of uninstalling a single package via `brew uninstall`.
class UninstallResult extends MutationResult {
  const UninstallResult({
    required super.package,
    required super.success,
    required super.exitCode,
    required super.output,
    super.errorMessage,
    required super.elapsed,
  });
}

/// Result of upgrading a single package via `brew upgrade`.
class UpgradeResult extends MutationResult {
  const UpgradeResult({
    required super.package,
    required super.success,
    required super.exitCode,
    required super.output,
    super.errorMessage,
    required super.elapsed,
  });
}

/// Result of a `brew cleanup` operation.
class CleanupResult {
  /// Whether the cleanup succeeded.
  final bool success;

  /// The process exit code.
  final int exitCode;

  /// Combined stdout output.
  final String output;

  /// Error message from stderr, if any.
  final String? errorMessage;

  /// How long the cleanup took.
  final Duration elapsed;

  const CleanupResult({
    required this.success,
    required this.exitCode,
    required this.output,
    this.errorMessage,
    required this.elapsed,
  });
}

/// Aggregated result of a batch operation (installAll, uninstallAll, upgradeAll).
class BatchResult<T extends MutationResult> {
  /// Total number of packages in the batch.
  final int total;

  /// Number of packages that succeeded.
  final int succeeded;

  /// Number of packages that failed.
  final int failed;

  /// Individual results for each package.
  final List<T> results;

  /// Total wall-clock time for the entire batch.
  final Duration elapsed;

  const BatchResult({
    required this.total,
    required this.succeeded,
    required this.failed,
    required this.results,
    required this.elapsed,
  });

  /// Names of packages that failed.
  List<String> get failedPackages =>
      results.where((r) => !r.success).map((r) => r.package).toList();

  /// Names of packages that succeeded.
  List<String> get succeededPackages =>
      results.where((r) => r.success).map((r) => r.package).toList();

  /// Whether all packages in the batch succeeded.
  bool get allSucceeded => failed == 0;

  @override
  String toString() =>
      'BatchResult(total: $total, succeeded: $succeeded, failed: $failed, '
      'elapsed: ${elapsed.inSeconds}s)';
}
