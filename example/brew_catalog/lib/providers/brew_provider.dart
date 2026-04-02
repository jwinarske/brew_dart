import 'package:brew_dart/brew_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/view_models.dart';

/// Resolves the brew executable path once at startup.
/// GUI apps on macOS don't inherit the shell PATH, so we probe known locations.
final brewPathProvider = FutureProvider<String>((ref) async {
  return BrewCli.resolveBrewPath();
});

/// The singleton Brew instance, constructed with the resolved path.
final brewInstanceProvider = FutureProvider<Brew>((ref) async {
  final path = await ref.watch(brewPathProvider.future);
  return Brew(cli: BrewCli(brewPath: path));
});

/// Connection state — checks if brew is installed and gets version info.
final brewConnectionProvider = FutureProvider<BrewConnectionState>((ref) async {
  final brew = await ref.watch(brewInstanceProvider.future);
  final installed = await brew.isInstalled();
  if (!installed) {
    return const BrewNotInstalledState();
  }
  final version = await brew.version();
  final config = await brew.config();
  return BrewConnectedState(
    brew: brew,
    version: version,
    prefix: config.prefix,
  );
});

/// Helper to get the connected Brew instance or throw.
Brew getBrewOrThrow(BrewConnectionState state) {
  if (state is BrewConnectedState) {
    return state.brew as Brew;
  }
  throw StateError('Homebrew is not installed');
}
