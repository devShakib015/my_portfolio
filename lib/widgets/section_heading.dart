import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/theme/app_typography.dart';

class SectionHeading extends StatelessWidget {
  final String label;
  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;

  const SectionHeading({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          label.toUpperCase(),
          style: AppTypography.caption.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 10),
        Text(title, style: AppTypography.heading(36)),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          Text(subtitle!, style: AppTypography.body),
        ],
      ],
    );
  }
}
