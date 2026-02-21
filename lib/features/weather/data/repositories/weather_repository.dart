import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/core/constants/api_constants.dart';
import 'package:my_app/features/weather/data/models/daily_forecast.dart';
import 'package:my_app/features/weather/data/models/weather_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_repository.g.dart';

@Riverpod(keepAlive: true)
WeatherRepository weatherRepository(Ref ref) => WeatherRepository();

class WeatherRepository {
  Future<WeatherModel> getWeather({
    required String city,
    required String country,
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.parse(
      '${ApiConstants.weatherBaseUrl}?latitude=$latitude&longitude=$longitude'
      '&current=temperature_2m,relative_humidity_2m,apparent_temperature,'
      'weather_code,surface_pressure,wind_speed_10m,is_day'
      '&daily=temperature_2m_max,temperature_2m_min,weather_code'
      '&timezone=auto&forecast_days=7',
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final current = json['current'] as Map<String, dynamic>;
      final daily = json['daily'] as Map<String, dynamic>;
      final isDay = (current['is_day'] as int) == 1;
      final weatherCode = current['weather_code'] as int;

      final dailyTimes = (daily['time'] as List).cast<String>();
      final dailyMax = (daily['temperature_2m_max'] as List).cast<num>();
      final dailyMin = (daily['temperature_2m_min'] as List).cast<num>();
      final dailyCodes = (daily['weather_code'] as List).cast<int>();

      final forecast = List.generate(
        dailyTimes.length,
        (i) => DailyForecast(
          date: dailyTimes[i],
          tempMax: dailyMax[i].toDouble(),
          tempMin: dailyMin[i].toDouble(),
          weatherCode: dailyCodes[i],
        ),
      );

      return WeatherModel(
        city: city,
        country: country,
        temperature: (current['temperature_2m'] as num).toDouble(),
        feelsLike: (current['apparent_temperature'] as num).toDouble(),
        tempMin: (daily['temperature_2m_min'][0] as num).toDouble(),
        tempMax: (daily['temperature_2m_max'][0] as num).toDouble(),
        weatherCode: weatherCode,
        description: _descriptionFromCode(weatherCode),
        humidity: (current['relative_humidity_2m'] as num).toInt(),
        windSpeed: (current['wind_speed_10m'] as num).toDouble(),
        pressure: (current['surface_pressure'] as num).toInt(),
        isDay: isDay,
        time: current['time'] as String,
        forecast: forecast,
      );
    } else {
      throw Exception('Failed to fetch weather');
    }
  }

  String _descriptionFromCode(int code) {
    switch (code) {
      case 0:
        return 'Clear sky';
      case 1:
        return 'Mainly clear';
      case 2:
        return 'Partly cloudy';
      case 3:
        return 'Overcast';
      case 45:
      case 48:
        return 'Fog';
      case 51:
        return 'Light drizzle';
      case 53:
        return 'Moderate drizzle';
      case 55:
        return 'Dense drizzle';
      case 56:
        return 'Light freezing drizzle';
      case 57:
        return 'Dense freezing drizzle';
      case 61:
        return 'Slight rain';
      case 63:
        return 'Moderate rain';
      case 65:
        return 'Heavy rain';
      case 66:
        return 'Light freezing rain';
      case 67:
        return 'Heavy freezing rain';
      case 71:
        return 'Slight snowfall';
      case 73:
        return 'Moderate snowfall';
      case 75:
        return 'Heavy snowfall';
      case 77:
        return 'Snow grains';
      case 80:
        return 'Slight rain showers';
      case 81:
        return 'Moderate rain showers';
      case 82:
        return 'Violent rain showers';
      case 85:
        return 'Slight snow showers';
      case 86:
        return 'Heavy snow showers';
      case 95:
        return 'Thunderstorm';
      case 96:
        return 'Thunderstorm with slight hail';
      case 99:
        return 'Thunderstorm with heavy hail';
      default:
        return 'Unknown weather';
    }
  }
}
