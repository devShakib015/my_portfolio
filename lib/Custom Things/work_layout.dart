import 'package:flutter/material.dart';

import 'package:my_portfolio/Custom%20Things/phone_container.dart';
import 'package:my_portfolio/Custom%20Things/work_details_container.dart';
import 'package:my_portfolio/Models/responsive_size.dart';

class WorkLayout extends StatelessWidget {
  final String image;
  final String title;
  final String tagline;
  final String desc;
  final double width;
  const WorkLayout({
    Key? key,
    required this.image,
    required this.title,
    required this.tagline,
    required this.desc,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: width >= ResponsiveSize.normalWidth
          ? SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PhoneContainer(
                    image: image,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 500,
                    child: WorkDetailsContainer(
                      title: title,
                      desc: desc,
                      tagLine: tagline,
                    ),
                  ),
                ],
              ),
            )
          : ListView(
              children: [
                width >= 410
                    ? PhoneContainer(
                        image: image,
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: PhoneContainer(
                          image: image,
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                WorkDetailsContainer(
                  title: title,
                  desc: desc,
                  tagLine: tagline,
                ),
              ],
            ),
    );
  }
}
