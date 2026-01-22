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
    image: 'assets/projects/1.png',
    title: 'DEV PROJECT1',
    subtitle:
        'Hello',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
  ProjectUtils(
      image: 'assets/projects/03.png',
      title: 'DEV PROJECT 2',
      subtitle:
          'World',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
  ProjectUtils(
      image: 'assets/projects/03.png',
      title: 'DEV PROJECT 3',
      subtitle:
          'This (AI ML Project)',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
  ProjectUtils(
    image: 'assets/projects/04.png',
    title: 'AI ML PROJECT',
    subtitle:
        'is',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
  ProjectUtils(
    image: 'assets/projects/05.png',
    title: 'FLUTTER PROJECT 1',
    subtitle: 'made',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
  ProjectUtils(
    image: 'assets/projects/06.png',
    title: 'FLUTTER PROJECT 2',
    subtitle: 'from flutter',
    androidLink: 'https://google.com/',
    iosLink: 'https://google.com/',
    webLink: 'https://google.com/',
    githubLink: 'https://github.com/ANKIT-KANDULNA/',
  ),
];