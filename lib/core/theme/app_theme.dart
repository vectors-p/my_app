import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Base colors
  static const blueBg = Color(0xFF00004D);
  static const darkBg = Color(0xFF0B0F1E);
  static const darkBgSecondary = Color(0xFF0D1B3E);
  static const primaryBlue = Color(0xFF7EB8F7);

  // Text
  static const textPrimary = Colors.white;
  static Color textSecondary = Colors.white.withValues(alpha: 0.45);
  static Color textMuted = Colors.white.withValues(alpha: 0.35);

  // Card
  static Color cardBg = Colors.white.withValues(alpha: 0.06);
  static Color cardBorder = Colors.white.withValues(alpha: 0.08);

  // Shared text styles
  static const bigTemperature = TextStyle(
    fontSize: 120,
    fontWeight: FontWeight.w200,
    color: Colors.white,
    letterSpacing: -6,
    height: 0.9,
  );

  static const cityName = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    letterSpacing: -1.2,
  );

  static const sectionLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );
}
