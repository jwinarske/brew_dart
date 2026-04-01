import 'cask.dart';
import 'formula.dart';

/// An installed package, wrapping either a [Formula] or [Cask] with
/// installed version details.
///
/// Returned by methods that query `brew info --json=v2 --installed`.
class InstalledPackage {
  /// The formula, if this is an installed formula.
  final Formula? formula;

  /// The cask, if this is an installed cask.
  final Cask? cask;

  const InstalledPackage({this.formula, this.cask});

  /// The display name.
  String get name {
    if (formula != null) return formula!.name;
    if (cask != null) return cask!.token;
    return '';
  }

  /// Whether this is a formula.
  bool get isFormula => formula != null;

  /// Whether this is a cask.
  bool get isCask => cask != null;

  /// The installed version string.
  String get installedVersion {
    if (formula != null && formula!.installed != null && formula!.installed!.isNotEmpty) {
      return formula!.installed!.last.version;
    }
    if (cask != null && cask!.installedVersion != null) {
      return cask!.installedVersion!;
    }
    return '';
  }

  /// Whether this package is outdated.
  bool get isOutdated {
    if (formula != null) return formula!.outdated ?? false;
    if (cask != null) return cask!.outdated ?? false;
    return false;
  }
}
