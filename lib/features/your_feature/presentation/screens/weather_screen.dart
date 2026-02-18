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
  const WeatherScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider(city));

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
                        onTap: () => ref.invalidate(weatherProvider(city)),
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

// Simplified to ConsumerWidget — no animation state needed
class _WeatherContent extends ConsumerWidget {
  final WeatherModel weather;
  final List<Color> gradient;
  final Color accent;

  const _WeatherContent({
    required this.weather,
    required this.gradient,
    required this.accent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCelsius = ref.watch(settingsProvider).value ?? true;
    final temp = isCelsius
        ? weather.temperature
        : (weather.temperature * 9 / 5) + 32;
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
              const SizedBox(height: 48),
              Text(
                '${weather.city}, ${weather.country}',
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
                child: Image.network(
                  'https://openweathermap.org/img/wn/${weather.icon}@4x.png',
                  width: 120,
                  height: 120,
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
                      value: '${weather.windSpeed} m/s',
                      label: 'Wind',
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
