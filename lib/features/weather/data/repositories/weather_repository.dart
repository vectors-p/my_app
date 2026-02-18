// lib/features/weather/data/repositories/weather_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/weather_model.dart';

part 'weather_repository.g.dart';

@Riverpod(keepAlive: true)
WeatherRepository weatherRepository(Ref ref) => WeatherRepository();

class WeatherRepository {
  static const _baseUrl = 'https://api.open-meteo.com/v1/forecast';

  Future<WeatherModel> getWeather({
    required String city,
    required String country,
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.parse(
      '$_baseUrl?latitude=$latitude&longitude=$longitude'
      '&current=temperature_2m,relative_humidity_2m,apparent_temperature,'
      'weather_code,surface_pressure,wind_speed_10m,is_day'
      '&daily=temperature_2m_max,temperature_2m_min'
      '&timezone=auto&forecast_days=1',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final current = json['current'] as Map<String, dynamic>;
      final daily = json['daily'] as Map<String, dynamic>;
      final isDay = (current['is_day'] as int) == 1;
      final weatherCode = current['weather_code'] as int;

      return WeatherModel(
        city: city,
        country: country,
        temperature: (current['temperature_2m'] as num).toDouble(),
        feelsLike: (current['apparent_temperature'] as num).toDouble(),
        tempMin: (daily['temperature_2m_min'][0] as num).toDouble(),
        tempMax: (daily['temperature_2m_max'][0] as num).toDouble(),
        description: _descriptionFromCode(weatherCode),
        icon: _iconFromCode(weatherCode, isDay),
        humidity: (current['relative_humidity_2m'] as num).toInt(),
        windSpeed: (current['wind_speed_10m'] as num).toDouble(),
        pressure: (current['surface_pressure'] as num).toInt(),
        isDay: isDay,
      );
    } else {
      throw Exception('Failed to fetch weather');
    }
  }

  // Map WMO weather codes to human-readable descriptions
  String _descriptionFromCode(int code) {
    if (code == 0) return 'clear sky';
    if (code == 1) return 'mainly clear';
    if (code == 2) return 'partly cloudy';
    if (code == 3) return 'overcast clouds';
    if (code <= 49) return 'foggy';
    if (code <= 59) return 'drizzle';
    if (code <= 69) return 'rain';
    if (code <= 79) return 'snow';
    if (code <= 84) return 'rain showers';
    if (code <= 94) return 'thunderstorm';
    return 'thunderstorm';
  }

  // Map WMO codes to OpenWeatherMap-style icon codes for the existing UI
  String _iconFromCode(int code, bool isDay) {
    final suffix = isDay ? 'd' : 'n';
    if (code == 0 || code == 1) return '01$suffix'; // clear
    if (code == 2) return '02$suffix'; // partly cloudy
    if (code == 3) return '04$suffix'; // overcast
    if (code <= 49) return '50$suffix'; // fog
    if (code <= 69) return '10$suffix'; // rain
    if (code <= 79) return '13$suffix'; // snow
    if (code <= 84) return '09$suffix'; // showers
    return '11$suffix'; // thunderstorm
  }
}
