import 'package:flutter/material.dart';
import 'package:my_portfolio/Models/responsive_size.dart';
import 'package:my_portfolio/Pages/components/heading_text.dart';
import 'package:my_portfolio/Pages/components/home_page_main_container.dart';
import 'package:my_portfolio/Pages/components/typewriter_animated_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _responsivePadding = _width >= ResponsiveSize.mobileWidth ? 50 : 15;
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _width >= ResponsiveSize.tabWidth
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeadingText(
                        responsivePadding: _responsivePadding,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _responsivePadding, vertical: 30),
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
                        responsivePadding: _responsivePadding,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: _responsivePadding,
                          ),
                          child: TypewriterAnimatedTextHome(),
                        ),
                      ),
                    ],
                  ),
            HomePageMainContainer(height: _height, width: _width),
          ],
        ),
      ),
    );
  }
}
