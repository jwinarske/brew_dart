import 'dart:async';

import 'package:brew_dart/brew_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/view_models.dart';

/// The singleton Brew instance.
final brewInstanceProvider = Provider<Brew>((ref) => Brew());

/// Connection state — checks if brew is installed and gets version info.
final brewConnectionProvider =
    FutureProvider<BrewConnectionState>((ref) async {
  final brew = ref.watch(brewInstanceProvider);
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
