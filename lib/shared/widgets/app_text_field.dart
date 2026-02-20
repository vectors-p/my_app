import 'package:flutter/material.dart';
import 'package:my_app/core/theme/app_theme.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback onSubmitted;
  final VoidCallback? onSuffixTap;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.onSubmitted,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        onSubmitted: (_) => onSubmitted(),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: AppTheme.textSecondary, fontSize: 16),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white.withValues(alpha: 0.5),
            ),
            onPressed: onSuffixTap ?? onSubmitted,
          ),
        ),
      ),
    );
  }
}
