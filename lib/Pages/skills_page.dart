import 'package:flutter/material.dart';
import 'package:my_portfolio/Models/my_skills.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.extent(
          physics: BouncingScrollPhysics(),
          maxCrossAxisExtent: 350,
          children: MySkills.all
              .map(
                (skill) => Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 30,
                    color: Colors.white,
                    shadowColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GridTile(
                      header: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            skill.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      footer: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: LinearPercentIndicator(
                            lineHeight: 20,
                            animation: true,
                            animationDuration: 1000,
                            curve: Curves.easeInOutExpo,
                            center: Text(
                              "${skill.progress}%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            percent: skill.progress / 100,
                            backgroundColor: Colors.black12,
                            progressColor: Colors.black54,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(64.0),
                        child: Image.asset(skill.image),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
