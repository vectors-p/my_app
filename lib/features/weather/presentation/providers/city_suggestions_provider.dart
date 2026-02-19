import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/core/constants/api_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/city_suggestion.dart';

part 'city_suggestions_provider.g.dart';

@riverpod
Future<List<CitySuggestion>> citySuggestions(Ref ref, String query) async {
  if (query.trim().length < 2) return [];

  final uri = Uri.parse(
    '${ApiConstants.geocodingBaseUrl}?name=$query&count=5&language=en&format=json',
  );

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final results = json['results'] as List<dynamic>?;
    if (results == null) return [];

    return results.map((r) {
      final name = r['name'] as String;
      final country = r['country'] as String? ?? '';
      final admin = r['admin1'] as String?;
      final displayName = admin != null
          ? '$name, $admin, $country'
          : '$name, $country';
      return CitySuggestion(
        displayName: displayName,
        city: name,
        latitude: (r['latitude'] as num).toDouble(),
        longitude: (r['longitude'] as num).toDouble(),
      );
    }).toList();
  }
  return [];
}
