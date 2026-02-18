// lib/features/weather/presentation/providers/weather_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/weather_model.dart';
import '../../data/repositories/weather_repository.dart';
import 'search_history_provider.dart';

part 'weather_provider.g.dart';

@riverpod
Future<WeatherModel> weather(
  Ref ref, {
  required String city,
  required String country,
  required double latitude,
  required double longitude,
}) async {
  final repo = ref.read(weatherRepositoryProvider);
  final result = await repo.getWeather(
    city: city,
    country: country,
    latitude: latitude,
    longitude: longitude,
  );
  ref.read(searchHistoryProvider.notifier).add(city);
  return result;
}
