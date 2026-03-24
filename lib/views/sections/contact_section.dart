import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/models/launch_url.dart';
import 'package:my_portfolio/models/my_strings.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/theme/app_spacing.dart';
import 'package:my_portfolio/theme/app_typography.dart';
import 'package:my_portfolio/widgets/section_heading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double h = AppSpacing.pageH(width);

    return Container(
      color: AppColors.surface,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(h, AppSpacing.sectionV, h, 40),
      child: Column(
        children: [
          const SectionHeading(
            label: 'Contact',
            title: "Let's work together.",
            subtitle:
                "Have a project in mind? I'd love to hear about it.\nDrop me a message and let's create something great.",
            alignment: CrossAxisAlignment.center,
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.2, end: 0, duration: 600.ms),
          const SizedBox(height: 52),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: MyStrings.contactButtons
                .map((btn) => _ContactCard(button: btn))
                .toList(),
          ).animate().fadeIn(duration: 600.ms, delay: 300.ms),
          const SizedBox(height: 80),
          Divider(color: AppColors.border.withAlpha(128), thickness: 1),
          const SizedBox(height: 24),
          Text(
            '© 2025 K M Shahriar Hossain  ·  Built with Flutter  ❤',
            style: AppTypography.caption.copyWith(
              color: AppColors.textMuted,
              fontSize: 12,
              letterSpacing: 0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final Map<String, dynamic> button;

  const _ContactCard({required this.button});

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final dynamic iconRaw = widget.button['icon'];
    final bool isFontAwesome = iconRaw is FaIconData;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => MyUrl.launchURL(widget.button['url'] as String),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 140,
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color:
                  _hovered ? AppColors.accent.withAlpha(127) : AppColors.border,
            ),
            color: _hovered ? AppColors.accent.withAlpha(20) : AppColors.card,
          ),
          child: Column(
            children: [
              isFontAwesome
                  ? FaIcon(
                      iconRaw,
                      color:
                          _hovered ? AppColors.accent : AppColors.textSecondary,
                      size: 22,
                    )
                  : Icon(
                      // dynamic is already assignable to IconData
                      iconRaw,
                      color:
                          _hovered ? AppColors.accent : AppColors.textSecondary,
                      size: 24,
                    ),
              const SizedBox(height: 10),
              Text(
                widget.button['tooltip'] as String? ?? '',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                  letterSpacing: 0,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
