import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Custom%20Things/custom_colors.dart';
import 'package:my_portfolio/Pages/home_page.dart';
import 'package:my_portfolio/Pages/profile_page.dart';
import 'package:my_portfolio/Pages/skills_page.dart';
import 'package:my_portfolio/Pages/works_page.dart';

class AppDesign extends StatefulWidget {
  @override
  _AppDesignState createState() => _AppDesignState();
}

class _AppDesignState extends State<AppDesign> {
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
        padding: _width >= 1000
            ? const EdgeInsets.all(80)
            : const EdgeInsets.all(30),
        child: Card(
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
                  height: _height >= 700 ? _height * 0.1 : _height * 0.15,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
