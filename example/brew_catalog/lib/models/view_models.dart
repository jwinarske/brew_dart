/// A simplified package item for display in lists.
class PackageListItem {
  final String name;
  final String version;
  final String description;
  final bool isInstalled;
  final bool hasUpdate;
  final bool isCask;
  final String? installCount;

  const PackageListItem({
    required this.name,
    required this.version,
    required this.description,
    this.isInstalled = false,
    this.hasUpdate = false,
    this.isCask = false,
    this.installCount,
  });
}

/// Sort options for package lists.
enum PackageSort { name, popular, recentlyUpdated }

/// Filter for formula vs cask.
enum PackageFilter { all, formulae, casks }

/// Type of brew operation.
enum OperationType {
  install('Installing'),
  uninstall('Uninstalling'),
  upgrade('Upgrading'),
  update('Updating');

  final String label;
  const OperationType(this.label);
}

/// Status of a running operation.
enum OperationStatus { pending, running, completed, failed }

/// A tracked brew operation with live progress.
class BrewOperation {
  final String id;
  final String package;
  final OperationType type;
  final OperationStatus status;
  final String progress;
  final String? error;

  const BrewOperation({
    required this.id,
    required this.package,
    required this.type,
    this.status = OperationStatus.pending,
    this.progress = '',
    this.error,
  });

  BrewOperation copyWith({
    OperationStatus? status,
    String? progress,
    String? error,
  }) {
    return BrewOperation(
      id: id,
      package: package,
      type: type,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BrewOperation && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'BrewOperation($package, ${type.label}, ${status.name})';
}

/// Connection state for the Brew instance.
sealed class BrewConnectionState {
  const BrewConnectionState();
}

class BrewNotInstalledState extends BrewConnectionState {
  const BrewNotInstalledState();
}

class BrewConnectedState extends BrewConnectionState {
  final dynamic brew; // Brew instance
  final String version;
  final String prefix;

  const BrewConnectedState({
    required this.brew,
    required this.version,
    required this.prefix,
  });
}
