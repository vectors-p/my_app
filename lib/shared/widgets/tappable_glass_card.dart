// lib/shared/widgets/tappable_glass_card.dart
import 'package:flutter/material.dart';

class TappableGlassCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final EdgeInsets padding;

  const TappableGlassCard({
    super.key,
    required this.child,
    required this.onTap,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  State<TappableGlassCard> createState() => _TappableGlassCardState();
}

class _TappableGlassCardState extends State<TappableGlassCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: _pressed
                ? Colors.white.withValues(alpha: 0.10)
                : Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _pressed
                  ? Colors.white.withValues(alpha: 0.15)
                  : Colors.white.withValues(alpha: 0.08),
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
