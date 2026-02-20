import 'package:flutter/material.dart';

class PillButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  const PillButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.color,
    this.textColor = const Color(0xFF0B0F1E),
  });

  @override
  State<PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<PillButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: _pressed
                ? widget.color.withValues(alpha: widget.color.a * 0.8)
                : widget.color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
