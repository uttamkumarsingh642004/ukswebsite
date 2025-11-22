import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';

/// Animated card that fades in and slides up when visible
/// Used in About section and other places
class AnimatedCard extends StatelessWidget {
  final Widget child;
  final int delay;
  final bool isVisible;
  final List<Color>? gradient;

  const AnimatedCard({
    super.key,
    required this.child,
    required this.delay,
    required this.isVisible,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient != null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradient!,
              )
            : null,
        color: gradient == null ? AppTheme.cardDark : null,
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        border: Border.all(
          color: gradient == null
              ? AppTheme.primaryAccent.withOpacity(0.2)
              : Colors.transparent,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryAccent.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    )
        .animate(
          target: isVisible ? 1 : 0,
        )
        .fadeIn(duration: 600.ms, delay: delay.ms)
        .slideY(begin: 0.3, end: 0, delay: delay.ms);
  }
}
