import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';

import '../exceptions.dart';
import 'brew_process_result.dart';

/// Low-level wrapper around the `brew` CLI.
///
/// Handles process execution, environment variable defaults, and output
/// capture. All higher-level operations build on this class.
class BrewCli {
  /// Optional override for the brew executable path.
  /// If null, `brew` is resolved from PATH.
  final String? brewPath;

  /// Additional environment variables merged into every invocation.
  final Map<String, String> _extraDefaultEnv;

  /// Default environment variables set on every brew invocation to ensure
  /// clean, parseable output.
  static const _defaultEnv = <String, String>{
    'HOMEBREW_NO_AUTO_UPDATE': '1',
    'HOMEBREW_NO_ANALYTICS': '1',
    'HOMEBREW_NO_COLOR': '1',
    'HOMEBREW_NO_EMOJI': '1',
    'HOMEBREW_NO_ENV_HINTS': '1',
  };

  BrewCli({
    this.brewPath,
    Map<String, String>? defaultEnv,
  }) : _extraDefaultEnv = defaultEnv ?? const {};

  /// The resolved executable path for brew.
  String get _executable => brewPath ?? 'brew';

  /// Build the merged environment for a process invocation.
  Map<String, String> _buildEnv([Map<String, String>? extraEnv]) {
    return {
      ..._defaultEnv,
      ..._extraDefaultEnv,
      ...?extraEnv,
    };
  }

  /// Run a brew command and wait for completion.
  ///
  /// Returns a [BrewProcessResult] regardless of exit code.
  /// Throws [CommandTimeoutException] if [timeout] is exceeded.
  Future<BrewProcessResult> run(
    List<String> args, {
    Duration? timeout,
    Map<String, String>? extraEnv,
  }) async {
    final command = 'brew ${args.join(' ')}';
    try {
      final result = await Process.run(
        _executable,
        args,
        environment: _buildEnv(extraEnv),
        stdoutEncoding: utf8,
        stderrEncoding: utf8,
      ).timeout(
        timeout ?? const Duration(minutes: 5),
        onTimeout: () => throw CommandTimeoutException(
          timeout: timeout ?? const Duration(minutes: 5),
          command: command,
        ),
      );
      return BrewProcessResult(
        command: command,
        exitCode: result.exitCode,
        stdout: result.stdout as String,
        stderr: result.stderr as String,
      );
    } on ProcessException catch (e) {
      if (e.message.contains('No such file or directory') ||
          e.message.contains('not found')) {
        throw const BrewNotInstalledException();
      }
      rethrow;
    }
  }

  /// Run a brew command that produces JSON output.
  ///
  /// Appends `--json=v2` (or the specified [jsonFlag]) to [args], runs the
  /// command, and returns the decoded JSON.
  ///
  /// Throws [BrewCommandException] on non-zero exit code.
  Future<dynamic> runJson(
    List<String> args, {
    String jsonFlag = '--json=v2',
    Duration? timeout,
  }) async {
    final result = await run(
      [...args, jsonFlag],
      timeout: timeout,
    );
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return jsonDecode(result.stdout);
  }

  /// Stream output line-by-line for long-running commands.
  ///
  /// Merges stdout and stderr into a single [ProcessOutput] stream.
  /// Throws [BrewCommandException] if the process exits with a non-zero code
  /// after the streams are drained.
  Stream<ProcessOutput> stream(
    List<String> args, {
    Map<String, String>? extraEnv,
  }) async* {
    final process = await Process.start(
      _executable,
      args,
      environment: _buildEnv(extraEnv),
    );

    final stdout = process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .map((line) => ProcessOutput(line, OutputType.stdout));
    final stderr = process.stderr
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .map((line) => ProcessOutput(line, OutputType.stderr));

    yield* StreamGroup.merge([stdout, stderr]);

    final exitCode = await process.exitCode;
    if (exitCode != 0) {
      throw BrewCommandException.fromExitCode(exitCode, args);
    }
  }
}
