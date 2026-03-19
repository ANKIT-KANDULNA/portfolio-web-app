class EducationUtils {
  final String institution;
  final String degree;
  final String field;          // e.g. "Computer Science & Engineering"
  final String duration;       // e.g. "2022 – 2026"
  final String grade;          // CGPA or percentage
  final String location;
  final List<String> highlights; // relevant coursework, achievements
  final String? institutionUrl;
  final String? logo;

  EducationUtils({
    required this.institution,
    required this.degree,
    required this.field,
    required this.duration,
    required this.grade,
    required this.location,
    this.highlights = const [],
    this.institutionUrl,
    this.logo
  });
}

// ── Add your education here ──
List<EducationUtils> educationList = [
  EducationUtils(
    institution: "Delhi Technological University",
    degree: "Bachelor of Technology",
    field: "Computer Science & Engineering",
    duration: "2023 - 2027",
    grade: "7.72 CGPA",
    location: "Delhi, India",
    logo: "education/dtu-logo.png",
    highlights: [
      "Relevant coursework: DSA, OS, DBMS, Computer Networks.",
    ],
    institutionUrl: "https://dtu.ac.in",
  ),
  EducationUtils(
    institution: "Rosary Senior Secondary School",
    degree: "Class XII (PCM + CS)",
    field: "Science with Computer Science",
    duration: "2022 - 2023",
    grade: "83.8%",
    location: "Delhi, India",
    logo: "education/rosary-logo.png",
    highlights: [
      "Scored 83.8% in CBSE Board Examinations.",
    ],
    institutionUrl: "https://www.rosaryschool.in/home.html",
  ),
  EducationUtils(
    institution: "Rosary Senior Secondary School",
    degree: "Class X",
    field: "",
    duration: "2020 - 2021",
    grade: "77%",
    location: "Delhi, India",
    logo: "education/rosary-logo.png",
    highlights: [
      "Scored 77% in CBSE Board Examinations.",
    ],
    institutionUrl: "https://www.rosaryschool.in/home.html",
  ),
];