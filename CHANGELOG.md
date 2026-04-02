# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2026-04-02

### Fixed

- **pub.dev static analysis**: committed generated `*.freezed.dart` and `*.g.dart` files so pub.dev's analyzer can resolve types without running `build_runner`. Updated `.gitignore` to only exclude generated files under `example/`, not `lib/`.

### Changed

- **`pubspec.yaml` description** shortened to 154 characters (within the 60–180 pub point limit) to achieve a perfect **160/160 pub points** score.
- **`analysis_options.yaml`** updated to use `package:lints/recommended.yaml` (was `package:lints/core.yaml`).

### Docs

- Added Flutter example app screenshot (`doc/flutter_example_01.png`) to README.

## [0.2.0] - 2026-04-01

### Changed

- **CI coverage threshold raised** from 30% to 60% now that auto-generated files are excluded from measurement.

### Fixed

- **Coverage reporting**: `codecov.yml` added to instruct Codecov to ignore `*.g.dart` and `*.freezed.dart` files; CI pipeline now strips those files from `lcov.info` via a post-processing step before uploading, removing ~1,900 lines of boilerplate from the headline number.

### Tests

- Test count increased from **140 → 256** (+116 tests); hand-written-code coverage reaches **99%**.
- `FakeBrewCli` extended with `whenRunThrows()` to exercise exception-catch branches without spawning a real process.
- New test groups covering previously untested paths:
  - `Brew` facade: `upgradeAll`, `uninstallAll`, parallel `installAll`, `upgradeStream`, `updateStream`, `listInstalled` filtering, error-throw paths for every Phase 1–6 method, `isInstalled` exception branches, default constructor, `cli` getter, `search`/`install`/`uninstall`/`cleanup`/`upgrade`/`bundle`/`bundleCheck` flag variants.
  - `BrewCli`: `run()` success/stderr/`extraEnv`, `runJson()` success, `stream()` stdout, stderr, and non-zero exit.
  - `ServicesParser`: `_parseFallback` path, multi-token file path, `none`/`unknown` status values.
  - `JsonV2Parser`: outdated casks, `installed_versions` as legacy string, missing `current_version` fallback, null/absent versions.
  - `BrewfileParser`: Ruby `:symbol`, `true`/`false` booleans, quoted string option values, `whalebrew` entry type.
  - `SearchParser`: `==> Formulae` header branch, `_Section.none` pre-header lines, unknown section header handling.
  - `DoctorParser`: `Error:` severity, mixed warning + error output.
  - `BrewApiClient`: `installAnalytics` fallback to `formulae` key, string-valued counts, 90-day range, empty items; `CaskDetail` with `depends_on`/`auto_updates`.
  - New file `test/models/additional_models_test.dart`: `BundleResult`/`BundleCheckResult` `toString()`; `fromJson` round-trips for `BrewConfig`, `BrewfileEntry`, `Brewfile`, `MissingDependency`, `Diagnostic`, `DoctorReport`, `OutdatedPackage`, `BrewService`.

## 0.1.0

### Added

- **CLI runner** (`BrewCli`) with `run`, `runJson`, and `stream` methods wrapping `Process.run` / `Process.start`.
- **Environment defaults** -- every invocation sets `HOMEBREW_NO_COLOR`, `HOMEBREW_NO_EMOJI`, `HOMEBREW_NO_AUTO_UPDATE`, `HOMEBREW_NO_ANALYTICS`, `HOMEBREW_NO_ENV_HINTS`.
- **Strongly-typed models** using `freezed`:
  - `Formula`, `FormulaVersions`, `InstalledVersion`, `RuntimeDependency`
  - `Cask`
  - `Tap`
  - `BrewService`, `ServiceStatus`
  - `BrewConfig`
  - `DoctorReport`, `Diagnostic`, `DiagnosticSeverity`
  - `OutdatedPackage`
  - `InstalledPackage`, `PackageInfo`
  - `SearchResult`
  - `InstallResult`, `UninstallResult`, `UpgradeResult`, `CleanupResult`, `UpdateResult`, `BatchResult`
  - `Brewfile`, `BrewfileEntry`, `BundleResult`, `BundleCheckResult`
  - `MissingDependency`
- **Parsers**:
  - `JsonV2Parser` for `brew info --json=v2`, `brew outdated --json=v2`
  - `SearchParser` for `brew search` text output
  - `ListParser` for `brew list` text output
  - `ServicesParser` for `brew services list` tabular output
  - `DoctorParser` for `brew doctor` diagnostics
  - `ConfigParser` for `brew config` key-value output
  - `BrewfileParser` for Brewfile Ruby DSL
- **Unified `Brew` facade** with methods for:
  - Detection & environment: `isInstalled`, `version`, `config`, `doctor`, `prefix`, `cellarPath`
  - Query & info: `info`, `infoMultiple`, `installed`, `outdated`, `search`
  - Package management: `install`, `installAll`, `installStream`, `uninstall`, `uninstallAll`, `cleanup`, `upgrade`, `upgradeAll`, `upgradeStream`
  - List: `listNames`, `listInstalled`, `isPackageInstalled`
  - Dependencies: `deps`, `uses`, `missing`
  - Taps: `taps`, `tap`, `untap`
  - System: `update`, `updateStream`, `link`, `unlink`, `pin`, `unpin`, `pinned`
  - Services: `services`, `startService`, `stopService`, `restartService`
  - Brewfile: `readBrewfile`, `bundleDump`, `bundle`, `bundleCheck`
- **Exception hierarchy**: `BrewException`, `BrewNotInstalledException`, `BrewCommandException`, `PackageNotFoundException`, `InstallFailedException`, `DependencyConflictException`, `CommandTimeoutException`.
- **Optional HTTP API client** (`BrewApiClient`) for formulae.brew.sh catalog browsing, importable separately via `package:brew_dart/remote.dart`. Uses `HttpGetFn` typedef to avoid adding an HTTP dependency.
