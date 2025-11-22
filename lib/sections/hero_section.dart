import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/animated_background.dart';
import '../widgets/gradient_text.dart';

/// Landing/Hero Section with animated introduction
/// Features: Animated name, tagline, profile image with fade/slide effects
class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        children: [
          // Animated background with floating shapes
          const AnimatedBackground(),

          // Main content
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: Responsive.contentWidth(context),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.horizontalPadding(context),
              ),
              child: isMobile
                  ? _buildMobileLayout()
                  : _buildDesktopLayout(),
            ),
          ),

          // Scroll indicator at bottom
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: _buildScrollIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text content
        Expanded(
          flex: 6,
          child: _buildTextContent(),
        ),

        const SizedBox(width: 80),

        // Profile image/graphic
        Expanded(
          flex: 4,
          child: _buildProfileImage(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfileImage()
            .animate()
            .fadeIn(duration: 600.ms)
            .scale(delay: 200.ms),
        const SizedBox(height: 40),
        _buildTextContent(),
      ],
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // "Hi, I'm" text
        Text(
          'Hi, I\'m',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.textSecondary,
                fontWeight: FontWeight.w400,
              ),
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),

        const SizedBox(height: 8),

        // Animated name with gradient
        GradientText(
          // TODO: Replace with your name
          'Your Name',
          gradient: AppTheme.primaryGradient,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: Responsive.value(
                  context,
                  mobile: 40,
                  desktop: 56,
                ),
              ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 200.ms)
            .slideX(begin: -0.2, end: 0, delay: 200.ms),

        const SizedBox(height: 16),

        // Animated typing tagline
        SizedBox(
          height: 60,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Full-Stack Developer',
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.secondaryAccent,
                      fontSize: Responsive.value(
                        context,
                        mobile: 24,
                        desktop: 32,
                      ),
                    ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'UI/UX Designer',
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.secondaryAccent,
                      fontSize: Responsive.value(
                        context,
                        mobile: 24,
                        desktop: 32,
                      ),
                    ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'Creative Problem Solver',
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.secondaryAccent,
                      fontSize: Responsive.value(
                        context,
                        mobile: 24,
                        desktop: 32,
                      ),
                    ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            repeatForever: true,
            pause: const Duration(milliseconds: 1000),
          ),
        )
            .animate()
            .fadeIn(delay: 400.ms),

        const SizedBox(height: 24),

        // Brief summary
        Text(
          // TODO: Replace with your summary
          'I craft beautiful, functional digital experiences that blend innovation with user-centric design. Passionate about clean code and pixel-perfect interfaces.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: Responsive.isMobile(context)
              ? TextAlign.center
              : TextAlign.left,
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 600.ms)
            .slideY(begin: 0.2, end: 0, delay: 600.ms),

        const SizedBox(height: 40),

        // CTA Buttons
        _buildCTAButtons()
            .animate()
            .fadeIn(duration: 600.ms, delay: 800.ms)
            .slideY(begin: 0.2, end: 0, delay: 800.ms),
      ],
    );
  }

  Widget _buildCTAButtons() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: Responsive.isMobile(context)
          ? WrapAlignment.center
          : WrapAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            // TODO: Implement scroll to projects or external link
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryAccent,
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 20,
            ),
          ),
          child: const Text('View My Work'),
        ),
        OutlinedButton(
          onPressed: () {
            // TODO: Implement scroll to contact
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppTheme.primaryAccent, width: 2),
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 20,
            ),
          ),
          child: const Text(
            'Get In Touch',
            style: TextStyle(color: AppTheme.textPrimary),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: Responsive.value(context, mobile: 250, desktop: 400),
      height: Responsive.value(context, mobile: 250, desktop: 400),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppTheme.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryAccent.withOpacity(0.3),
            blurRadius: 60,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.backgroundDark,
          // TODO: Add your profile image here
          // image: DecorationImage(
          //   image: AssetImage('assets/images/profile.png'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: const Center(
          child: Icon(
            Icons.person,
            size: 120,
            color: AppTheme.primaryAccent,
          ),
        ),
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(reverse: true),
        )
        .shimmer(
          duration: 3000.ms,
          color: AppTheme.primaryAccent.withOpacity(0.1),
        );
  }

  Widget _buildScrollIndicator() {
    return Column(
      children: [
        Text(
          'Scroll Down',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary.withOpacity(0.6),
                letterSpacing: 2,
              ),
        ),
        const SizedBox(height: 8),
        Icon(
          Icons.keyboard_arrow_down,
          color: AppTheme.textSecondary.withOpacity(0.6),
        )
            .animate(
              onPlay: (controller) => controller.repeat(reverse: true),
            )
            .moveY(
              begin: 0,
              end: 10,
              duration: 1000.ms,
            ),
      ],
    )
        .animate()
        .fadeIn(delay: 1000.ms);
  }
}
