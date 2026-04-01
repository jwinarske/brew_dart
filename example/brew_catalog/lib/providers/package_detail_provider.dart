import 'package:brew_dart/brew_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'brew_provider.dart';

/// Currently selected package name.
final selectedPackageProvider = StateProvider<String?>((ref) => null);

/// Detail info for a specific package — backed by `brew info --json=v2 <name>`.
final packageDetailProvider =
    FutureProvider.family<PackageInfo, String>((ref, name) async {
  final state = await ref.watch(brewConnectionProvider.future);
  final brew = getBrewOrThrow(state);
  return brew.info(name);
});
