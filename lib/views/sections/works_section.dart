import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/models/my_works.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/theme/app_spacing.dart';
import 'package:my_portfolio/widgets/project_card.dart';
import 'package:my_portfolio/widgets/section_heading.dart';

class WorksSection extends StatelessWidget {
  const WorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double h = AppSpacing.pageH(width);

    return Container(
      color: AppColors.background,
      padding:
          EdgeInsets.symmetric(horizontal: h, vertical: AppSpacing.sectionV),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            label: 'Works',
            title: 'Selected Projects',
            subtitle: 'A selection of my recent work. More on GitHub.',
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.2, end: 0, duration: 600.ms),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              final w = constraints.maxWidth;
              final cols = w >= 1100 ? 3 : (w >= 700 ? 2 : 1);
              final spacing = 20.0;
              final cardWidth = (w - (cols - 1) * spacing) / cols;
              // image is 16:10, content below is ~200px
              final imageH = cardWidth * (10 / 16);
              final cardH = imageH + 200;
              final aspectRatio = cardWidth / cardH;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: aspectRatio,
                ),
                itemCount: MyWorks.all.length,
                itemBuilder: (context, i) {
                  return ProjectCard(work: MyWorks.all[i])
                      .animate()
                      .fadeIn(
                          duration: 500.ms,
                          delay: Duration(milliseconds: i * 80))
                      .slideY(
                          begin: 0.12,
                          end: 0,
                          duration: 500.ms,
                          delay: Duration(milliseconds: i * 80));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
