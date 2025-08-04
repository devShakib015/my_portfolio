import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/my_colors.dart';
import 'package:my_portfolio/views/app_structure.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: false).copyWith(
        primaryColor: MyColors.primaryColor,
        appBarTheme: AppBarTheme(backgroundColor: MyColors.primaryColor),
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
      ),
      title: 'K M Shahriar Hossain - Software Developer',
      color: MyColors.primaryColor,
      home: AppStructure(),
    );
  }
}
