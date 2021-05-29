import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Custom%20Things/custom_colors.dart';
import 'package:my_portfolio/Pages/app_structure.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        accentColor: CustomColors.primaryColor,
        primaryColor: CustomColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColors.primaryColor,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'devShakib | Developer',
      color: CustomColors.primaryColor,
      home: AppStructure(),
    );
  }
}
