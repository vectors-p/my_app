// lib/features/weather/presentation/utils/weather_theme.dart
import 'package:flutter/material.dart';

class WeatherTheme {
  WeatherTheme._();

  static List<Color> gradientFor(String description, String icon) {
    final isDay = icon.endsWith('d');
    final d = description.toLowerCase();

    if (isDay) {
      if (d.contains('clear') || d.contains('sun')) {
        return [
          const Color(0xFF1E88C8),
          const Color(0xFF42A5F5),
          const Color(0xFF90CAF9),
        ];
      } else if (d.contains('cloud')) {
        return [
          const Color(0xFF2C3E50),
          const Color(0xFF3D5060),
          const Color(0xFF4A6070),
        ];
      } else if (d.contains('rain') || d.contains('drizzle')) {
        return [
          const Color(0xFF1A2F3A),
          const Color(0xFF2A4A5A),
          const Color(0xFF2E5D6A),
        ];
      } else if (d.contains('snow')) {
        return [
          const Color(0xFF4A6B8A),
          const Color(0xFF6B8FAA),
          const Color(0xFF8AAFC5),
        ];
      } else if (d.contains('thunder') || d.contains('storm')) {
        return [
          const Color(0xFF1A1A2E),
          const Color(0xFF2D2040),
          const Color(0xFF4A3060),
        ];
      }
      return [
        const Color(0xFF2B6CB0),
        const Color(0xFF3182CE),
        const Color(0xFF63B3ED),
      ];
    } else {
      if (d.contains('clear')) {
        return [
          const Color(0xFF020817),
          const Color(0xFF0A1628),
          const Color(0xFF0F2040),
        ];
      } else if (d.contains('cloud')) {
        return [
          const Color(0xFF0D1117),
          const Color(0xFF161B22),
          const Color(0xFF21262D),
        ];
      } else if (d.contains('rain') || d.contains('drizzle')) {
        return [
          const Color(0xFF080F1A),
          const Color(0xFF0D1825),
          const Color(0xFF152030),
        ];
      } else if (d.contains('snow')) {
        return [
          const Color(0xFF0F1419),
          const Color(0xFF1A2332),
          const Color(0xFF243447),
        ];
      } else if (d.contains('thunder') || d.contains('storm')) {
        return [
          const Color(0xFF05020F),
          const Color(0xFF100820),
          const Color(0xFF1E0F35),
        ];
      }
      return [
        const Color(0xFF020817),
        const Color(0xFF0A1628),
        const Color(0xFF0F2040),
      ];
    }
  }

  static Color accentFor(String description, String icon) {
    final isDay = icon.endsWith('d');
    final d = description.toLowerCase();

    if (isDay) {
      if (d.contains('clear') || d.contains('sun')) {
        return const Color(0xFFFFD580);
      }
      if (d.contains('cloud')) return const Color(0xFFFFBC70);
      if (d.contains('rain') || d.contains('drizzle')) {
        return const Color(0xFF90CAF9);
      }
      if (d.contains('snow')) return const Color(0xFFE0F2FE);
      if (d.contains('thunder') || d.contains('storm')) {
        return const Color(0xFFFFA040);
      }
      return const Color(0xFFFFD580);
    } else {
      if (d.contains('clear')) return const Color(0xFFC7D2FE);
      if (d.contains('cloud')) return const Color(0xFF94A3B8);
      if (d.contains('rain') || d.contains('drizzle')) {
        return const Color(0xFF67E8F9);
      }
      if (d.contains('snow')) return const Color(0xFFBAE6FD);
      if (d.contains('thunder') || d.contains('storm')) {
        return const Color(0xFFA78BFA);
      }
      return const Color(0xFFC7D2FE);
    }
  }
}
