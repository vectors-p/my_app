import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color accent;

  const StatItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: accent, size: 22),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 12,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
