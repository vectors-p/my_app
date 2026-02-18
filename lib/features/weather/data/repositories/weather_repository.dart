import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/weather_model.dart';

part 'weather_repository.g.dart';

@Riverpod(keepAlive: true)
WeatherRepository weatherRepository(Ref ref) => WeatherRepository();

class WeatherRepository {
  static const _apiKey = 'de15ba81ad0a39151dc01e6e214fafec';
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<WeatherModel> getWeather(String city) async {
    final uri = Uri.parse(
      '$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return WeatherModel(
        city: json['name'] as String,
        country: json['sys']['country'] as String,
        temperature: (json['main']['temp'] as num).toDouble(),
        feelsLike: (json['main']['feels_like'] as num).toDouble(),
        tempMin: (json['main']['temp_min'] as num).toDouble(),
        tempMax: (json['main']['temp_max'] as num).toDouble(),
        description: json['weather'][0]['description'] as String,
        icon: json['weather'][0]['icon'] as String,
        humidity: json['main']['humidity'] as int,
        windSpeed: (json['wind']['speed'] as num).toDouble(),
        pressure: json['main']['pressure'] as int,
        visibility: json['visibility'] as int,
        sunrise: json['sys']['sunrise'] as int,
        sunset: json['sys']['sunset'] as int,
      );
    } else if (response.statusCode == 404) {
      throw Exception('City not found');
    } else {
      throw Exception('Failed to fetch weather');
    }
  }
}
