import 'package:flutter/material.dart';
import 'package:my_app/features/weather/data/models/daily_forecast.dart';

class ForecastRow extends StatelessWidget {
  final List<DailyForecast> forecast;
  final Color accent;
  final bool isCelsius;

  const ForecastRow({
    super.key,
    required this.forecast,
    required this.accent,
    required this.isCelsius,
  });

  String _dayLabel(String date, int index) {
    if (index == 0) return 'Today';
    final parts = date.split('-');
    final dt = DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[dt.weekday - 1];
  }

  IconData _iconForCode(int code) {
    if (code == 0) return Icons.wb_sunny_rounded;
    if (code <= 2) return Icons.cloud;
    if (code == 3) return Icons.cloud_rounded;
    if (code == 45 || code == 48) return Icons.foggy;
    if (code >= 51 && code <= 59) return Icons.grain_rounded;
    if (code >= 60 && code <= 67) return Icons.umbrella_rounded;
    if (code >= 71 && code <= 86) return Icons.ac_unit_rounded;
    if (code >= 95) return Icons.thunderstorm_rounded;
    return Icons.wb_sunny_rounded;
  }

  double _convert(double temp) => isCelsius ? temp : (temp * 9 / 5) + 32;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          children: forecast.asMap().entries.map((entry) {
            final i = entry.key;
            final day = entry.value;
            final isLast = i == forecast.length - 1;
            return Row(
              children: [
                _ForecastItem(
                  label: _dayLabel(day.date, i),
                  icon: _iconForCode(day.weatherCode),
                  tempMax: _convert(day.tempMax),
                  tempMin: _convert(day.tempMin),
                  accent: accent,
                  isToday: i == 0,
                  isCelsius: isCelsius,
                ),
                if (!isLast)
                  Container(
                    width: 1,
                    height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ForecastItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final double tempMax;
  final double tempMin;
  final Color accent;
  final bool isToday;
  final bool isCelsius;

  const _ForecastItem({
    required this.label,
    required this.icon,
    required this.tempMax,
    required this.tempMin,
    required this.accent,
    required this.isToday,
    required this.isCelsius,
  });

  @override
  Widget build(BuildContext context) {
    final unit = isCelsius ? '°' : '°';
    return Container(
      width: 72,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isToday ? accent : Colors.white.withValues(alpha: 0.5),
              fontSize: 12,
              fontWeight: isToday ? FontWeight.w600 : FontWeight.w400,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 10),
          Icon(
            icon,
            size: 22,
            color: isToday ? accent : Colors.white.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 10),
          Text(
            '${tempMax.toStringAsFixed(0)}$unit',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '${tempMin.toStringAsFixed(0)}$unit',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.35),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
