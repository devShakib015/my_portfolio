import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Custom%20Things/custom_colors.dart';
import 'package:my_portfolio/Custom%20Things/responsive_size.dart';
import 'package:my_portfolio/Pages/home_page.dart';
import 'package:my_portfolio/Pages/profile_page.dart';
import 'package:my_portfolio/Pages/skills_page.dart';
import 'package:my_portfolio/Pages/works_page.dart';

class AppStructure extends StatefulWidget {
  @override
  _AppStructureState createState() => _AppStructureState();
}

class _AppStructureState extends State<AppStructure> {
  int _selectedTab = 1;

  Widget _selectTabs() {
    if (_selectedTab == 1) {
      return HomePage();
    } else if (_selectedTab == 2) {
      return SkillsPage();
    } else if (_selectedTab == 3) {
      return WorksPage();
    } else
      return ProfilePage();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Padding(
        padding: _width >= ResponsiveSize.fhdWidth
            ? const EdgeInsets.symmetric(horizontal: 200, vertical: 80)
            : (_width >= ResponsiveSize.hdWidth
                ? const EdgeInsets.symmetric(horizontal: 160, vertical: 80)
                : (_width >= ResponsiveSize.normalWidth
                    ? const EdgeInsets.symmetric(horizontal: 120, vertical: 80)
                    : (_width >= ResponsiveSize.tabWidth
                        ? const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 60)
                        : const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 40)))),
        child: _height >= 540
            ? Card(
                color: Colors.white,
                elevation: 20,
                borderOnForeground: true,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: _selectTabs(),
                      ),
                      Container(
                        height: _height >= ResponsiveSize.tabHeight
                            ? _height * 0.07
                            : _height * 0.12,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                tooltip: "Home",
                                onPressed: () {
                                  setState(() {
                                    _selectedTab = 1;
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.home,
                                  color: Colors.black87,
                                ),
                              ),
                              IconButton(
                                tooltip: "Skills",
                                onPressed: () {
                                  setState(() {
                                    _selectedTab = 2;
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.square_stack_3d_up_fill,
                                  color: Colors.black87,
                                ),
                              ),
                              IconButton(
                                tooltip: "Works",
                                onPressed: () {
                                  setState(() {
                                    _selectedTab = 3;
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.square_split_2x2_fill,
                                  color: Colors.black87,
                                ),
                              ),
                              IconButton(
                                tooltip: "Profile",
                                onPressed: () {
                                  setState(() {
                                    _selectedTab = 4;
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.profile_circled,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Text(
                    "Not available at this aspect ratio!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}