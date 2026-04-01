/// Result of running `brew bundle`.
class BundleResult {
  /// Whether the bundle install succeeded.
  final bool success;

  /// The process exit code.
  final int exitCode;

  /// Combined stdout output.
  final String output;

  /// Error message from stderr, if any.
  final String? errorMessage;

  /// How long the bundle install took.
  final Duration elapsed;

  const BundleResult({
    required this.success,
    required this.exitCode,
    required this.output,
    this.errorMessage,
    required this.elapsed,
  });

  @override
  String toString() =>
      'BundleResult(success: $success, elapsed: ${elapsed.inSeconds}s)';
}

/// Result of running `brew bundle check`.
class BundleCheckResult {
  /// Whether all Brewfile entries are satisfied.
  final bool satisfied;

  /// The process exit code.
  final int exitCode;

  /// Combined stdout output listing any unsatisfied entries.
  final String output;

  /// List of entries from the Brewfile that are not installed.
  final List<String> missingEntries;

  const BundleCheckResult({
    required this.satisfied,
    required this.exitCode,
    required this.output,
    required this.missingEntries,
  });

  @override
  String toString() =>
      'BundleCheckResult(satisfied: $satisfied, '
      'missing: ${missingEntries.length})';
}
