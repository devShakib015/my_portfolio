import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Models/my_images.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      elevation: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(
          MyImages.myProfileImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
