import 'package:my_portfolio/models/skill.dart';

const String _path = 'assets/icons';

class MySkills {
  MySkills._();

  /// ── HOW TO ADD A NEW SKILL ─────────────────────────────────────────────────
  /// 1. Drop the icon (PNG/SVG) into assets/icons/
  /// 2. Add a Skill(...) entry below with the correct image path and progress %.
  /// ──────────────────────────────────────────────────────────────────────────
  static const List<Skill> all = [
    // Core
    Skill(
        title: 'Flutter',
        image: '$_path/icons8-flutter-480.png',
        progress: 90,
        category: 'Core'),
    Skill(
        title: 'Dart',
        image: '$_path/icons8-dart-480.png',
        progress: 98,
        category: 'Core'),

    // Backend / Firebase
    Skill(
        title: 'Firebase',
        image: '$_path/icons8-firebase-480.png',
        progress: 92,
        category: 'Backend'),
    Skill(
        title: 'Authentication',
        image: '$_path/icons8-authentication-480.png',
        progress: 98,
        category: 'Backend'),
    Skill(
        title: 'Cloud Firestore',
        image: '$_path/icons8-cloud-firestore-480.png',
        progress: 100,
        category: 'Backend'),
    Skill(
        title: 'Realtime Database',
        image: '$_path/icons8-realtime-database-480.png',
        progress: 97,
        category: 'Backend'),
    Skill(
        title: 'Firebase ML',
        image: '$_path/icons8-firebase-ml-480.png',
        progress: 88,
        category: 'Backend'),
    Skill(
        title: 'In App Messaging',
        image: '$_path/icons8-in-app-messaging-480.png',
        progress: 85,
        category: 'Backend'),
    Skill(
        title: 'Google Cloud',
        image: '$_path/icons8-google-cloud-480.png',
        progress: 89,
        category: 'Backend'),
    Skill(
        title: 'Google AdMob',
        image: '$_path/icons8-google-admob-480.png',
        progress: 93,
        category: 'Backend'),

    // Languages
    Skill(
        title: 'Python',
        image: '$_path/icons8-python-480.png',
        progress: 99,
        category: 'Languages'),
    Skill(
        title: 'Django',
        image: '$_path/icons8-django-480.png',
        progress: 80,
        category: 'Languages'),
    Skill(
        title: 'Java',
        image: '$_path/icons8-java-480.png',
        progress: 81,
        category: 'Languages'),
    Skill(
        title: 'Ruby',
        image: '$_path/icons8-ruby-programming-language-480.png',
        progress: 80,
        category: 'Languages'),

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
    Skill(
        title: 'JavaScript',
        image: '$_path/icons8-javascript-480.png',
        progress: 75,
        category: 'Web'),
    Skill(
        title: 'WordPress',
        image: '$_path/icons8-wordpress-480.png',
        progress: 84,
        category: 'Web'),

    // Databases
    Skill(
        title: 'MySQL',
        image: '$_path/icons8-mysql-logo-480.png',
        progress: 89,
        category: 'Database'),
    Skill(
        title: 'PostgreSQL',
        image: '$_path/icons8-postgresql-480.png',
        progress: 90,
        category: 'Database'),
    Skill(
        title: 'MongoDB',
        image: '$_path/icons8-mongodb-480.png',
        progress: 85,
        category: 'Database'),
    Skill(
        title: 'GraphQL',
        image: '$_path/icons8-graphql-480.png',
        progress: 76,
        category: 'Database'),

    // Tools
    Skill(
        title: 'Git',
        image: '$_path/icons8-git-480.png',
        progress: 96,
        category: 'Tools'),
    Skill(
        title: 'GitHub',
        image: '$_path/icons8-github-480.png',
        progress: 99,
        category: 'Tools'),
    Skill(
        title: 'cPanel',
        image: '$_path/icons8-cpanel-480.png',
        progress: 88,
        category: 'Tools'),
    Skill(
        title: 'Heroku',
        image: '$_path/icons8-heroku-480.png',
        progress: 78,
        category: 'Tools'),
    Skill(
        title: 'Kali Linux',
        image: '$_path/icons8-kali-linux-480.png',
        progress: 70,
        category: 'Tools'),
  ];
}
