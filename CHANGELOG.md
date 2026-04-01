## 0.1.0

- Initial release.
- CLI runner (`BrewCli`) with `run`, `runJson`, and `stream` methods.
- Strongly-typed models for formulae, casks, taps, services, and more using `freezed`.
- JSON v2 parsing for `brew info`, `brew outdated`, and `brew tap-info`.
- Text parsing for `brew search`, `brew list`, `brew services list`, `brew doctor`, and `brew config`.
- Unified `Brew` facade covering:
  - Detection and environment (`isInstalled`, `version`, `config`, `doctor`, `prefix`, `cellarPath`).
  - Query and info (`info`, `installed`, `outdated`, `search`).
  - Package management (`install`, `uninstall`, `upgrade`, `cleanup`) with batch and streaming support.
  - Dependency and tap management (`deps`, `uses`, `missing`, `taps`, `tap`, `untap`).
  - System maintenance (`update`, `link`, `unlink`, `pin`, `unpin`, `services`).
  - Brewfile support (`readBrewfile`, `bundleDump`, `bundle`, `bundleCheck`).
- Optional HTTP API client for formulae.brew.sh catalog browsing (`BrewApiClient`).
- Exception hierarchy (`BrewException`, `BrewCommandException`, `PackageNotFoundException`, etc.).
