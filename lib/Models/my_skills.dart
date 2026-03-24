import 'package:my_portfolio/models/skill.dart';

const String _path = 'assets/icons';

class MySkills {
  MySkills._();

  /// ── HOW TO ADD A NEW SKILL ─────────────────────────────────────────────────
  /// 1. Drop the icon (PNG/SVG) into assets/icons/
  /// 2. Add a Skill(...) entry below with the correct image path and progress %.
  /// ──────────────────────────────────────────────────────────────────────────
  static const List<Skill> all = [
    // Mobile
    Skill(
        title: 'Flutter',
        image: '$_path/icons8-flutter-480.png',
        progress: 98,
        category: 'Mobile'),
    Skill(
        title: 'Dart',
        image: '$_path/icons8-dart-480.png',
        progress: 98,
        category: 'Mobile'),

    // Cloud & DevOps
    Skill(
        title: 'Firebase',
        image: '$_path/icons8-firebase-480.png',
        progress: 95,
        category: 'Cloud & DevOps'),
    Skill(
        title: 'Google Cloud',
        image: '$_path/icons8-google-cloud-480.png',
        progress: 92,
        category: 'Cloud & DevOps'),
    Skill(
        title: 'AWS',
        image: '$_path/icons8-aws-480.png',
        progress: 88,
        category: 'Cloud & DevOps'),
    Skill(
        title: 'Docker',
        image: '$_path/icons8-docker-480.png',
        progress: 92,
        category: 'Cloud & DevOps'),
    Skill(
        title: 'Kubernetes',
        image: '$_path/icons8-kubernetes-480.png',
        progress: 85,
        category: 'Cloud & DevOps'),
    Skill(
        title: 'CI / CD',
        image: '$_path/icons8-cicd-480.png',
        progress: 90,
        category: 'Cloud & DevOps'),

    // AI & APIs
    Skill(
        title: 'AI / ML',
        image: '$_path/icons8-ai-480.png',
        progress: 88,
        category: 'AI & APIs'),
    Skill(
        title: 'REST APIs',
        image: '$_path/icons8-rest-api-480.png',
        progress: 97,
        category: 'AI & APIs'),
    Skill(
        title: 'GraphQL',
        image: '$_path/icons8-graphql-480.png',
        progress: 82,
        category: 'AI & APIs'),
    Skill(
        title: 'Firebase ML',
        image: '$_path/icons8-firebase-ml-480.png',
        progress: 90,
        category: 'AI & APIs'),

    // Backend
    Skill(
        title: 'Python',
        image: '$_path/icons8-python-480.png',
        progress: 95,
        category: 'Backend'),
    Skill(
        title: 'Django',
        image: '$_path/icons8-django-480.png',
        progress: 85,
        category: 'Backend'),
    Skill(
        title: 'JavaScript',
        image: '$_path/icons8-javascript-480.png',
        progress: 80,
        category: 'Backend'),

    // Database
    Skill(
        title: 'Cloud Firestore',
        image: '$_path/icons8-cloud-firestore-480.png',
        progress: 99,
        category: 'Database'),
    Skill(
        title: 'Realtime Database',
        image: '$_path/icons8-realtime-database-480.png',
        progress: 97,
        category: 'Database'),
    Skill(
        title: 'PostgreSQL',
        image: '$_path/icons8-postgresql-480.png',
        progress: 92,
        category: 'Database'),
    Skill(
        title: 'MySQL',
        image: '$_path/icons8-mysql-logo-480.png',
        progress: 88,
        category: 'Database'),
    Skill(
        title: 'MongoDB',
        image: '$_path/icons8-mongodb-480.png',
        progress: 87,
        category: 'Database'),

    // Tools & Leadership
    Skill(
        title: 'Git',
        image: '$_path/icons8-git-480.png',
        progress: 97,
        category: 'Tools & Leadership'),
    Skill(
        title: 'GitHub',
        image: '$_path/icons8-github-480.png',
        progress: 99,
        category: 'Tools & Leadership'),
    Skill(
        title: 'Testing & QA',
        image: '$_path/icons8-testing-480.png',
        progress: 92,
        category: 'Tools & Leadership'),
    Skill(
        title: 'Project Mgmt',
        image: '$_path/icons8-project-mgmt-480.png',
        progress: 95,
        category: 'Tools & Leadership'),
    Skill(
        title: 'Authentication',
        image: '$_path/icons8-authentication-480.png',
        progress: 98,
        category: 'Tools & Leadership'),

    // Web
    Skill(
        title: 'HTML 5',
        image: '$_path/icons8-html-5-480.png',
        progress: 99,
        category: 'Web'),
    Skill(
        title: 'CSS 3',
        image: '$_path/icons8-css3-480.png',
        progress: 93,
        category: 'Web'),
  ];
}
