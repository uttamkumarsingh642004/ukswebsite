import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';
import '../utils/responsive.dart';
import 'gradient_text.dart';

/// Reusable section title component
/// Consistent styling across all sections
class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      children: [
        // Subtitle
        Text(
          subtitle.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppTheme.secondaryAccent,
                letterSpacing: 2,
              ),
          textAlign: TextAlign.center,
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.3, end: 0),

        const SizedBox(height: 12),

        // Main title with gradient
        GradientText(
          title,
          gradient: AppTheme.primaryGradient,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: isMobile ? 36 : 48,
              ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 200.ms)
            .slideY(begin: 0.3, end: 0, delay: 200.ms),

        const SizedBox(height: 16),

        // Decorative line
        Container(
          width: 100,
          height: 4,
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        )
            .animate()
            .scaleX(
              begin: 0,
              end: 1,
              duration: 600.ms,
              delay: 400.ms,
            ),
      ],
    );
  }
}
