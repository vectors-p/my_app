// lib/features/weather/presentation/providers/weather_provider.dart
import 'package:my_app/features/weather/presentation/providers/search_history_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/weather_model.dart';
import '../../data/repositories/weather_repository.dart';

part 'weather_provider.g.dart';

@riverpod
Future<WeatherModel> weather(Ref ref, String city) async {
  final repo = ref.read(weatherRepositoryProvider);
  final weather = await repo.getWeather(city);

  // Save to history only on success
  ref.read(searchHistoryProvider.notifier).add(weather.city);

  return weather;
}
