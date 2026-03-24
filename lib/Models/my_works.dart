import 'package:my_portfolio/models/my_images.dart';
import 'package:my_portfolio/models/work.dart';

class MyWorks {
  MyWorks._();

  static final List<Work> all = [
    Work(
      title: 'Quaksha',
      category: 'Mobile App',
      tagline: 'Live tutoring & course platform with REST API integration',
      desc: 'A full-featured online educational platform enabling students to '
          'discover courses, attend live sessions, and track their learning '
          'progress. Built with a clean UI and seamless REST API integration.',
      screenshots: MyImages.quaksha,
      tags: ['Flutter', 'Dart', 'REST API', 'Firebase'],
    ),
    Work(
      title: 'E-Commerce App',
      category: 'Mobile App',
      tagline: 'Full-stack shopping app backed by Firebase',
      desc: 'A fully functional e-commerce application with product listings, '
          'cart management, user authentication, and real-time order tracking '
          '— powered by Firebase Authentication, Firestore, and Storage.',
      screenshots: MyImages.ecommerce,
      tags: ['Flutter', 'Firebase', 'Firestore', 'Cloud Storage'],
    ),
    Work(
      title: 'BMI Calculator',
      category: 'Health & Fitness',
      tagline: 'Elegant health tracker inspired by Dribbble',
      desc: 'A minimal and elegant BMI calculator featuring smooth animations '
          'and an intuitive interface designed from a Dribbble concept.',
      screenshots: MyImages.bmi,
      tags: ['Flutter', 'Dart', 'UI/UX'],
    ),
    Work(
      title: 'Coin Tracker',
      category: 'Finance',
      tagline: 'Real-time cryptocurrency price tracker',
      desc:
          'A sleek crypto tracking app displaying live coin prices and market '
          'movements with fully custom UI components.',
      screenshots: MyImages.coin,
      tags: ['Flutter', 'Dart', 'API Integration'],
    ),
    Work(
      title: 'Online Earning App',
      category: 'Mobile App',
      tagline: 'Large-scale earning platform backed by Firebase',
      desc: 'A comprehensive online earning platform with task management, '
          'wallet system, and reward tracking backed by a full Firebase backend '
          'with real-time updates.',
      screenshots: MyImages.wb,
      tags: ['Flutter', 'Firebase', 'Cloud Functions', 'Firestore'],
    ),
    Work(
      title: 'Movie & Series Wiki',
      category: 'Entertainment',
      tagline: 'Browse media info with TMDB API integration',
      desc: 'A movie and TV series discovery app fetching real-time data from '
          'TMDB API. Browse trending content, view ratings, read synopses, '
          'and explore cast details.',
      screenshots: MyImages.msw,
      tags: ['Flutter', 'Dart', 'REST API', 'TMDB'],
    ),
  ];
}
