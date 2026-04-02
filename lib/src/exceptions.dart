import 'cli/brew_process_result.dart';

/// Base exception for all brew_dart errors.
class BrewException implements Exception {
  final String message;

  const BrewException(this.message);

  @override
  String toString() => 'BrewException: $message';
}

/// Brew is not installed or not found in PATH.
class BrewNotInstalledException extends BrewException {
  const BrewNotInstalledException([
    super.message = 'brew is not installed or not in PATH',
  ]);

  @override
  String toString() => 'BrewNotInstalledException: $message';
}

/// A brew command returned a non-zero exit code.
class BrewCommandException extends BrewException {
  final int exitCode;
  final String command;
  final String stderr;

  const BrewCommandException({
    required this.exitCode,
    required this.command,
    required this.stderr,
  }) : super('brew command failed: $command (exit code $exitCode)');

  factory BrewCommandException.fromResult(BrewProcessResult result) {
    return BrewCommandException(
      exitCode: result.exitCode,
      command: result.command,
      stderr: result.stderr,
    );
  }

  factory BrewCommandException.fromExitCode(int exitCode, List<String> args) {
    return BrewCommandException(
      exitCode: exitCode,
      command: 'brew ${args.join(' ')}',
      stderr: '',
    );
  }

  @override
  String toString() =>
      'BrewCommandException: $command exited with $exitCode\n$stderr';
}

/// Package name not found in any tap.
class PackageNotFoundException extends BrewException {
  final String packageName;

  const PackageNotFoundException(this.packageName)
    : super('package not found: $packageName');

  @override
  String toString() => 'PackageNotFoundException: $packageName';
}

/// Install or upgrade failed for a specific package.
class InstallFailedException extends BrewException {
  final String packageName;
  final String stderr;

  const InstallFailedException({
    required this.packageName,
    required this.stderr,
  }) : super('install failed for $packageName');

  @override
  String toString() => 'InstallFailedException: $packageName\n$stderr';
}

/// Uninstall or modification refused due to a dependency conflict.
///
/// Thrown when brew refuses to uninstall a package because other installed
/// packages depend on it (e.g. "Refusing to uninstall icu4c because it is
/// required by node").
class DependencyConflictException extends BrewException {
  final String packageName;
  final List<String> dependents;

  DependencyConflictException({
    required this.packageName,
    required this.dependents,
  }) : super(
         'cannot remove $packageName: required by ${dependents.join(', ')}',
       );

  @override
  String toString() =>
      'DependencyConflictException: $packageName is required by '
      '${dependents.join(', ')}';
}

/// A command exceeded its timeout duration.
class CommandTimeoutException extends BrewException {
  final Duration timeout;
  final String command;

  CommandTimeoutException({required this.timeout, required this.command})
    : super('command timed out after ${timeout.inSeconds}s: $command');

  @override
  String toString() =>
      'CommandTimeoutException: $command (timeout: ${timeout.inSeconds}s)';
}
