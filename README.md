# brew_dart

A Dart package providing full programmatic access to [Homebrew](https://brew.sh) on macOS and Linux.

Wraps the `brew` CLI using `Process.run` / `Process.start`, relying on `--json=v2` structured output wherever brew supports it, and falling back to sanitised text parsing only where JSON is unavailable.

## Features

- **CLI-first** — uses `brew info --json=v2` as the stable interface, not the HTTP API
- **Strongly-typed models** — all JSON and text output parsed into immutable Dart classes via `freezed`
- **Stream-based output** — long-running commands (install, upgrade, update) expose `Stream<ProcessOutput>` for real-time progress
- **Batch operations** — multi-package install/remove/upgrade with parallel or sequential execution
- **Unified facade** — single `Brew` class entry point for all operations
- **Optional HTTP client** — standalone `BrewApiClient` for formulae.brew.sh catalog browsing (separate import, no `http` dependency in core)

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  brew_dart: ^0.1.0
```

Then run code generation (required for `freezed` models):

```bash
dart pub get
dart run build_runner build --delete-conflicting-outputs
```

## Quick Start

```dart
import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }
  print('Homebrew ${await brew.version()}');

  // Search for packages
  final results = await brew.search('node');
  print('Formulae: ${results.formulae.join(', ')}');

  // Get detailed info (JSON-backed)
  final info = await brew.info('node');
  print('Latest: ${info.formula!.versions.stable}');
  print('Dependencies: ${info.formula!.dependencies.join(', ')}');

  // See what's installed
  final installed = await brew.installed();
  print('${installed.length} packages installed');
}
```

## Usage

### Package Management

```dart
// Install a single package
final result = await brew.install('ripgrep');
print('Success: ${result.success} (${result.elapsed.inSeconds}s)');

// Install a cask
await brew.install('docker', cask: true);

// Batch install with progress callback
final batch = await brew.installAll(
  ['ripgrep', 'fd', 'bat', 'eza'],
  parallel: true,
  concurrency: 2,
  onEach: (pkg, res) {
    print('${res.success ? "+" : "x"} $pkg (${res.elapsed.inSeconds}s)');
  },
);
print('Installed ${batch.succeeded}/${batch.total}');

// Stream install output in real-time
await for (final output in brew.installStream('ffmpeg')) {
  print(output.line);
}

// Uninstall
await brew.uninstall('ripgrep');

// Upgrade
await brew.upgrade('node');

// Cleanup old versions
final cleanup = await brew.cleanup(dryRun: true);
print(cleanup.output);
```

### Querying

```dart
// Outdated packages (JSON-backed)
final outdated = await brew.outdated();
for (final pkg in outdated) {
  print('${pkg.name}: ${pkg.currentVersion} -> ${pkg.latestVersion}');
}

// Dependencies
final deps = await brew.deps('git');
print('git depends on: ${deps.join(', ')}');

// Reverse dependencies
final uses = await brew.uses('icu4c');
print('icu4c is used by: ${uses.join(', ')}');

// List installed (fast, names only)
final names = await brew.listNames();

// List installed (rich, full details)
final packages = await brew.listInstalled();
```

### Taps

```dart
final taps = await brew.taps();
for (final t in taps) {
  print('${t.name} (${t.formulaCount ?? 0} formulae)');
}

await brew.tap('homebrew/cask-fonts');
await brew.untap('homebrew/cask-fonts');
```

### Services

```dart
final services = await brew.services();
for (final s in services) {
  print('${s.name}: ${s.status.name}');
}

await brew.startService('postgresql@16');
await brew.stopService('postgresql@16');
await brew.restartService('redis');
```

### System Maintenance

```dart
// Update Homebrew itself
final update = await brew.update();

// Link / unlink
await brew.link('openssl@3', force: true);
await brew.unlink('openssl@3');

// Pin / unpin
await brew.pin('node');
await brew.unpin('node');
final pinned = await brew.pinned();

// Doctor
final report = await brew.doctor();
if (!report.healthy) {
  for (final d in report.diagnostics) {
    print('${d.severity.name}: ${d.title}');
  }
}

// Config
final config = await brew.config();
print('Prefix: ${config.prefix}');
```

### Brewfile Support

```dart
// Dump current state to a Brewfile
await brew.bundleDump(file: 'Brewfile', force: true);

// Parse a Brewfile
final brewfile = await brew.readBrewfile('Brewfile');
for (final entry in brewfile.entries) {
  print('${entry.type.name}: ${entry.name}');
}

// Install from Brewfile
final bundleResult = await brew.bundle(file: 'Brewfile');
print('Success: ${bundleResult.success}');

// Check Brewfile satisfaction
final check = await brew.bundleCheck(file: 'Brewfile');
print('Satisfied: ${check.satisfied}');
```

### Optional HTTP API Client

For catalog browsing when brew may not be installed. Import separately:

```dart
import 'package:brew_dart/remote.dart';

void main() async {
  final client = BrewApiClient(
    httpGet: (url) async {
      // Provide your own HTTP GET implementation
      final response = await http.get(url);
      return response.body;
    },
  );

  final formulae = await client.allFormulae();
  print('${formulae.length} formulae available');

  final detail = await client.formula('git');
  print('${detail.name}: ${detail.desc}');
}
```

> **Note:** The HTTP API is static, unversioned, read-only, and knows nothing about local state. Use it for browsing/discovery only, not as a source of truth.

## Architecture

```
brew_dart/
├── lib/
│   ├── brew_dart.dart              # barrel export
│   ├── remote.dart                 # optional HTTP API barrel
│   └── src/
│       ├── brew.dart               # unified Brew facade
│       ├── exceptions.dart         # exception hierarchy
│       ├── cli/
│       │   ├── brew_cli.dart       # Process.run / Process.start wrapper
│       │   └── brew_process_result.dart
│       ├── models/                 # freezed data classes
│       ├── parsers/                # JSON v2 + text parsers
│       └── remote/                 # optional HTTP API client
├── test/
│   ├── cli/                        # CLI runner unit tests
│   ├── parsers/                    # parser unit tests + golden files
│   ├── models/                     # model unit tests
│   ├── facade/                     # Brew facade tests (mocked CLI)
│   ├── remote/                     # API client tests
│   ├── integration/                # real brew tests (macOS CI)
│   └── manual/                     # local-only edge case scripts
└── example/
```

## Testing

Three tiers of tests:

- **Tier 1 — Unit tests** (`dart test`): mocked `Process.run`, golden-file-backed parsers, runs on Linux CI every push. Target: 100% line coverage.
- **Tier 2 — Integration tests** (`dart test --tags integration`): real brew on macOS CI, weekly schedule. ~15 smoke tests.
- **Tier 3 — Manual scripts** (`dart test/manual/*.dart`): local-only edge cases for services, taps, Brewfiles, etc.

```bash
# Run unit tests
dart test --exclude-tags integration

# Run integration tests (requires brew)
dart test --tags integration

# Capture fresh golden files (requires brew)
./scripts/capture_golden_files.sh
```

## License

See [LICENSE](LICENSE) for details.
