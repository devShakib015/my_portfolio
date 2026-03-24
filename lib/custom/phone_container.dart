import 'package:flutter/material.dart';
import 'package:my_portfolio/models/my_colors.dart';

class PhoneContainer extends StatelessWidget {
  final String image;
  const PhoneContainer({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double phoneWidth = 275;
    double phoneheight = 565;
    double border = 15;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: 3),
              width: phoneWidth,
              height: phoneheight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: border,
                  color: MyColors.phoneColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 20,
                    spreadRadius: 7,
                    offset: Offset(5, 10),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  //Image
                  Positioned(
                    top: border * 2,
                    bottom: border * 1.5,
                    child: Container(
                      width: phoneWidth - border * 2,
                      height: phoneheight - border * 3.5,
                      color: MyColors.phoneColor,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),

                  //Top Border
                  Positioned(
                    child: Container(
                      width: phoneWidth,
                      height: border * 2,
                      color: MyColors.phoneColor,
                    ),
                  ),

                  //Microphone
                  Positioned(
                    top: 7,
                    left: 100,
                    child: Container(
                      width: 36,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  //Camera
                  Positioned(
                    top: 4,
                    left: 160,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  //Bottom Border
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: phoneWidth,
                      height: border * 1.5,
                      color: MyColors.phoneColor,
                    ),
                  ),
                ],
              ),
            ),
            PhoneButton(
              border: border,
              position: 6,
            ),
            PhoneButton(
              border: border,
              position: 10,
            ),
            PhoneButton(
              border: border,
              position: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneButton extends StatelessWidget {
  const PhoneButton({
    super.key,
    required double border,
    required int position,
  })  : _border = border,
        _position = position;

  final double _border;
  final int _position;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _border * _position,
      right: 0,
      child: Container(
        width: 7,
        height: _border * 3,
        decoration: BoxDecoration(
          color: MyColors.phoneColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(1, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
