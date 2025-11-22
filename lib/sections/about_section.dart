import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/animated_card.dart';

/// About Section with professional bio, interests, and values
/// Features: Fade-in animation on scroll, creative card design
class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: Container(
        width: double.infinity,
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
                  title: 'About Me',
                  subtitle: 'Get to know me better',
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
        // Main bio card
        Expanded(
          flex: 6,
          child: _buildBioCard(),
        ),

        const SizedBox(width: 32),

        // Side cards (interests, values)
        Expanded(
          flex: 4,
          child: Column(
            children: [
              _buildInterestsCard(),
              const SizedBox(height: 24),
              _buildValuesCard(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildBioCard(),
        const SizedBox(height: 24),
        _buildInterestsCard(),
        const SizedBox(height: 24),
        _buildValuesCard(),
      ],
    );
  }

  Widget _buildBioCard() {
    return AnimatedCard(
      delay: 0,
      isVisible: _isVisible,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Decorative element
            Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(3),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Professional Bio',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 20),

            // TODO: Replace with your bio
            Text(
              'I\'m a passionate developer with 5+ years of experience building elegant solutions to complex problems. My journey in tech started with a curiosity about how things work and evolved into a career dedicated to crafting exceptional digital experiences.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 16),

            Text(
              'I specialize in full-stack development with a keen eye for design. Whether it\'s architecting scalable backend systems or creating pixel-perfect user interfaces, I approach every project with enthusiasm and attention to detail.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 16),

            Text(
              'When I\'m not coding, you\'ll find me exploring new technologies, contributing to open-source projects, or sharing knowledge with the developer community through blog posts and workshops.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 32),

            // Stats row
            _buildStatsRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Wrap(
      spacing: 40,
      runSpacing: 20,
      children: [
        _buildStat('5+', 'Years Experience'),
        _buildStat('50+', 'Projects Completed'),
        _buildStat('30+', 'Happy Clients'),
      ],
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppTheme.primaryAccent,
                fontSize: 36,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildInterestsCard() {
    return AnimatedCard(
      delay: 200,
      isVisible: _isVisible,
      gradient: AppTheme.accentGradient.colors,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Interests',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // TODO: Replace with your interests
            ...[
              'Open Source Contribution',
              'UI/UX Design',
              'Machine Learning',
              'Tech Blogging',
            ].map((interest) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        interest,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildValuesCard() {
    return AnimatedCard(
      delay: 400,
      isVisible: _isVisible,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.stars,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Core Values',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),

            const SizedBox(height: 20),

            // TODO: Replace with your values
            ...[
              {'title': 'Innovation', 'icon': Icons.lightbulb_outline},
              {'title': 'Quality', 'icon': Icons.verified_outlined},
              {'title': 'Collaboration', 'icon': Icons.people_outline},
              {'title': 'Growth', 'icon': Icons.trending_up},
            ].map((value) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Icon(
                        value['icon'] as IconData,
                        color: AppTheme.primaryAccent,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        value['title'] as String,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
