import 'package:flutter/material.dart';
import 'package:my_portfolio/Models/my_colors.dart';

class PhoneContainer extends StatelessWidget {
  final String image;
  const PhoneContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _phoneWidth = 280;
    double _phoneheight = 590;
    double _border = 10;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Container(
          width: _phoneWidth,
          height: _phoneheight,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: _border,
                color: MyColors.phoneColor,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 20,
                  spreadRadius: 7,
                  offset: Offset(5, 10),
                ),
              ]),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: _phoneWidth,
                  height: _border * 2,
                  color: MyColors.phoneColor,
                ),
              ),
              Positioned(
                top: 10,
                left: 100,
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Positioned(
                top: 7.5,
                left: 160,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Positioned(
                top: _border * 2,
                bottom: _border * 2,
                child: Container(
                  width: _phoneWidth - _border * 2,
                  height: _phoneheight - _border * 4,
                  color: Colors.white,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: _phoneWidth,
                  height: _border * 2,
                  color: MyColors.phoneColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
