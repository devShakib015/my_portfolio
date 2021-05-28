import 'package:flutter/material.dart';
import 'package:my_portfolio/Custom%20Things/responsive_size.dart';
import 'package:my_portfolio/Pages/components/heading_text.dart';
import 'package:my_portfolio/Pages/components/typewriter_animated_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _width >= ResponsiveSize.tabWidth
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeadingText(),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 30),
                            child: TypewriterAnimatedTextHome(),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: TypewriterAnimatedTextHome(),
                        ),
                      ),
                    ],
                  ),
            Container(
              height: 1000,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey[100],
                  child: Center(
                    child: Text("Something!!"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
