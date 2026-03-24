import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/models/my_skills.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/theme/app_spacing.dart';
import 'package:my_portfolio/widgets/section_heading.dart';
import 'package:my_portfolio/widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double h = AppSpacing.pageH(width);

    return Container(
      color: AppColors.surface,
      padding:
          EdgeInsets.symmetric(horizontal: h, vertical: AppSpacing.sectionV),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            label: 'Skills',
            title: 'Technical Expertise',
            subtitle:
                'Tools, languages, and frameworks I use to bring ideas to life.',
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.2, end: 0, duration: 600.ms),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              final w = constraints.maxWidth;
              final cols = w >= 1000 ? 4 : (w >= 680 ? 3 : 2);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 90,
                ),
                itemCount: MySkills.all.length,
                itemBuilder: (context, i) {
                  return SkillCard(skill: MySkills.all[i])
                      .animate()
                      .fadeIn(
                          duration: 500.ms,
                          delay: Duration(milliseconds: i * 35))
                      .slideY(
                          begin: 0.2,
                          end: 0,
                          duration: 500.ms,
                          delay: Duration(milliseconds: i * 35));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
