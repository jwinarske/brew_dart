import 'dart:convert';

import 'api_models.dart';

/// Function type for making HTTP GET requests.
///
/// This abstraction allows consumers to provide their own HTTP client
/// (e.g. `package:http`, `package:dio`, or `dart:io` HttpClient) without
/// this package depending on any specific HTTP library.
///
/// The function should return the response body as a [String].
/// It should throw on non-2xx status codes.
typedef HttpGetFn = Future<String> Function(Uri url);

/// Optional HTTP API client for the formulae.brew.sh catalog.
///
/// This is a standalone utility, **not** wired into the main [Brew] facade.
/// It is useful for catalog browsing UIs where brew may not be installed.
///
/// Import separately:
/// ```dart
/// import 'package:brew_dart/remote.dart';
/// ```
///
/// **Caveats:**
/// - Static files with no versioning — schema can change without warning
/// - Read-only: no local state, no installed packages, no mutations
/// - Data may lag behind what `brew` sees locally
/// - Use for browsing/discovery only, not as a source of truth
class BrewApiClient {
  /// Base URL for the Homebrew formulae API.
  static const baseUrl = 'https://formulae.brew.sh/api';

  final HttpGetFn _get;

  /// Creates a [BrewApiClient] with the given HTTP GET function.
  ///
  /// Example with `package:http`:
  /// ```dart
  /// import 'package:http/http.dart' as http;
  ///
  /// final client = BrewApiClient(
  ///   httpGet: (url) async {
  ///     final response = await http.get(url);
  ///     if (response.statusCode != 200) {
  ///       throw Exception('HTTP ${response.statusCode}');
  ///     }
  ///     return response.body;
  ///   },
  /// );
  /// ```
  BrewApiClient({required HttpGetFn httpGet}) : _get = httpGet;

  /// Fetch all formulae summaries.
  ///
  /// `GET /api/formula.json`
  Future<List<FormulaSummary>> allFormulae() async {
    final body = await _get(Uri.parse('$baseUrl/formula.json'));
    final json = jsonDecode(body) as List<dynamic>;
    return json
        .map((e) => FormulaSummary.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Fetch all cask summaries.
  ///
  /// `GET /api/cask.json`
  Future<List<CaskSummary>> allCasks() async {
    final body = await _get(Uri.parse('$baseUrl/cask.json'));
    final json = jsonDecode(body) as List<dynamic>;
    return json
        .map((e) => CaskSummary.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Fetch detailed info for a single formula.
  ///
  /// `GET /api/formula/{name}.json`
  Future<FormulaDetail> formula(String name) async {
    final body = await _get(Uri.parse('$baseUrl/formula/$name.json'));
    return FormulaDetail.fromJson(jsonDecode(body) as Map<String, dynamic>);
  }

  /// Fetch detailed info for a single cask.
  ///
  /// `GET /api/cask/{name}.json`
  Future<CaskDetail> cask(String name) async {
    final body = await _get(Uri.parse('$baseUrl/cask/$name.json'));
    return CaskDetail.fromJson(jsonDecode(body) as Map<String, dynamic>);
  }

  /// Fetch install-on-request analytics.
  ///
  /// `GET /api/analytics/install-on-request/homebrew-core/{days}d.json`
  Future<AnalyticsData> installAnalytics({int days = 30}) async {
    final body = await _get(
      Uri.parse(
        '$baseUrl/analytics/install-on-request/homebrew-core/${days}d.json',
      ),
    );
    final json = jsonDecode(body) as Map<String, dynamic>;

    // The API returns items as a list of {formula: count} maps under
    // "items" or "formulae". Normalize to a simple Map<String, int>.
    final items = <String, int>{};
    final rawItems =
        json['items'] as List<dynamic>? ??
        json['formulae'] as List<dynamic>? ??
        [];
    for (final item in rawItems) {
      if (item is Map<String, dynamic>) {
        for (final entry in item.entries) {
          if (entry.value is int) {
            items[entry.key] = entry.value as int;
          } else if (entry.value is String) {
            items[entry.key] = int.tryParse(entry.value as String) ?? 0;
          }
        }
      }
    }

    return AnalyticsData(
      category: json['category'] as String? ?? 'install-on-request',
      totalItems: json['total_items'] as int? ?? items.length,
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String? ?? '',
      totalCount: json['total_count'] as int? ?? 0,
      items: items,
    );
  }
}
