import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Custom%20Things/custom_strings.dart';

final TextStyle _textStyle = GoogleFonts.lobsterTwo(
  color: Colors.black54,
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

class TypewriterAnimatedTextHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DefaultTextStyle(
        style: _textStyle,
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              CustomStrings.keyword1,
              speed: Duration(milliseconds: 200),
            ),
            TypewriterAnimatedText(
              CustomStrings.keyword2,
              speed: Duration(milliseconds: 200),
            ),
            TypewriterAnimatedText(
              CustomStrings.keyword3,
              speed: Duration(milliseconds: 200),
            ),
            TypewriterAnimatedText(
              CustomStrings.keyword4,
              speed: Duration(milliseconds: 200),
            ),
          ],
          repeatForever: true,
        ),
      ),
    );
  }
}
