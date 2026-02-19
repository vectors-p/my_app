// lib/features/weather/data/models/weather_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
abstract class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String city,
    required String country,
    required double temperature,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required String description,
    required int weatherCode,
    required int humidity,
    required double windSpeed,
    required int pressure,
    required bool isDay,
    required String time,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
