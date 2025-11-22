import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/project_card.dart';
import '../models/project_model.dart';

/// Projects/Portfolio Section with grid layout
/// Features: Hover animations, expandable cards, tech stack tags
class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _isVisible = false;

  // TODO: Replace with your actual projects
  final List<Project> projects = [
    Project(
      title: 'E-Commerce Platform',
      description: 'A full-featured online shopping platform with real-time inventory management, payment processing, and admin dashboard.',
      imageUrl: 'assets/images/project1.png', // Replace with your image
      techStack: ['Flutter', 'Firebase', 'Node.js', 'Stripe'],
      demoUrl: 'https://demo.example.com',
      githubUrl: 'https://github.com/yourusername/project',
      category: 'Web & Mobile',
    ),
    Project(
      title: 'Task Management App',
      description: 'Collaborative task management tool with drag-and-drop interface, team collaboration features, and analytics.',
      imageUrl: 'assets/images/project2.png',
      techStack: ['React', 'TypeScript', 'PostgreSQL', 'GraphQL'],
      demoUrl: 'https://demo.example.com',
      githubUrl: 'https://github.com/yourusername/project',
      category: 'Web',
    ),
    Project(
      title: 'AI Image Generator',
      description: 'Machine learning powered image generation tool with custom style transfer and real-time preview.',
      imageUrl: 'assets/images/project3.png',
      techStack: ['Python', 'TensorFlow', 'FastAPI', 'React'],
      demoUrl: 'https://demo.example.com',
      githubUrl: 'https://github.com/yourusername/project',
      category: 'AI/ML',
    ),
    Project(
      title: 'Fitness Tracking App',
      description: 'Mobile app for tracking workouts, nutrition, and progress with personalized recommendations.',
      imageUrl: 'assets/images/project4.png',
      techStack: ['Flutter', 'Dart', 'Firebase', 'ML Kit'],
      demoUrl: 'https://demo.example.com',
      githubUrl: 'https://github.com/yourusername/project',
      category: 'Mobile',
    ),
    Project(
      title: 'Portfolio Website Builder',
      description: 'Drag-and-drop website builder specifically designed for creative professionals and developers.',
      imageUrl: 'assets/images/project5.png',
      techStack: ['Vue.js', 'Tailwind CSS', 'Supabase'],
      demoUrl: 'https://demo.example.com',
      githubUrl: 'https://github.com/yourusername/project',
      category: 'Web',
    ),
    Project(
      title: 'Real-time Chat Application',
      description: 'Secure messaging platform with end-to-end encryption, voice calls, and file sharing.',
      imageUrl: 'assets/images/project6.png',
      techStack: ['Socket.io', 'WebRTC', 'MongoDB', 'Express'],
      demoUrl: 'https://demo.example.com',
      githubUrl: 'https://github.com/yourusername/project',
      category: 'Web',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    // Calculate grid columns based on screen size
    int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return VisibilityDetector(
      key: const Key('projects-section'),
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
                  title: 'Featured Projects',
                  subtitle: 'Things I\'ve built',
                ),

                const SizedBox(height: 64),

                // Projects grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: isMobile ? 0.85 : 0.75,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: projects[index],
                      delay: index * 100,
                      isVisible: _isVisible,
                    );
                  },
                ),

                const SizedBox(height: 48),

                // View more button
                if (_isVisible)
                  OutlinedButton(
                    onPressed: () {
                      // TODO: Link to full project gallery or GitHub
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppTheme.primaryAccent,
                        width: 2,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View All Projects',
                          style: TextStyle(color: AppTheme.textPrimary),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          color: AppTheme.primaryAccent,
                          size: 20,
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 600.ms)
                      .slideY(begin: 0.2, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
