// lib/shared/widgets/city_chip.dart
import 'package:flutter/material.dart';

class CityChip extends StatefulWidget {
  final String city;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const CityChip({
    super.key,
    required this.city,
    required this.onTap,
    this.onRemove,
  });

  @override
  State<CityChip> createState() => _CityChipState();
}

class _CityChipState extends State<CityChip> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.93 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _pressed
                ? Colors.white.withValues(alpha: 0.12)
                : Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _pressed
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.city,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: _pressed ? 0.9 : 0.6),
                  fontSize: 13,
                ),
              ),
              if (widget.onRemove != null) ...[
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: widget.onRemove,
                  child: Icon(
                    Icons.close_rounded,
                    size: 13,
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
