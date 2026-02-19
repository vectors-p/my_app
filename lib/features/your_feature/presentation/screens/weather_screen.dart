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
          gradient: WeatherTheme.gradientFor(weather.description, weather.icon),
          accent: WeatherTheme.accentFor(weather.description, weather.icon),
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

  IconData _iconForDescription(String description) {
    final d = description.toLowerCase();
    if (d.contains('clear') || d.contains('mainly clear')) {
      return Icons.wb_sunny_rounded;
    }
    if (d.contains('partly cloudy')) return Icons.wb_cloudy_rounded;
    if (d.contains('overcast') || d.contains('cloud')) {
      return Icons.cloud_rounded;
    }
    if (d.contains('fog')) return Icons.foggy;
    if (d.contains('drizzle')) return Icons.grain_rounded;
    if (d.contains('rain') || d.contains('shower')) {
      return Icons.umbrella_rounded;
    }
    if (d.contains('snow')) return Icons.ac_unit_rounded;
    if (d.contains('thunder') || d.contains('storm')) {
      return Icons.thunderstorm_rounded;
    }
    return Icons.wb_sunny_rounded;
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
              // Replace Image.network with this:
              Center(
                child: Icon(
                  _iconForDescription(weather.description),
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
