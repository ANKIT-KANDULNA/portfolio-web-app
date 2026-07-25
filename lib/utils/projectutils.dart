class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? githubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.githubLink,
  });
}

List<ProjectUtils> projectUtils = [
  ProjectUtils(
    image: 'assets/projects/02.png',
    title: 'WEB DEV',
    subtitle: 'FAAAH',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
  ProjectUtils(
    image: 'assets/projects/mentor-platform.png',
    title: 'Mentor Platform',
    subtitle: 'A web platform connecting students with placed seniors for mentorship, featuring session booking, real-time chat, and video calling.',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/mentor-platform',
  ),
  ProjectUtils(
    image: 'assets/projects/rentronix.png',
    title: 'Rentronix',
    subtitle: 'Rentronix is a platform for renting out electronics on short-term, contract-based agreements.',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/Rentronix',
  ),
  ProjectUtils(
    image: 'assets/projects/writelikemeai.png',
    title: 'WriteLikeMeAI',
    subtitle: 'WritelikeMe AI is a handwriting synthesis app (Next.js + FastAPI) that generates text and renders it in realistic handwriting fonts.',
    webLink: 'https://write-like-me-ai.vercel.app/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/WriteLikeMeAI',
  ),
  ProjectUtils(
    image: 'assets/projects/fooddelish.png',
    title: 'FOOD DELiSH',
    subtitle: 'A full-stack food ordering platform with user authentication, dynamic menu management, and real-time order handling.',
    webLink: 'https://food-delish.vercel.app/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/food-delish',
  ),
  ProjectUtils(
    image: 'assets/projects/moviemania.png',
    title: 'Movie Mania',
    subtitle: 'A full-stack web application built with modern technologies.',
    webLink: 'https://moviemania-pearl.vercel.app/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/movie_mania',
  ),
  ProjectUtils(
    image: 'assets/projects/aidetector.png',
    title: 'AI-Detector',
    subtitle: 'An AI-based image detection system that identifies AI-generated images using deep learning models.',
    webLink: 'https://ai-detector-ruddy-eta.vercel.app/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/AI-Detector/',
  ),
  ProjectUtils(
    image: 'assets/projects/skills-needed-analysis.png',
    title: 'Skills Needed Analysis',
    subtitle: 'An end-to-end data analysis project processing 6,000+ job postings using Python (Pandas/Regex) to extract in-demand tech skills, visualized via an interactive Power BI dashboard.',
    githubLink: 'https://github.com/ANKIT-KANDULNA/skills-needed-analysis',
  ),
  ProjectUtils(
    image: 'assets/projects/portfolio.png',
    title: 'Portfolio Website',
    subtitle: 'Beautiful Flutter app with state management and Firebase.',
    webLink: 'https://portfolio-web-app-4d7fb.web.app/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/portfolio-web-app',
  ),
];