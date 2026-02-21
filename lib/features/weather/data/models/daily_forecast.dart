import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_forecast.freezed.dart';
part 'daily_forecast.g.dart';

@freezed
abstract class DailyForecast with _$DailyForecast {
  const factory DailyForecast({
    required String date,
    required double tempMax,
    required double tempMin,
    required int weatherCode,
  }) = _DailyForecast;

  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);
}
