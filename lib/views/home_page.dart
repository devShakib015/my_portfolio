import 'package:flutter/material.dart';
import 'package:my_portfolio/models/responsive_size.dart';
import 'package:my_portfolio/views/components/heading_text.dart';
import 'package:my_portfolio/views/components/home_page_main_container.dart';
import 'package:my_portfolio/views/components/typewriter_animated_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double responsivePadding = width >= ResponsiveSize.mobileWidth ? 50 : 15;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          width >= ResponsiveSize.tabWidth
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingText(
                      responsivePadding: responsivePadding,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: responsivePadding, vertical: 30),
                          child: TypewriterAnimatedTextHome(),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(
                      responsivePadding: responsivePadding,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsivePadding,
                        ),
                        child: TypewriterAnimatedTextHome(),
                      ),
                    ),
                  ],
                ),
          HomePageMainContainer(height: height, width: width),
        ],
      ),
    );
  }
}
