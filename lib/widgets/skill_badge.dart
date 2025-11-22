import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../sections/skills_section.dart';
import '../utils/app_theme.dart';
import '../utils/responsive.dart';

/// Interactive skill badge with hover animation
/// Shows skill icon, name, and proficiency on hover
class SkillBadge extends StatefulWidget {
  final SkillData skill;
  final int delay;
  final bool isVisible;

  const SkillBadge({
    super.key,
    required this.skill,
    required this.delay,
    required this.isVisible,
  });

  @override
  State<SkillBadge> createState() => _SkillBadgeState();
}

class _SkillBadgeState extends State<SkillBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: isMobile ? 100 : 120,
        height: isMobile ? 100 : 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _isHovered
              ? widget.skill.color.withOpacity(0.2)
              : AppTheme.cardDark,
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          border: Border.all(
            color: _isHovered
                ? widget.skill.color
                : AppTheme.primaryAccent.withOpacity(0.2),
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? widget.skill.color.withOpacity(0.3)
                  : Colors.transparent,
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.identity()
                ..scale(_isHovered ? 1.2 : 1.0),
              child: FaIcon(
                widget.skill.icon,
                color: _isHovered ? widget.skill.color : AppTheme.textPrimary,
                size: isMobile ? 32 : 36,
              ),
            ),

            const SizedBox(height: 8),

            // Skill name
            Text(
              widget.skill.name,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: _isHovered
                        ? widget.skill.color
                        : AppTheme.textSecondary,
                    fontWeight: _isHovered ? FontWeight.w600 : FontWeight.normal,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            // Proficiency indicator (appears on hover)
            if (_isHovered) ...[
              const SizedBox(height: 4),
              Text(
                '${widget.skill.proficiency.toInt()}%',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: widget.skill.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
              )
                  .animate()
                  .fadeIn(duration: 200.ms)
                  .slideY(begin: -0.5, end: 0),
            ],
          ],
        ),
      )
          .animate(
            target: widget.isVisible ? 1 : 0,
          )
          .fadeIn(duration: 600.ms, delay: widget.delay.ms)
          .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
    );
  }
}
