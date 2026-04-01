import 'cask.dart';
import 'formula.dart';

/// Combined result from `brew info --json=v2` for a single package.
///
/// A package is either a formula or a cask (or both names could match).
/// The JSON v2 response always contains both `formulae` and `casks` arrays.
class PackageInfo {
  /// The formula info, if this package is a formula.
  final Formula? formula;

  /// The cask info, if this package is a cask.
  final Cask? cask;

  const PackageInfo({this.formula, this.cask});

  /// The display name of the package.
  String get name {
    if (formula != null) return formula!.name;
    if (cask != null) return cask!.token;
    return '';
  }

  /// Whether this is a formula.
  bool get isFormula => formula != null;

  /// Whether this is a cask.
  bool get isCask => cask != null;

  /// The description from whichever type is available.
  String get desc {
    if (formula != null) return formula!.desc;
    if (cask != null) return cask!.desc;
    return '';
  }

  /// The homepage from whichever type is available.
  String get homepage {
    if (formula != null) return formula!.homepage;
    if (cask != null) return cask!.homepage;
    return '';
  }
}
