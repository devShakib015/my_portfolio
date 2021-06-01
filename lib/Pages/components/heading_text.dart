import 'package:flutter/material.dart';
import 'package:my_portfolio/Models/my_strings.dart';

class HeadingText extends StatelessWidget {
  final double responsivePadding;
  const HeadingText({
    Key? key,
    required this.responsivePadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsivePadding, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyStrings.headLine,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            MyStrings.tagLine.toUpperCase(),
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
