import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }

  final version = await brew.version();
  print('Homebrew version: $version');

  final prefix = await brew.prefix();
  print('Prefix: $prefix');

  final cellar = await brew.cellarPath();
  print('Cellar: $cellar');

  final config = await brew.config();
  print('OS: ${config.os}');
  print('CPU: ${config.cpu}');

  final report = await brew.doctor();
  if (report.healthy) {
    print('System is ready to brew!');
  } else {
    print('Found ${report.diagnostics.length} issue(s):');
    for (final diagnostic in report.diagnostics) {
      print('  ${diagnostic.severity.name}: ${diagnostic.title}');
    }
  }
}
