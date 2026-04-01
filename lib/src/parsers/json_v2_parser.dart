import '../models/cask.dart';
import '../models/formula.dart';
import '../models/installed_package.dart';
import '../models/outdated_package.dart';
import '../models/package_info.dart';

/// Parses `--json=v2` output from `brew info` and `brew outdated`.
///
/// The JSON v2 schema always returns a top-level object with `formulae` and
/// `casks` arrays. This parser handles extracting and deserialising both.
class JsonV2Parser {
  const JsonV2Parser();

  /// Parse `brew info --json=v2` output into a list of [PackageInfo].
  ///
  /// The response contains both `formulae` and `casks` arrays. Each package
  /// that was queried appears in exactly one of the two arrays.
  List<PackageInfo> parseInfo(dynamic json) {
    final map = json as Map<String, dynamic>;
    final results = <PackageInfo>[];

    final formulae = map['formulae'] as List<dynamic>? ?? [];
    for (final f in formulae) {
      results.add(
        PackageInfo(formula: Formula.fromJson(f as Map<String, dynamic>)),
      );
    }

    final casks = map['casks'] as List<dynamic>? ?? [];
    for (final c in casks) {
      results.add(PackageInfo(cask: Cask.fromJson(c as Map<String, dynamic>)));
    }

    return results;
  }

  /// Parse `brew info --json=v2 --installed` output into [InstalledPackage]s.
  List<InstalledPackage> parseInstalled(dynamic json) {
    final map = json as Map<String, dynamic>;
    final results = <InstalledPackage>[];

    final formulae = map['formulae'] as List<dynamic>? ?? [];
    for (final f in formulae) {
      results.add(
        InstalledPackage(formula: Formula.fromJson(f as Map<String, dynamic>)),
      );
    }

    final casks = map['casks'] as List<dynamic>? ?? [];
    for (final c in casks) {
      results.add(
        InstalledPackage(cask: Cask.fromJson(c as Map<String, dynamic>)),
      );
    }

    return results;
  }

  /// Parse `brew outdated --json=v2` output into [OutdatedPackage]s.
  ///
  /// The outdated JSON v2 response has `formulae` and `casks` arrays, each
  /// containing objects with `name`, `installed_versions`,
  /// `current_version`, and `pinned` fields.
  List<OutdatedPackage> parseOutdated(dynamic json) {
    final map = json as Map<String, dynamic>;
    final results = <OutdatedPackage>[];

    final formulae = map['formulae'] as List<dynamic>? ?? [];
    for (final f in formulae) {
      final m = f as Map<String, dynamic>;
      results.add(
        OutdatedPackage(
          name: m['name'] as String,
          currentVersion:
              m['current_version'] as String? ?? _firstInstalledVersion(m),
          installedVersions: _installedVersions(m),
          latestVersion: m['latest_version'] as String? ?? '',
          pinned: m['pinned'] as bool? ?? false,
          isCask: false,
        ),
      );
    }

    final casks = map['casks'] as List<dynamic>? ?? [];
    for (final c in casks) {
      final m = c as Map<String, dynamic>;
      results.add(
        OutdatedPackage(
          name: m['name'] as String,
          currentVersion:
              m['current_version'] as String? ?? _firstInstalledVersion(m),
          installedVersions: _installedVersions(m),
          latestVersion: m['latest_version'] as String? ?? '',
          pinned: m['pinned'] as bool? ?? false,
          isCask: true,
        ),
      );
    }

    return results;
  }

  String _firstInstalledVersion(Map<String, dynamic> m) {
    final versions = _installedVersions(m);
    if (versions.isNotEmpty) {
      return versions.last;
    }
    return '';
  }

  List<String> _installedVersions(Map<String, dynamic> m) {
    final raw = m['installed_versions'];
    if (raw is List) {
      return raw.whereType<String>().toList();
    }
    if (raw is String && raw.isNotEmpty) {
      return <String>[raw];
    }
    return <String>[];
  }
}
