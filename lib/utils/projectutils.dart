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
    image: 'assets/projects/moviemania.png',
    title: 'Movie Mania',
    subtitle: 'A full-stack web application built with modern technologies.',
    webLink: 'https://moviemania-pearl.vercel.app/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/movie_mania',
  ),
  ProjectUtils(
    image: 'assets/projects/02.png',
    title: 'DEV PROJECT 2',
    subtitle: 'Cross-platform mobile app with rich UI and smooth UX.',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
  ProjectUtils(
    image: 'assets/projects/02.png',
    title: 'AI / ML PROJECT',
    subtitle: 'Machine learning pipeline with real-world dataset integration.',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
  ProjectUtils(
    image: 'assets/projects/02.png',
    title: 'AI ML PROJECT 2',
    subtitle: 'Deep learning model with custom training and inference.',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
  ProjectUtils(
    image: 'assets/projects/portfolio.png',
    title: 'Portfolio Website',
    subtitle: 'Beautiful Flutter app with state management and Firebase.',
    webLink: 'https://portfolio-web-app-4d7fb.web.app/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/portfolio-web-app',
  ),
  ProjectUtils(
    image: 'assets/projects/02.png',
    title: 'FLUTTER PROJECT 2',
    subtitle: 'Cross-platform Flutter app with custom animations and themes.',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
];