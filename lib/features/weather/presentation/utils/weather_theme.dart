import 'package:flutter/material.dart';

class WeatherTheme {
  WeatherTheme._();

  static List<Color> gradientFor(int weatherCode, bool isDay) {
    if (isDay) {
      if (weatherCode <= 1) {
        return [
          const Color(0xFF1E88C8),
          const Color(0xFF42A5F5),
          const Color(0xFF90CAF9),
        ];
      } else if (weatherCode <= 3) {
        return [
          const Color(0xFF2C3E50),
          const Color(0xFF3D5060),
          const Color(0xFF4A6070),
        ];
      } else if (weatherCode <= 49) {
        return [
          const Color(0xFF3A4A55),
          const Color(0xFF4A5A65),
          const Color(0xFF5A6A75),
        ];
      } else if (weatherCode <= 59) {
        return [
          const Color(0xFF1A2F3A),
          const Color(0xFF2A4A5A),
          const Color(0xFF2E5D6A),
        ];
      } else if (weatherCode <= 69) {
        return [
          const Color(0xFF1C2D3A),
          const Color(0xFF2A4050),
          const Color(0xFF304A5A),
        ];
      } else if (weatherCode <= 79) {
        return [
          const Color(0xFF4A6B8A),
          const Color(0xFF6B8FAA),
          const Color(0xFF8AAFC5),
        ];
      } else if (weatherCode <= 84) {
        return [
          const Color(0xFF1A2535),
          const Color(0xFF253545),
          const Color(0xFF2E4055),
        ];
      } else {
        return [
          const Color(0xFF1A1A2E),
          const Color(0xFF2D2040),
          const Color(0xFF4A3060),
        ];
      }
    } else {
      if (weatherCode <= 1) {
        return [
          const Color(0xFF020817),
          const Color(0xFF0A1628),
          const Color(0xFF0F2040),
        ];
      } else if (weatherCode <= 3) {
        return [
          const Color(0xFF0D1117),
          const Color(0xFF161B22),
          const Color(0xFF21262D),
        ];
      } else if (weatherCode <= 49) {
        return [
          const Color(0xFF0F1419),
          const Color(0xFF181E24),
          const Color(0xFF20282E),
        ];
      } else if (weatherCode <= 59) {
        return [
          const Color(0xFF080F1A),
          const Color(0xFF0D1825),
          const Color(0xFF152030),
        ];
      } else if (weatherCode <= 69) {
        return [
          const Color(0xFF060E18),
          const Color(0xFF0A1520),
          const Color(0xFF101C28),
        ];
      } else if (weatherCode <= 79) {
        return [
          const Color(0xFF0F1419),
          const Color(0xFF1A2332),
          const Color(0xFF243447),
        ];
      } else if (weatherCode <= 84) {
        return [
          const Color(0xFF080D18),
          const Color(0xFF0D1220),
          const Color(0xFF121828),
        ];
      } else {
        return [
          const Color(0xFF05020F),
          const Color(0xFF100820),
          const Color(0xFF1E0F35),
        ];
      }
    }
  }

  static Color accentFor(int weatherCode, bool isDay) {
    if (isDay) {
      if (weatherCode <= 1) return const Color(0xFFFFD580);
      if (weatherCode <= 3) return const Color(0xFFFFBC70);
      if (weatherCode <= 49) return const Color(0xFFB0BEC5);
      if (weatherCode <= 59) return const Color(0xFF90CAF9);
      if (weatherCode <= 69) return const Color(0xFF64B5F6);
      if (weatherCode <= 79) return const Color(0xFFE0F2FE);
      if (weatherCode <= 84) return const Color(0xFF90CAF9);
      return const Color(0xFFFFA040);
    } else {
      if (weatherCode <= 1) return const Color(0xFFC7D2FE);
      if (weatherCode <= 3) return const Color(0xFF94A3B8);
      if (weatherCode <= 49) return const Color(0xFF78909C);
      if (weatherCode <= 59) return const Color(0xFF67E8F9);
      if (weatherCode <= 69) return const Color(0xFF67E8F9);
      if (weatherCode <= 79) return const Color(0xFFBAE6FD);
      if (weatherCode <= 84) return const Color(0xFF67E8F9);
      return const Color(0xFFA78BFA);
    }
  }
}
