// lib/features/weather/presentation/screens/weather_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/features/weather/data/models/weather_model.dart';
import 'package:my_app/features/weather/presentation/providers/weather_provider.dart';
import 'package:my_app/features/weather/presentation/utils/weather_theme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/settings_provider.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/pill_button.dart';
import '../../../../shared/widgets/stat_item.dart';

class WeatherScreen extends ConsumerWidget {
  final String city;
  final String country;
  final double latitude;
  final double longitude;

  const WeatherScreen({
    super.key,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(
      weatherProvider(
        city: city,
        country: country,
        latitude: latitude,
        longitude: longitude,
      ),
    );

    return Scaffold(
      body: weatherAsync.when(
        loading: () => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.darkBg, AppTheme.darkBgSecondary],
            ),
          ),
          child: const Center(
            child: CircularProgressIndicator(
              color: AppTheme.primaryBlue,
              strokeWidth: 1.5,
            ),
          ),
        ),
        error: (e, _) => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.darkBg, Color(0xFF1A0A0A)],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_off_rounded,
                    size: 64,
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    e.toString().replaceAll('Exception: ', ''),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PillButton(
                        label: 'Retry',
                        onTap: () => ref.invalidate(
                          weatherProvider(
                            city: city,
                            country: country,
                            latitude: latitude,
                            longitude: longitude,
                          ),
                        ),
                        color: AppTheme.primaryBlue,
                      ),
                      const SizedBox(width: 12),
                      PillButton(
                        label: 'Back',
                        onTap: () => context.pop(),
                        color: Colors.white.withValues(alpha: 0.1),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        data: (weather) => _WeatherContent(
          weather: weather,
          gradient: WeatherTheme.gradientFor(
            weather.weatherCode,
            weather.isDay,
          ),
          accent: WeatherTheme.accentFor(weather.weatherCode, weather.isDay),
        ),
      ),
    );
  }
}

class _WeatherContent extends ConsumerWidget {
  final WeatherModel weather;
  final List<Color> gradient;
  final Color accent;

  const _WeatherContent({
    required this.weather,
    required this.gradient,
    required this.accent,
  });

  String _formatTime(String isoTime) {
    final parts = isoTime.split('T');
    if (parts.length < 2) return '';
    final timeParts = parts[1].split(':');
    final hour = int.parse(timeParts[0]);
    final minute = timeParts[1];
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$displayHour:$minute $period';
  }

  String _formatDate(String isoTime) {
    final parts = isoTime.split('T');
    if (parts.isEmpty) return '';
    final dateParts = parts[0].split('-');
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final month = months[int.parse(dateParts[1]) - 1];
    final day = int.parse(dateParts[2]);
    return '$month $day, ${dateParts[0]}';
  }

  IconData iconFromCode(int code, bool isDay) {
    if (code == 0 || code == 1) {
      return isDay ? Icons.wb_sunny_rounded : Icons.nightlight_round;
    }
    if (code == 2) {
      return isDay ? Icons.cloud_circle_outlined : Icons.nights_stay_rounded;
    }
    if (code == 3) return Icons.cloud_rounded;
    if (code == 45 || code == 48) return Icons.foggy;
    if (code >= 51 && code <= 59) {
      return isDay ? Icons.grain_rounded : Icons.grain_rounded;
    }
    if (code >= 60 && code <= 67) {
      return isDay ? Icons.umbrella_rounded : Icons.umbrella_rounded;
    }
    if (code >= 71 && code <= 86) return Icons.ac_unit_rounded;
    if (code >= 95) {
      return isDay ? Icons.thunderstorm_rounded : Icons.thunderstorm_rounded;
    }
    return isDay ? Icons.wb_sunny_rounded : Icons.nightlight_round;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCelsius = ref.watch(settingsProvider).value ?? true;
    final temp = isCelsius
        ? weather.temperature
        : (weather.temperature * 9 / 5) + 32;
    final feelsLike = isCelsius
        ? weather.feelsLike
        : (weather.feelsLike * 9 / 5) + 32;
    final unit = isCelsius ? '°C' : '°F';

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradient,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Replace the current back button with this:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button (left)
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white.withValues(alpha: 0.7),
                        size: 20,
                      ),
                    ),
                  ),
                  // Time + date (right)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _formatTime(weather.time),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w200,
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        _formatDate(weather.time),
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.4),
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Text(
                weather.country.isNotEmpty
                    ? '${weather.city}, ${weather.country}'
                    : weather.city,
                style: AppTheme.cityName,
              ),
              const SizedBox(height: 4),
              Text(
                weather.description.toUpperCase(),
                style: AppTheme.sectionLabel.copyWith(
                  color: accent,
                  letterSpacing: 2.5,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 48),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(temp.toStringAsFixed(0), style: AppTheme.bigTemperature),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      unit,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Icon(
                  iconFromCode(weather.weatherCode, weather.isDay),
                  size: 120,
                  color: accent.withValues(alpha: 0.9),
                ),
              ),

              const Spacer(),
              GlassCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StatItem(
                      icon: Icons.water_drop_outlined,
                      value: '${weather.humidity}%',
                      label: 'Humidity',
                      accent: accent,
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                    StatItem(
                      icon: Icons.air_rounded,
                      value: '${weather.windSpeed.toStringAsFixed(1)} m/s',
                      label: 'Wind',
                      accent: accent,
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                    StatItem(
                      icon: Icons.thermostat_outlined,
                      value: '${feelsLike.toStringAsFixed(0)}$unit',
                      label: 'Feels like',
                      accent: accent,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
