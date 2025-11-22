import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/social_icon_button.dart';

/// Contact Section with social links and contact form
/// Features: Animated social icons, styled form inputs, hover effects
class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // TODO: Replace with your social media links
  final List<SocialLink> socialLinks = [
    SocialLink(
      name: 'GitHub',
      icon: FontAwesomeIcons.github,
      url: 'https://github.com/yourusername',
      color: Colors.white,
    ),
    SocialLink(
      name: 'LinkedIn',
      icon: FontAwesomeIcons.linkedin,
      url: 'https://linkedin.com/in/yourusername',
      color: const Color(0xFF0A66C2),
    ),
    SocialLink(
      name: 'Twitter',
      icon: FontAwesomeIcons.twitter,
      url: 'https://twitter.com/yourusername',
      color: const Color(0xFF1DA1F2),
    ),
    SocialLink(
      name: 'Instagram',
      icon: FontAwesomeIcons.instagram,
      url: 'https://instagram.com/yourusername',
      color: const Color(0xFFE4405F),
    ),
    SocialLink(
      name: 'Email',
      icon: FontAwesomeIcons.envelope,
      url: 'mailto:your.email@example.com',
      color: AppTheme.secondaryAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return VisibilityDetector(
      key: const Key('contact-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark.withOpacity(0.3),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.horizontalPadding(context),
          vertical: AppTheme.paddingXXL * 1.5,
        ),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: Responsive.contentWidth(context),
            ),
            child: Column(
              children: [
                // Section title
                const SectionTitle(
                  title: 'Get In Touch',
                  subtitle: 'Let\'s work together',
                ),

                const SizedBox(height: 64),

                // Content
                isMobile
                    ? _buildMobileLayout()
                    : _buildDesktopLayout(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contact info and social links
        Expanded(
          flex: 4,
          child: _buildContactInfo(),
        ),

        const SizedBox(width: 64),

        // Contact form
        Expanded(
          flex: 6,
          child: _buildContactForm(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildContactInfo(),
        const SizedBox(height: 48),
        _buildContactForm(),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Let\'s create something amazing together!',
          style: Theme.of(context).textTheme.headlineSmall,
        )
            .animate(
              target: _isVisible ? 1 : 0,
            )
            .fadeIn(delay: 200.ms)
            .slideY(begin: 0.2, end: 0),

        const SizedBox(height: 24),

        Text(
          'I\'m always open to discussing new projects, creative ideas, or opportunities to be part of your vision.',
          style: Theme.of(context).textTheme.bodyLarge,
        )
            .animate(
              target: _isVisible ? 1 : 0,
            )
            .fadeIn(delay: 300.ms)
            .slideY(begin: 0.2, end: 0),

        const SizedBox(height: 40),

        // Social icons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: socialLinks.asMap().entries.map((entry) {
            return SocialIconButton(
              socialLink: entry.value,
              delay: 400 + (entry.key * 50),
              isVisible: _isVisible,
            );
          }).toList(),
        ),

        const SizedBox(height: 40),

        // Additional contact info
        _buildContactInfoItem(
          Icons.location_on,
          'San Francisco, CA',
          400,
        ),
        const SizedBox(height: 16),
        _buildContactInfoItem(
          Icons.email,
          'your.email@example.com',
          450,
        ),
        const SizedBox(height: 16),
        _buildContactInfoItem(
          Icons.phone,
          '+1 (555) 123-4567',
          500,
        ),
      ],
    );
  }

  Widget _buildContactInfoItem(IconData icon, String text, int delay) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.primaryAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppTheme.primaryAccent,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    )
        .animate(
          target: _isVisible ? 1 : 0,
        )
        .fadeIn(delay: delay.ms)
        .slideX(begin: -0.2, end: 0);
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.paddingL),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        border: Border.all(
          color: AppTheme.primaryAccent.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name field
            TextFormField(
              controller: _nameController,
              style: const TextStyle(color: AppTheme.textPrimary),
              decoration: const InputDecoration(
                labelText: 'Your Name',
                labelStyle: TextStyle(color: AppTheme.textSecondary),
                hintText: 'John Doe',
                hintStyle: TextStyle(color: AppTheme.textSecondary),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            )
                .animate(
                  target: _isVisible ? 1 : 0,
                )
                .fadeIn(delay: 200.ms)
                .slideY(begin: 0.2, end: 0),

            const SizedBox(height: 24),

            // Email field
            TextFormField(
              controller: _emailController,
              style: const TextStyle(color: AppTheme.textPrimary),
              decoration: const InputDecoration(
                labelText: 'Your Email',
                labelStyle: TextStyle(color: AppTheme.textSecondary),
                hintText: 'john@example.com',
                hintStyle: TextStyle(color: AppTheme.textSecondary),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            )
                .animate(
                  target: _isVisible ? 1 : 0,
                )
                .fadeIn(delay: 300.ms)
                .slideY(begin: 0.2, end: 0),

            const SizedBox(height: 24),

            // Message field
            TextFormField(
              controller: _messageController,
              style: const TextStyle(color: AppTheme.textPrimary),
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Your Message',
                labelStyle: TextStyle(color: AppTheme.textSecondary),
                hintText: 'Tell me about your project...',
                hintStyle: TextStyle(color: AppTheme.textSecondary),
                alignLabelWithHint: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
            )
                .animate(
                  target: _isVisible ? 1 : 0,
                )
                .fadeIn(delay: 400.ms)
                .slideY(begin: 0.2, end: 0),

            const SizedBox(height: 32),

            // Submit button
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Send Message'),
                  SizedBox(width: 8),
                  Icon(Icons.send, size: 20),
                ],
              ),
            )
                .animate(
                  target: _isVisible ? 1 : 0,
                )
                .fadeIn(delay: 500.ms)
                .slideY(begin: 0.2, end: 0),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement form submission logic
      // This could send to an email service, Firebase, or backend API

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message sent! I\'ll get back to you soon.'),
          backgroundColor: AppTheme.primaryAccent,
        ),
      );

      // Clear form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }
}

/// Social link data model
class SocialLink {
  final String name;
  final IconData icon;
  final String url;
  final Color color;

  SocialLink({
    required this.name,
    required this.icon,
    required this.url,
    required this.color,
  });
}
