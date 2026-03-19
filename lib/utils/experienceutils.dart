class ExperienceUtils {
  final String company;
  final String role;
  final String duration;
  final String location;
  final String type;           // "Full-time", "Internship", "Part-time"
  final List<String> points;  // bullet points of what you did
  final String? companyUrl;
  final List<String> techUsed; // tech stack badges
  final String? logo;

  ExperienceUtils({
    required this.company,
    required this.role,
    required this.duration,
    required this.location,
    required this.type,
    required this.points,
    this.companyUrl,
    this.techUsed = const [],
    this.logo,
  });
}

// ── Add your experience here when you have it ──
List<ExperienceUtils> experienceList = [
  ExperienceUtils(
    company: "Company Name",
    role: "Flutter Developer Intern",
    duration: "Jun 2025 - Aug 2025",
    location: "Remote / Delhi, India",
    type: "Internship",
    logo: "companies/flutter-logo.png",
    points: [
      "Built and shipped X feature that improved Y by Z%.",
      "Collaborated with a team of N engineers on cross-platform app.",
      "Integrated REST APIs and managed state using Provider/Riverpod.",
    ],
    companyUrl: "https://company.com",
    techUsed: ["Flutter", "Dart", "Firebase"],
  ),
];