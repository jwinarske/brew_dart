/// The result of running a brew command via [Process.run].
class BrewProcessResult {
  /// The full command string that was executed (e.g. "brew info --json=v2 git").
  final String command;

  /// The process exit code. Zero indicates success.
  final int exitCode;

  /// The captured standard output.
  final String stdout;

  /// The captured standard error.
  final String stderr;

  const BrewProcessResult({
    required this.command,
    required this.exitCode,
    required this.stdout,
    required this.stderr,
  });

  /// Whether the command completed successfully (exit code 0).
  bool get isSuccess => exitCode == 0;

  @override
  String toString() =>
      'BrewProcessResult(command: $command, exitCode: $exitCode)';
}

/// The type of output stream a line came from.
enum OutputType {
  stdout,
  stderr,
}

/// A single line of output from a streaming brew command.
class ProcessOutput {
  /// The text content of the line.
  final String line;

  /// Whether this came from stdout or stderr.
  final OutputType type;

  const ProcessOutput(this.line, this.type);

  /// Whether this line came from stderr.
  bool get isError => type == OutputType.stderr;

  @override
  String toString() => '${type.name}: $line';
}
