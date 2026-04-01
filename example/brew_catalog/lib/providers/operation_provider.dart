import 'package:brew_dart/brew_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/view_models.dart';
import 'brew_provider.dart';
import 'packages_provider.dart';

/// Manages running brew operations with streaming progress.
class OperationsNotifier extends StateNotifier<List<BrewOperation>> {
  final Ref _ref;

  OperationsNotifier(this._ref) : super([]);

  /// Install a package with live progress.
  Future<void> install(String name, {bool cask = false}) async {
    final op = BrewOperation(
      id: UniqueKey().toString(),
      package: name,
      type: OperationType.install,
      status: OperationStatus.running,
    );
    state = [...state, op];

    try {
      final connState = await _ref.read(brewConnectionProvider.future);
      final brew = getBrewOrThrow(connState);

      final lines = <String>[];
      await for (final output in brew.installStream(name, cask: cask)) {
        lines.add(output.line);
        _updateOp(op.id, progress: lines.join('\n'));
      }

      _updateOp(op.id, status: OperationStatus.completed);
      _ref.invalidate(installedPackagesProvider);
      _ref.invalidate(outdatedPackagesProvider);
    } catch (e) {
      _updateOp(op.id, status: OperationStatus.failed, error: e.toString());
    }
  }

  /// Uninstall a package.
  Future<void> uninstall(String name, {bool cask = false}) async {
    final op = BrewOperation(
      id: UniqueKey().toString(),
      package: name,
      type: OperationType.uninstall,
      status: OperationStatus.running,
    );
    state = [...state, op];

    try {
      final connState = await _ref.read(brewConnectionProvider.future);
      final brew = getBrewOrThrow(connState);

      final result = await brew.uninstall(name, cask: cask);
      _updateOp(
        op.id,
        status:
            result.success ? OperationStatus.completed : OperationStatus.failed,
        progress: result.output,
        error: result.errorMessage,
      );
      _ref.invalidate(installedPackagesProvider);
      _ref.invalidate(outdatedPackagesProvider);
    } catch (e) {
      _updateOp(op.id, status: OperationStatus.failed, error: e.toString());
    }
  }

  /// Upgrade a single package.
  Future<void> upgrade(String name, {bool cask = false}) async {
    final op = BrewOperation(
      id: UniqueKey().toString(),
      package: name,
      type: OperationType.upgrade,
      status: OperationStatus.running,
    );
    state = [...state, op];

    try {
      final connState = await _ref.read(brewConnectionProvider.future);
      final brew = getBrewOrThrow(connState);

      final lines = <String>[];
      await for (final output in brew.upgradeStream(name, cask: cask)) {
        lines.add(output.line);
        _updateOp(op.id, progress: lines.join('\n'));
      }

      _updateOp(op.id, status: OperationStatus.completed);
      _ref.invalidate(installedPackagesProvider);
      _ref.invalidate(outdatedPackagesProvider);
    } catch (e) {
      _updateOp(op.id, status: OperationStatus.failed, error: e.toString());
    }
  }

  /// Upgrade all outdated packages.
  Future<void> upgradeAll() async {
    final connState = await _ref.read(brewConnectionProvider.future);
    final brew = getBrewOrThrow(connState);
    final outdated = await brew.outdated();

    for (final pkg in outdated) {
      await upgrade(pkg.name, cask: pkg.isCask);
    }
  }

  /// Clear completed/failed operations.
  void clearFinished() {
    state = state
        .where(
            (op) => op.status == OperationStatus.running || op.status == OperationStatus.pending)
        .toList();
  }

  void _updateOp(
    String id, {
    OperationStatus? status,
    String? progress,
    String? error,
  }) {
    state = [
      for (final op in state)
        if (op.id == id)
          op.copyWith(
            status: status ?? op.status,
            progress: progress ?? op.progress,
            error: error,
          )
        else
          op,
    ];
  }
}

final operationsProvider =
    StateNotifierProvider<OperationsNotifier, List<BrewOperation>>(
  (ref) => OperationsNotifier(ref),
);

/// Active (running) operations.
final activeOperationsProvider = Provider<List<BrewOperation>>((ref) {
  return ref
      .watch(operationsProvider)
      .where((op) => op.status == OperationStatus.running)
      .toList();
});
