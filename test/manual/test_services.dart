// Run: dart test/manual/test_services.dart
//
// Prerequisites:
//   brew install dnsmasq  (or any formula with a service)
//
// This test lists services, starts one, checks status, and stops it.
// Verify output visually — launchctl behaviour varies by macOS version.

import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }

  print('=== Listing services ===');
  final services = await brew.services();
  if (services.isEmpty) {
    print('No services found. Install a formula with a service first.');
    print('  e.g. brew install dnsmasq');
    return;
  }

  for (final s in services) {
    print('  ${s.name}: ${s.status.name}'
        '${s.user != null ? ' (user: ${s.user})' : ''}'
        '${s.file != null ? ' [${s.file}]' : ''}');
  }

  // Find a stopped service to test with
  final stopped = services.where((s) => s.status == ServiceStatus.stopped);
  if (stopped.isEmpty) {
    print('\nNo stopped services to test start/stop cycle with.');
    return;
  }

  final target = stopped.first.name;
  print('\n=== Starting $target ===');
  try {
    await brew.startService(target);
    print('Started.');
  } catch (e) {
    print('Failed to start: $e');
    return;
  }

  print('\n=== Services after start ===');
  final afterStart = await brew.services();
  final started = afterStart.firstWhere((s) => s.name == target);
  print('  ${started.name}: ${started.status.name}');

  print('\n=== Stopping $target ===');
  try {
    await brew.stopService(target);
    print('Stopped.');
  } catch (e) {
    print('Failed to stop: $e');
    return;
  }

  print('\n=== Services after stop ===');
  final afterStop = await brew.services();
  final stoppedAgain = afterStop.firstWhere((s) => s.name == target);
  print('  ${stoppedAgain.name}: ${stoppedAgain.status.name}');

  print('\nService lifecycle test complete.');
}
