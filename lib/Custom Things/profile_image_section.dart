import 'package:flutter/cupertino.dart';
import 'package:my_portfolio/Models/my_images.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        MyImages.myProfileImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
