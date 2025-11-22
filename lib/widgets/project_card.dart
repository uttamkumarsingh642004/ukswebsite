import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project_model.dart';
import '../utils/app_theme.dart';
import '../utils/responsive.dart';

/// Project card with hover effects and expandable details
/// Displays project information in an attractive card format
class ProjectCard extends StatefulWidget {
  final Project project;
  final int delay;
  final bool isVisible;

  const ProjectCard({
    super.key,
    required this.project,
    required this.delay,
    required this.isVisible,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => _showProjectDetails(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -8.0 : 0.0),
          decoration: BoxDecoration(
            color: AppTheme.cardDark,
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.primaryAccent
                  : AppTheme.primaryAccent.withOpacity(0.2),
              width: _isHovered ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppTheme.primaryAccent.withOpacity(0.3)
                    : AppTheme.primaryAccent.withOpacity(0.1),
                blurRadius: _isHovered ? 30 : 20,
                offset: Offset(0, _isHovered ? 15 : 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project image
              _buildProjectImage(),

              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.paddingM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category badge
                      _buildCategoryBadge(),

                      const SizedBox(height: 12),

                      // Title
                      Text(
                        widget.project.title,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize: 20,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 8),

                      // Description
                      Text(
                        widget.project.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const Spacer(),

                      // Tech stack
                      _buildTechStack(),

                      const SizedBox(height: 12),

                      // Action buttons
                      _buildActionButtons(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          .animate(
            target: widget.isVisible ? 1 : 0,
          )
          .fadeIn(duration: 600.ms, delay: widget.delay.ms)
          .slideY(begin: 0.3, end: 0, delay: widget.delay.ms),
    );
  }

  Widget _buildProjectImage() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppTheme.radiusL),
          topRight: Radius.circular(AppTheme.radiusL),
        ),
        gradient: AppTheme.primaryGradient,
      ),
      child: Stack(
        children: [
          // TODO: Replace with actual project image
          // Image.asset(
          //   widget.project.imageUrl,
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          // ),

          // Placeholder
          Center(
            child: Icon(
              Icons.web,
              size: 60,
              color: Colors.white.withOpacity(0.5),
            ),
          ),

          // Overlay on hover
          if (_isHovered)
            Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryAccent.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppTheme.radiusL),
                  topRight: Radius.circular(AppTheme.radiusL),
                ),
              ),
              child: const Center(
                child: Text(
                  'Click to view details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 200.ms),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppTheme.secondaryAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        widget.project.category,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.secondaryAccent,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildTechStack() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.project.techStack.take(3).map((tech) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppTheme.primaryAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppTheme.primaryAccent.withOpacity(0.3),
            ),
          ),
          child: Text(
            tech,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.primaryAccent,
                  fontSize: 11,
                ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        if (widget.project.demoUrl != null)
          Expanded(
            child: OutlinedButton(
              onPressed: () => _launchUrl(widget.project.demoUrl!),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: AppTheme.primaryAccent.withOpacity(0.5),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.launch, size: 14, color: AppTheme.primaryAccent),
                  SizedBox(width: 4),
                  Text(
                    'Demo',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (widget.project.demoUrl != null && widget.project.githubUrl != null)
          const SizedBox(width: 8),
        if (widget.project.githubUrl != null)
          Expanded(
            child: OutlinedButton(
              onPressed: () => _launchUrl(widget.project.githubUrl!),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: AppTheme.primaryAccent.withOpacity(0.5),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.code, size: 14, color: AppTheme.primaryAccent),
                  SizedBox(width: 4),
                  Text(
                    'Code',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  void _showProjectDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppTheme.cardDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: Responsive.isDesktop(context) ? 800 : double.infinity,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          padding: const EdgeInsets.all(AppTheme.paddingL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.project.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Text(
                'Tech Stack:',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.project.techStack.map((tech) {
                  return Chip(
                    label: Text(tech),
                    backgroundColor: AppTheme.primaryAccent.withOpacity(0.2),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  if (widget.project.demoUrl != null)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _launchUrl(widget.project.demoUrl!),
                        icon: const Icon(Icons.launch, size: 20),
                        label: const Text('View Demo'),
                      ),
                    ),
                  if (widget.project.demoUrl != null &&
                      widget.project.githubUrl != null)
                    const SizedBox(width: 16),
                  if (widget.project.githubUrl != null)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _launchUrl(widget.project.githubUrl!),
                        icon: const Icon(Icons.code, size: 20),
                        label: const Text('View Code'),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppTheme.primaryAccent),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
