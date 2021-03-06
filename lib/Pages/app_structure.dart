import 'dart:math';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Models/my_colors.dart';
import 'package:my_portfolio/Models/my_images.dart';
import 'package:my_portfolio/Models/responsive_size.dart';
import 'package:my_portfolio/Pages/home_page.dart';
import 'package:my_portfolio/Pages/profile_page.dart';
import 'package:my_portfolio/Pages/skills_page.dart';
import 'package:my_portfolio/Pages/works_page.dart';
import 'package:shimmer/shimmer.dart';

class AppStructure extends StatefulWidget {
  @override
  _AppStructureState createState() => _AppStructureState();
}

class _AppStructureState extends State<AppStructure> {
  int _selectedTab = 1;
  int _selectedBg = Random().nextInt(MyColors.bgColors.length);

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
      //Backgroud Color
      backgroundColor: MyColors.bgColors[_selectedBg],
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInBack,
            width: _width,
            height: _height,
            color: MyColors.bgColors[_selectedBg],
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: _width >= ResponsiveSize.tabWidth
                    ? EdgeInsets.only(bottom: 25)
                    : EdgeInsets.only(bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(
                      period: Duration(seconds: 2),
                      baseColor: Colors.white,
                      highlightColor:
                          MyColors.bgColors[_selectedBg].withAlpha(200),
                      child: Text(
                        "Built Using Flutter With Love",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          wordSpacing: 2,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        MyImages.loveImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: _width >= ResponsiveSize.fhdWidth
                ? const EdgeInsets.symmetric(horizontal: 200, vertical: 80)
                : (_width >= ResponsiveSize.hdWidth
                    ? const EdgeInsets.symmetric(horizontal: 160, vertical: 80)
                    : (_width >= ResponsiveSize.normalWidth
                        ? const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 80)
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 10),
                            child: Align(
                              alignment: _width >= ResponsiveSize.tabWidth
                                  ? Alignment.centerRight
                                  : Alignment.center,
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                runAlignment: WrapAlignment.end,
                                children: MyColors.bgColors
                                    .map(
                                      (color) => MaterialButton(
                                        padding: EdgeInsets.zero,
                                        minWidth: 30,
                                        height: 18,
                                        onPressed: () {
                                          setState(() {
                                            _selectedBg = MyColors.bgColors
                                                .indexOf(color);
                                          });
                                        },
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            color: color,
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            // child: _selectTabs(),
                            child: PageTransitionSwitcher(
                              duration: Duration(seconds: 1),
                              transitionBuilder: (child, primaryAnimation,
                                      secondaryAnimation) =>
                                  FadeThroughTransition(
                                fillColor: Colors.transparent,
                                animation: primaryAnimation,
                                secondaryAnimation: secondaryAnimation,
                                child: child,
                              ),
                              child: _selectTabs(),
                            ),
                          ),
                          Container(
                            height: _height >= ResponsiveSize.tabHeight
                                ? _height * 0.09
                                : _height * 0.12,
                            width:
                                _width >= ResponsiveSize.tabWidth ? 300 : null,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    tooltip: "Home",
                                    onPressed: () {
                                      setState(() {
                                        _selectedTab = 1;
                                        _selectedBg = Random()
                                            .nextInt(MyColors.bgColors.length);
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
                                        _selectedBg = Random()
                                            .nextInt(MyColors.bgColors.length);
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
                                        _selectedBg = Random()
                                            .nextInt(MyColors.bgColors.length);
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
                                        _selectedBg = Random()
                                            .nextInt(MyColors.bgColors.length);
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
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
