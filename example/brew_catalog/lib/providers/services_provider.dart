import 'dart:async';

import 'package:brew_dart/brew_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'brew_provider.dart';

/// Brew services list — auto-refreshes every 5 seconds when watched.
final servicesProvider = FutureProvider<List<BrewService>>((ref) async {
  final state = await ref.watch(brewConnectionProvider.future);
  final brew = getBrewOrThrow(state);

  // Auto-refresh every 5 seconds.
  final timer = Timer(const Duration(seconds: 5), () {
    ref.invalidateSelf();
  });
  ref.onDispose(timer.cancel);

  return brew.services();
});

/// Taps list.
final tapsProvider = FutureProvider<List<Tap>>((ref) async {
  final state = await ref.watch(brewConnectionProvider.future);
  final brew = getBrewOrThrow(state);
  return brew.taps();
});
