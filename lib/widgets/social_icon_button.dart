import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../sections/contact_section.dart';
import '../utils/app_theme.dart';

/// Social media icon button with hover animation
/// Used in contact section for social links
class SocialIconButton extends StatefulWidget {
  final SocialLink socialLink;
  final int delay;
  final bool isVisible;

  const SocialIconButton({
    super.key,
    required this.socialLink,
    required this.delay,
    required this.isVisible,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()
            ..scale(_isHovered ? 1.1 : 1.0),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isHovered
                ? widget.socialLink.color
                : AppTheme.cardDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered
                  ? widget.socialLink.color
                  : AppTheme.primaryAccent.withOpacity(0.2),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? widget.socialLink.color.withOpacity(0.4)
                    : Colors.transparent,
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: FaIcon(
            widget.socialLink.icon,
            color: _isHovered ? Colors.white : widget.socialLink.color,
            size: 24,
          ),
        ),
      )
          .animate(
            target: widget.isVisible ? 1 : 0,
          )
          .fadeIn(duration: 600.ms, delay: widget.delay.ms)
          .scale(
            begin: const Offset(0.5, 0.5),
            end: const Offset(1, 1),
            delay: widget.delay.ms,
          ),
    );
  }

  Future<void> _handleTap() async {
    final url = Uri.parse(widget.socialLink.url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
