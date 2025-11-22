import 'package:flutter/material.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../sections/contact_section.dart';
import '../sections/footer_section.dart';
import '../widgets/custom_scroll_behavior.dart';
import '../widgets/floating_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = [
    GlobalKey(), // Hero
    GlobalKey(), // About
    GlobalKey(), // Projects
    GlobalKey(), // Skills
    GlobalKey(), // Contact
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main scrollable content
          ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Hero/Landing Section
                  Container(
                    key: _sectionKeys[0],
                    child: const HeroSection(),
                  ),

                  // About Section
                  Container(
                    key: _sectionKeys[1],
                    child: const AboutSection(),
                  ),

                  // Projects Section
                  Container(
                    key: _sectionKeys[2],
                    child: const ProjectsSection(),
                  ),

                  // Skills Section
                  Container(
                    key: _sectionKeys[3],
                    child: const SkillsSection(),
                  ),

                  // Contact Section
                  Container(
                    key: _sectionKeys[4],
                    child: const ContactSection(),
                  ),

                  // Footer
                  const FooterSection(),
                ],
              ),
            ),
          ),

          // Floating Navigation Bar
          FloatingNavBar(
            onItemTapped: _scrollToSection,
            scrollController: _scrollController,
          ),
        ],
      ),
    );
  }
}
