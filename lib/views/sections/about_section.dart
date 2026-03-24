import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/models/my_images.dart';
import 'package:my_portfolio/models/my_strings.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/theme/app_spacing.dart';
import 'package:my_portfolio/theme/app_typography.dart';
import 'package:my_portfolio/widgets/gradient_text.dart';
import 'package:my_portfolio/widgets/section_heading.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isDesktop = width >= 900;
    final double h = AppSpacing.pageH(width);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding:
          EdgeInsets.symmetric(horizontal: h, vertical: AppSpacing.sectionV),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 55,
                  child: _AboutText()
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .slideX(begin: -0.1, end: 0, duration: 700.ms),
                ),
                const SizedBox(width: 64),
                Expanded(
                  flex: 45,
                  child: _ProfileImageWidget()
                      .animate()
                      .fadeIn(duration: 700.ms, delay: 200.ms)
                      .slideX(
                          begin: 0.1, end: 0, duration: 700.ms, delay: 200.ms),
                ),
              ],
            )
          : Column(
              children: [
                _ProfileImageWidget().animate().fadeIn(duration: 700.ms),
                const SizedBox(height: 40),
                _AboutText().animate().fadeIn(duration: 700.ms),
              ],
            ),
    );
  }
}

class _AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          label: 'About Me',
          title: 'Crafting digital\nproducts with passion.',
        ),
        const SizedBox(height: 24),
        Text(MyStrings.myDescription, style: AppTypography.body),
        const SizedBox(height: 36),
        const Wrap(
          spacing: 40,
          runSpacing: 20,
          children: [
            _Stat(value: '6+', label: 'Years\nExperience'),
            _Stat(value: '20+', label: 'Projects\nDelivered'),
            _Stat(value: '27+', label: 'Technologies'),
          ],
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          text: value,
          style: AppTypography.heading(40),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTypography.caption.copyWith(
            color: AppColors.textMuted,
            letterSpacing: 0.5,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _ProfileImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        height: 340,
        child: Stack(
          children: [
            Positioned(
              bottom: -16,
              right: -16,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.accentGlow,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Gradient border frame
            Container(
              width: 300,
              height: 340,
              decoration: BoxDecoration(
                gradient: AppColors.accentGradient,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(2.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  MyImages.myProfileImage,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppColors.card,
                    child: const Icon(
                      Icons.person_rounded,
                      color: AppColors.textMuted,
                      size: 80,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
