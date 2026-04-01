import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

/// Status of a Homebrew-managed service.
enum ServiceStatus {
  started,
  stopped,
  error,
  unknown,
  none,
}

/// A Homebrew-managed service as reported by `brew services list`.
@freezed
class BrewService with _$BrewService {
  const factory BrewService({
    required String name,
    required ServiceStatus status,
    String? user,
    String? file,
  }) = _BrewService;

  factory BrewService.fromJson(Map<String, dynamic> json) =>
      _$BrewServiceFromJson(json);
}
