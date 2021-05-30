import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Models/my_strings.dart';

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
          animatedTexts: MyStrings.keywords
              .map(
                (text) => TyperAnimatedText(
                  text,
                  speed: Duration(milliseconds: 200),
                ),
              )
              .toList(),
          repeatForever: true,
        ),
      ),
    );
  }
}
