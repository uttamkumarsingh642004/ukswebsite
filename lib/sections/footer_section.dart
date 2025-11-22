import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_theme.dart';
import '../utils/responsive.dart';

/// Footer Section with navigation and copyright
/// Features: Clean design, social links, back-to-top button
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        border: Border(
          top: BorderSide(
            color: AppTheme.primaryAccent.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: AppTheme.paddingXL,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: Responsive.contentWidth(context),
          ),
          child: Column(
            children: [
              if (!isMobile) ...[
                // Desktop layout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrandSection(context),
                    _buildQuickLinks(context),
                    _buildSocialLinks(context),
                  ],
                ),
              ] else ...[
                // Mobile layout
                _buildBrandSection(context),
                const SizedBox(height: 32),
                _buildQuickLinks(context),
                const SizedBox(height: 32),
                _buildSocialLinks(context),
              ],

              const SizedBox(height: 40),

              // Divider
              Divider(
                color: AppTheme.textSecondary.withOpacity(0.2),
              ),

              const SizedBox(height: 24),

              // Copyright and back to top
              isMobile
                  ? Column(
                      children: [
                        _buildCopyright(context),
                        const SizedBox(height: 16),
                        _buildBackToTop(context),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCopyright(context),
                        _buildBackToTop(context),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo/Name
        Text(
          'YourName',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                background: Paint()
                  ..shader = AppTheme.primaryGradient.createShader(
                    const Rect.fromLTWH(0, 0, 200, 70),
                  ),
                color: Colors.transparent,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          'Building digital experiences\nthat matter.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildQuickLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppTheme.primaryAccent,
              ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink(context, 'About'),
        _buildFooterLink(context, 'Projects'),
        _buildFooterLink(context, 'Skills'),
        _buildFooterLink(context, 'Contact'),
      ],
    );
  }

  Widget _buildFooterLink(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: () {
          // TODO: Implement scroll to section
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondary,
              ),
        ),
      ),
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppTheme.primaryAccent,
              ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialIcon(FontAwesomeIcons.github, 'https://github.com'),
            const SizedBox(width: 12),
            _buildSocialIcon(FontAwesomeIcons.linkedin, 'https://linkedin.com'),
            const SizedBox(width: 12),
            _buildSocialIcon(FontAwesomeIcons.twitter, 'https://twitter.com'),
            const SizedBox(width: 12),
            _buildSocialIcon(FontAwesomeIcons.instagram, 'https://instagram.com'),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.cardDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: FaIcon(
          icon,
          size: 20,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildCopyright(BuildContext context) {
    return Text(
      '© ${DateTime.now().year} YourName. All rights reserved.',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.textSecondary.withOpacity(0.7),
          ),
    );
  }

  Widget _buildBackToTop(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        // Scroll to top
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      },
      icon: const Icon(
        Icons.arrow_upward,
        size: 16,
        color: AppTheme.primaryAccent,
      ),
      label: Text(
        'Back to Top',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.primaryAccent,
            ),
      ),
    );
  }
}
