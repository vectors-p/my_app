// lib/features/weather/presentation/providers/city_suggestions_provider.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_suggestions_provider.g.dart';

@riverpod
Future<List<String>> citySuggestions(Ref ref, String query) async {
  if (query.trim().length < 2) return [];

  final uri = Uri.parse(
    'https://geocoding-api.open-meteo.com/v1/search?name=$query&count=5&language=en&format=json',
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
      return admin != null ? '$name, $admin, $country' : '$name, $country';
    }).toList();
  }

  return [];
}
