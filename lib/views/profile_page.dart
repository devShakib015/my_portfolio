import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/custom/profile_details_section.dart';
import 'package:my_portfolio/custom/profile_image_section.dart';
import 'package:my_portfolio/models/my_strings.dart';
import 'package:my_portfolio/models/responsive_size.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double responsivePadding = width >= ResponsiveSize.mobileWidth ? 50 : 15;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: responsivePadding, vertical: 20),
      child: width >= ResponsiveSize.tabWidth
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: ProfileDetailsSection(
                            contactButtons: MyStrings.contactButtons)),
                  ),
                  SizedBox(width: 50),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: ProfileImageSection(),
                    ),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: ProfileImageSection(),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ProfileDetailsSection(
                    contactButtons: MyStrings.contactButtons,
                  ),
                ],
              ),
            ),
    );
  }
}
