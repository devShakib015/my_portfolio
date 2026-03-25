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
          title: 'Engineering at scale,\nleading with vision.',
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

class _ProfileImageWidget extends StatefulWidget {
  @override
  State<_ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<_ProfileImageWidget>
    with TickerProviderStateMixin {
  late final AnimationController _floatCtrl;
  late final AnimationController _glowCtrl;
  late final Animation<double> _floatAnim;
  late final Animation<double> _glowAnim;

  @override
  void initState() {
    super.initState();
    _floatCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);

    _glowCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);

    _floatAnim = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: _floatCtrl, curve: Curves.easeInOut),
    );
    _glowAnim = Tween<double>(begin: 0.4, end: 0.85).animate(
      CurvedAnimation(parent: _glowCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatCtrl.dispose();
    _glowCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: Listenable.merge([_floatAnim, _glowAnim]),
        builder: (_, __) {
          return Transform.translate(
            offset: Offset(0, _floatAnim.value),
            child: SizedBox(
              width: 440,
              height: 500,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Soft background glow
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: 340,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accent
                                .withAlpha((_glowAnim.value * 100).toInt()),
                            blurRadius: 80,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Gradient border frame
                  Container(
                    width: 390,
                    height: 460,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.accent
                              .withAlpha((_glowAnim.value * 200).toInt()),
                          AppColors.accentSecondary
                              .withAlpha((_glowAnim.value * 120).toInt()),
                          AppColors.accent.withAlpha(20),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(27),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Profile image
                          Image.asset(
                            MyImages.myProfileImage,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: AppColors.card,
                              child: const Icon(Icons.person_rounded,
                                  color: AppColors.textMuted, size: 120),
                            ),
                          ),
                          // Subtle dark overlay — bottom-up gradient
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withAlpha(30),
                                    Colors.black.withAlpha(110),
                                  ],
                                  stops: const [0.5, 1.0],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
