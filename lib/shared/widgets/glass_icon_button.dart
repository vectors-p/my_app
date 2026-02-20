import 'package:flutter/material.dart';

class GlassIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;

  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 20,
  });

  @override
  State<GlassIconButton> createState() => _GlassIconButtonState();
}

class _GlassIconButtonState extends State<GlassIconButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.90 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _pressed
                ? Colors.white.withValues(alpha: 0.14)
                : Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _pressed
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Icon(
            widget.icon,
            color: Colors.white.withValues(alpha: _pressed ? 1.0 : 0.7),
            size: widget.size,
          ),
        ),
      ),
    );
  }
}
