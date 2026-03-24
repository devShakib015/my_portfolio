import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/views/portfolio_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K M Shahriar Hossain — Flutter Developer & CTO',
      theme: ThemeData.dark(useMaterial3: false).copyWith(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.accent,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppColors.textPrimary,
                displayColor: AppColors.textPrimary,
              ),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}
