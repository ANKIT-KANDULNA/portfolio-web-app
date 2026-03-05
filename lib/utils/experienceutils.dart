class ExperienceUtils {
  final String company;
  final String role;
  final String duration;      // e.g. "Jan 2024 – Present"
  final String description;
  final String? logo;         // asset path

  ExperienceUtils({
    required this.company,
    required this.role,
    required this.duration,
    required this.description,
    this.logo,
  });
}

List<ExperienceUtils> experienceList = [
  // Add your internships/jobs here when you have them
];