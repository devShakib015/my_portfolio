import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Custom%20Things/custom_strings.dart';
import 'package:my_portfolio/Custom%20Things/responsive_size.dart';

class HomePageMainContainer extends StatelessWidget {
  const HomePageMainContainer({
    Key? key,
    required double height,
    required double width,
  })  : _height = height,
        _width = width,
        super(key: key);

  final double _height;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height >= ResponsiveSize.fhdHeight ? 500 : 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Colors.black54,
                  fontSize: _width >= ResponsiveSize.tabWidth ? 60 : 40,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  animatedTexts: CustomStrings.homePageMainContents
                      .map(
                        (text) => FadeAnimatedText(
                          text,
                          textAlign: TextAlign.center,
                        ),
                      )
                      .toList(),
                  repeatForever: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}