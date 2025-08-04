import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/models/my_strings.dart';
import 'package:my_portfolio/models/responsive_size.dart';

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
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: AnimatedTextKit(
              animatedTexts: MyStrings.homePageMainContents.map(
                (text) {
                  return FadeAnimatedText(text,
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: _width >= ResponsiveSize.tabWidth ? 60 : 40,
                        fontWeight: FontWeight.bold,
                      ));
                },
              ).toList(),
              repeatForever: true,
            ),
          ),
        ),
      ),
    );
  }
}
