class EducationUtils {
  final String institution;
  final String degree;
  final String duration;      // e.g. "2022 – 2026"
  final String grade;         // CGPA or %
  final String? logo;

  EducationUtils({
    required this.institution,
    required this.degree,
    required this.duration,
    required this.grade,
    this.logo,
  });
}

List<EducationUtils> educationList = [
  EducationUtils(
    institution: "Your College Name",
    degree: "B.Tech Computer Science",
    duration: "2022 – 2026",
    grade: "X.X CGPA",
  ),
];