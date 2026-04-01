import 'dart:convert';

import 'package:brew_dart/brew_dart.dart';

/// A fake [BrewCli] for unit testing the [Brew] facade.
///
/// Configure responses by populating [responses] with command patterns
/// mapped to [BrewProcessResult]s.
class FakeBrewCli extends BrewCli {
  /// Map of command argument patterns to canned results.
  /// The key is matched against the args list joined by spaces.
  final Map<String, BrewProcessResult> responses = {};

  /// All commands that were executed, for verification.
  final List<List<String>> executedCommands = [];

  FakeBrewCli() : super(brewPath: 'fake-brew');

  /// Register a successful response for a command pattern.
  void whenRun(String pattern, {String stdout = '', String stderr = ''}) {
    responses[pattern] = BrewProcessResult(
      command: 'brew $pattern',
      exitCode: 0,
      stdout: stdout,
      stderr: stderr,
    );
  }

  /// Register a failing response for a command pattern.
  void whenRunFails(
    String pattern, {
    int exitCode = 1,
    String stdout = '',
    String stderr = '',
  }) {
    responses[pattern] = BrewProcessResult(
      command: 'brew $pattern',
      exitCode: exitCode,
      stdout: stdout,
      stderr: stderr,
    );
  }

  /// Register a JSON response for a command pattern.
  void whenRunJson(String pattern, dynamic jsonData) {
    final encoded = jsonEncode(jsonData);
    responses[pattern] = BrewProcessResult(
      command: 'brew $pattern',
      exitCode: 0,
      stdout: encoded,
      stderr: '',
    );
  }

  @override
  Future<BrewProcessResult> run(
    List<String> args, {
    Duration? timeout,
    Map<String, String>? extraEnv,
  }) async {
    executedCommands.add(args);
    final key = args.join(' ');

    // Try exact match first, then prefix matches
    if (responses.containsKey(key)) {
      return responses[key]!;
    }
    for (final entry in responses.entries) {
      if (key.startsWith(entry.key) || key.contains(entry.key)) {
        return entry.value;
      }
    }

    return BrewProcessResult(
      command: 'brew $key',
      exitCode: 127,
      stdout: '',
      stderr: 'FakeBrewCli: no response configured for: $key',
    );
  }

  @override
  Future<dynamic> runJson(
    List<String> args, {
    String jsonFlag = '--json=v2',
    Duration? timeout,
  }) async {
    final fullArgs = [...args, jsonFlag];
    final result = await run(fullArgs, timeout: timeout);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return jsonDecode(result.stdout);
  }

  @override
  Stream<ProcessOutput> stream(
    List<String> args, {
    Map<String, String>? extraEnv,
  }) async* {
    executedCommands.add(args);
    final key = args.join(' ');

    BrewProcessResult? result;
    if (responses.containsKey(key)) {
      result = responses[key];
    } else {
      for (final entry in responses.entries) {
        if (key.startsWith(entry.key) || key.contains(entry.key)) {
          result = entry.value;
          break;
        }
      }
    }

    if (result != null) {
      for (final line in result.stdout.split('\n')) {
        if (line.isNotEmpty) {
          yield ProcessOutput(line, OutputType.stdout);
        }
      }
      if (!result.isSuccess) {
        throw BrewCommandException.fromResult(result);
      }
    }
  }
}
