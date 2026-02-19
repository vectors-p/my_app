import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_suggestion.freezed.dart';

@freezed
abstract class CitySuggestion with _$CitySuggestion {
  const factory CitySuggestion({
    required String displayName,
    required String city,
    required double latitude,
    required double longitude,
  }) = _CitySuggestion;
}
