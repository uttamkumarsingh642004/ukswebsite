/// Project data model
/// Represents a portfolio project with all its details
class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String? demoUrl;
  final String? githubUrl;
  final String category;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    this.demoUrl,
    this.githubUrl,
    required this.category,
  });
}
