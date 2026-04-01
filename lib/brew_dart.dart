/// A Dart package providing full programmatic access to Homebrew.
///
/// ```dart
/// import 'package:brew_dart/brew_dart.dart';
///
/// void main() async {
///   final brew = Brew();
///   if (await brew.isInstalled()) {
///     print('Homebrew ${await brew.version()}');
///   }
/// }
/// ```
library brew_dart;

export 'src/brew.dart';
export 'src/cli/brew_cli.dart';
export 'src/cli/brew_process_result.dart';
export 'src/exceptions.dart';
export 'src/models/batch_result.dart';
export 'src/models/brew_config.dart';
export 'src/models/cask.dart';
export 'src/models/doctor_report.dart';
export 'src/models/formula.dart';
export 'src/models/installed_package.dart';
export 'src/models/outdated_package.dart';
export 'src/models/package_info.dart';
export 'src/models/search_result.dart';
export 'src/parsers/config_parser.dart';
export 'src/parsers/doctor_parser.dart';
export 'src/parsers/json_v2_parser.dart';
export 'src/parsers/list_parser.dart';
export 'src/parsers/search_parser.dart';
