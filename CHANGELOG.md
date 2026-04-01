# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
