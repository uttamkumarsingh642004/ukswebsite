import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_badge.dart';

/// Skills Section with interactive animated icons
/// Features: Hover animations, categorized skills, progress indicators
class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _isVisible = false;

  // TODO: Replace with your actual skills
  final Map<String, List<SkillData>> skillCategories = {
    'Frontend': [
      SkillData('Flutter', FontAwesomeIcons.google, 90, AppTheme.primaryAccent),
      SkillData('React', FontAwesomeIcons.react, 85, const Color(0xFF61DAFB)),
      SkillData('Vue.js', FontAwesomeIcons.vuejs, 80, const Color(0xFF42B883)),
      SkillData('HTML/CSS', FontAwesomeIcons.html5, 95, const Color(0xFFE34F26)),
      SkillData('TypeScript', FontAwesomeIcons.js, 85, const Color(0xFF3178C6)),
    ],
    'Backend': [
      SkillData('Node.js', FontAwesomeIcons.node, 85, const Color(0xFF339933)),
      SkillData('Python', FontAwesomeIcons.python, 80, const Color(0xFF3776AB)),
      SkillData('Firebase', FontAwesomeIcons.fire, 88, const Color(0xFFFFCA28)),
      SkillData('PostgreSQL', FontAwesomeIcons.database, 75, const Color(0xFF4169E1)),
      SkillData('GraphQL', FontAwesomeIcons.code, 70, const Color(0xFFE10098)),
    ],
    'Tools & Others': [
      SkillData('Git', FontAwesomeIcons.git, 90, const Color(0xFFF05032)),
      SkillData('Docker', FontAwesomeIcons.docker, 75, const Color(0xFF2496ED)),
      SkillData('Figma', FontAwesomeIcons.figma, 85, const Color(0xFFF24E1E)),
      SkillData('AWS', FontAwesomeIcons.aws, 70, const Color(0xFFFF9900)),
      SkillData('VS Code', FontAwesomeIcons.code, 95, const Color(0xFF007ACC)),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return VisibilityDetector(
      key: const Key('skills-section'),
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
                  title: 'Skills & Expertise',
                  subtitle: 'Technologies I work with',
                ),

                const SizedBox(height: 64),

                // Skill categories
                ...skillCategories.entries.map((entry) {
                  return _buildSkillCategory(
                    entry.key,
                    entry.value,
                    isMobile,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCategory(
    String category,
    List<SkillData> skills,
    bool isMobile,
  ) {
    final categoryIndex = skillCategories.keys.toList().indexOf(category);

    return Container(
      margin: const EdgeInsets.only(bottom: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category title
          Text(
            category,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppTheme.primaryAccent,
                ),
          )
              .animate(
                target: _isVisible ? 1 : 0,
              )
              .fadeIn(delay: (categoryIndex * 200).ms)
              .slideX(begin: -0.2, end: 0),

          const SizedBox(height: 24),

          // Skills grid
          Wrap(
            spacing: isMobile ? 12 : 20,
            runSpacing: isMobile ? 12 : 20,
            children: skills.asMap().entries.map((entry) {
              final index = entry.key;
              final skill = entry.value;
              return SkillBadge(
                skill: skill,
                delay: (categoryIndex * 200) + (index * 50),
                isVisible: _isVisible,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

/// Skill data model
class SkillData {
  final String name;
  final IconData icon;
  final double proficiency; // 0-100
  final Color color;

  SkillData(this.name, this.icon, this.proficiency, this.color);
}
