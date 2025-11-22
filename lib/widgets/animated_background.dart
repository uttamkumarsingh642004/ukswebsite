import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';

/// Animated background with floating geometric shapes
/// Creates a dynamic, visually interesting backdrop
class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background
        Container(
          decoration: BoxDecoration(
            gradient: AppTheme.backgroundGradient,
          ),
        ),

        // Floating shapes
        _buildFloatingShape(
          top: 100,
          left: -50,
          size: 300,
          color: AppTheme.primaryAccent.withOpacity(0.05),
          duration: 4000,
        ),

        _buildFloatingShape(
          top: 200,
          right: -100,
          size: 400,
          color: AppTheme.secondaryAccent.withOpacity(0.05),
          duration: 5000,
        ),

        _buildFloatingShape(
          bottom: 100,
          left: 100,
          size: 250,
          color: AppTheme.tertiaryAccent.withOpacity(0.05),
          duration: 6000,
        ),

        _buildFloatingShape(
          bottom: -50,
          right: 200,
          size: 350,
          color: AppTheme.primaryAccent.withOpacity(0.03),
          duration: 7000,
        ),
      ],
    );
  }

  Widget _buildFloatingShape({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
    required Color color,
    required int duration,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      )
          .animate(
            onPlay: (controller) => controller.repeat(reverse: true),
          )
          .moveY(
            begin: 0,
            end: 30,
            duration: duration.ms,
            curve: Curves.easeInOut,
          )
          .then()
          .moveX(
            begin: 0,
            end: 20,
            duration: (duration * 0.8).toInt().ms,
            curve: Curves.easeInOut,
          ),
    );
  }
}
