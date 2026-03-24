import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/models/launch_url.dart';
import 'package:my_portfolio/models/work.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/theme/app_typography.dart';

class ProjectCard extends StatefulWidget {
  final Work work;

  const ProjectCard({super.key, required this.work});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color:
                  _hovered ? AppColors.accent.withAlpha(127) : AppColors.border,
              width: 1,
            ),
            gradient: AppColors.cardGradient,
            boxShadow: _hovered
                ? [
                    const BoxShadow(
                      color: AppColors.accentGlow,
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover image
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        widget.work.coverImage,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppColors.card,
                          child: Icon(
                            Icons.layers_rounded,
                            color: AppColors.textMuted,
                            size: 48,
                          ),
                        ),
                      ),
                      // Category badge overlay
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.background.withAlpha(191),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.accent.withAlpha(76),
                            ),
                          ),
                          child: Text(
                            widget.work.category.toUpperCase(),
                            style: AppTypography.caption.copyWith(
                              color: AppColors.accent,
                              fontSize: 9,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.work.title,
                      style: AppTypography.heading(17),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.work.tagline,
                      style: AppTypography.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.work.tags.take(4).map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Text(
                            tag,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 10,
                              letterSpacing: 0,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    if (widget.work.githubUrl != null ||
                        widget.work.liveUrl != null ||
                        widget.work.playStoreUrl != null) ...[
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          if (widget.work.githubUrl != null)
                            _LinkButton(
                              icon: FontAwesomeIcons.github,
                              label: 'GitHub',
                              onTap: () =>
                                  MyUrl.launchURL(widget.work.githubUrl!),
                              isFontAwesome: true,
                            ),
                          if (widget.work.liveUrl != null) ...[
                            const SizedBox(width: 12),
                            _LinkButton(
                              icon: Icons.open_in_new_rounded,
                              label: 'Live',
                              onTap: () =>
                                  MyUrl.launchURL(widget.work.liveUrl!),
                              isFontAwesome: false,
                            ),
                          ],
                          if (widget.work.playStoreUrl != null) ...[
                            const SizedBox(width: 12),
                            _LinkButton(
                              icon: FontAwesomeIcons.googlePlay,
                              label: 'Play Store',
                              onTap: () =>
                                  MyUrl.launchURL(widget.work.playStoreUrl!),
                              isFontAwesome: true,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkButton extends StatefulWidget {
  // icon can be FaIconData (FontAwesome) or IconData (Material)
  final dynamic icon;
  final String label;
  final VoidCallback onTap;
  final bool isFontAwesome;

  const _LinkButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isFontAwesome,
  });

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Color color = _hovered ? AppColors.accent : AppColors.textSecondary;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.isFontAwesome)
              FaIcon(widget.icon as FaIconData, size: 12, color: color)
            else
              Icon(widget.icon as IconData, size: 14, color: color),
            const SizedBox(width: 5),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 150),
              style: AppTypography.caption.copyWith(
                color: color,
                fontSize: 12,
                letterSpacing: 0,
              ),
              child: Text(widget.label),
            ),
          ],
        ),
      ),
    );
  }
}
