import 'dart:async';

import 'package:brew_dart/brew_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'brew_provider.dart';

/// All installed packages — backed by `brew info --json=v2 --installed`.
final installedPackagesProvider = FutureProvider<List<InstalledPackage>>((
  ref,
) async {
  final state = await ref.watch(brewConnectionProvider.future);
  final brew = getBrewOrThrow(state);
  return brew.installed();
});

/// Outdated packages — backed by `brew outdated --json=v2`.
final outdatedPackagesProvider = FutureProvider<List<OutdatedPackage>>((
  ref,
) async {
  final state = await ref.watch(brewConnectionProvider.future);
  final brew = getBrewOrThrow(state);
  return brew.outdated();
});

/// Search query text.
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Debounced search results.
final searchResultsProvider = FutureProvider<SearchResult>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.length < 2) {
    return const SearchResult();
  }

  // Simple debounce: if the query changes within 300ms, this provider
  // will be cancelled and re-run.
  await Future<void>.delayed(const Duration(milliseconds: 300));

  final state = await ref.read(brewConnectionProvider.future);
  final brew = getBrewOrThrow(state);
  return brew.search(query);
});

/// Fast installed names list for badge lookups.
final installedNamesProvider = FutureProvider<Set<String>>((ref) async {
  final packages = await ref.watch(installedPackagesProvider.future);
  return packages.map((p) => p.name).toSet();
});

/// Outdated names set for badge lookups.
final outdatedNamesProvider = FutureProvider<Set<String>>((ref) async {
  final packages = await ref.watch(outdatedPackagesProvider.future);
  return packages.map((p) => p.name).toSet();
});

/// Pinned packages — backed by `brew list --pinned`.
final pinnedPackagesProvider = FutureProvider<List<String>>((ref) async {
  final state = await ref.watch(brewConnectionProvider.future);
  final brew = getBrewOrThrow(state);
  return brew.pinned();
});
