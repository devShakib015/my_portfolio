import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Models/my_colors.dart';
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
        accentColor: MyColors.primaryColor,
        primaryColor: MyColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: MyColors.primaryColor,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'devShakib | Developer',
      color: MyColors.primaryColor,
      home: AppStructure(),
    );
  }
}
