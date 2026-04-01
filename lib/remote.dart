/// Optional HTTP API client for the formulae.brew.sh catalog.
///
/// This library is standalone and not wired into the main [Brew] facade.
/// It is useful for catalog browsing UIs where brew may not be installed.
///
/// **Caveats:**
/// - Static files with no versioning — schema can change without warning
/// - Read-only: no local state, no installed packages, no mutations
/// - Data may lag behind what `brew` sees locally
/// - Use for browsing/discovery only, not as a source of truth
///
/// Does not depend on any HTTP library. Consumers provide their own
/// HTTP GET function via the [HttpGetFn] typedef.
library brew_dart_remote;

export 'src/remote/api_models.dart';
export 'src/remote/brew_api_client.dart';
