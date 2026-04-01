/// Result of running `brew update`.
class UpdateResult {
  /// Whether the update succeeded.
  final bool success;

  /// The process exit code.
  final int exitCode;

  /// Combined stdout output.
  final String output;

  /// Error message from stderr, if any.
  final String? errorMessage;

  /// How long the update took.
  final Duration elapsed;

  const UpdateResult({
    required this.success,
    required this.exitCode,
    required this.output,
    this.errorMessage,
    required this.elapsed,
  });

  @override
  String toString() =>
      'UpdateResult(success: $success, elapsed: ${elapsed.inSeconds}s)';
}
