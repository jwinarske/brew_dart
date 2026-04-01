# Manual Test Scripts

These scripts test edge cases that are impractical to automate in CI.
Run them locally on a macOS machine with Homebrew installed.

## Prerequisites

- macOS with Homebrew installed
- Dart SDK on PATH
- Run `dart pub get` in the project root first

## Running

```bash
# From the project root:
dart test/manual/test_services.dart
dart test/manual/test_tap_lifecycle.dart
dart test/manual/test_brewfile_roundtrip.dart
dart test/manual/test_upgrade_workflow.dart
dart test/manual/test_batch_install.dart
dart test/manual/test_link_conflicts.dart
dart test/manual/test_cleanup.dart
dart test/manual/test_error_scenarios.dart
```

Each script prints its progress and asserts expected outcomes.
Review output visually for correctness, especially for platform-specific
behavior (launchctl, symlinks, etc.).
