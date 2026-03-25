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

  void _openScreenshots(BuildContext context) {
    if (widget.work.screenshots.isEmpty) return;
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (_) => _ScreenshotsDialog(
        title: widget.work.title,
        screenshots: widget.work.screenshots,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _openScreenshots(context),
        child: MouseRegion(
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
                  color: _hovered
                      ? AppColors.accent.withAlpha(127)
                      : AppColors.border,
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
                                  onTap: () => MyUrl.launchURL(
                                      widget.work.playStoreUrl!),
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
        ));
  }
}

// ── Screenshots Dialog ────────────────────────────────────────────────────────

class _ScreenshotsDialog extends StatefulWidget {
  final String title;
  final List<String> screenshots;
  const _ScreenshotsDialog({required this.title, required this.screenshots});

  @override
  State<_ScreenshotsDialog> createState() => _ScreenshotsDialogState();
}

class _ScreenshotsDialogState extends State<_ScreenshotsDialog> {
  late final PageController _ctrl;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = PageController(viewportFraction: 0.7);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _go(int delta) {
    final next = _index + delta;
    if (next >= 0 && next < widget.screenshots.length) {
      _ctrl.animateToPage(next,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool multi = widget.screenshots.length > 1;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 860, maxHeight: 660),
        decoration: BoxDecoration(
          color: const Color(0xFF0D0D16),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.accent.withAlpha(76)),
          boxShadow: [
            BoxShadow(
                color: AppColors.accent.withAlpha(38),
                blurRadius: 40,
                spreadRadius: 4),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 18, 16, 4),
              child: Row(
                children: [
                  Text(widget.title, style: AppTypography.heading(20)),
                  const Spacer(),
                  if (multi)
                    Text('${_index + 1} / ${widget.screenshots.length}',
                        style: AppTypography.caption
                            .copyWith(color: AppColors.textSecondary)),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: Colors.white70),
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white12,
                        shape: const CircleBorder()),
                  ),
                ],
              ),
            ),
            // Carousel
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView.builder(
                      controller: _ctrl,
                      itemCount: widget.screenshots.length,
                      onPageChanged: (i) => setState(() => _index = i),
                      itemBuilder: (context, i) {
                        final active = i == _index;
                        return AnimatedScale(
                          scale: active ? 1.0 : 0.82,
                          duration: const Duration(milliseconds: 250),
                          child: Center(
                            child: Container(
                              width: 195,
                              height: 410,
                              decoration: BoxDecoration(
                                color: const Color(0xFF222222),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                    color: const Color(0xFF222222), width: 10),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.accent.withAlpha(51),
                                      blurRadius: 28,
                                      spreadRadius: 2),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  widget.screenshots[i],
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) =>
                                      const ColoredBox(
                                    color: Colors.white10,
                                    child: Center(
                                        child: Icon(Icons.image_not_supported,
                                            color: Colors.white38, size: 40)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    if (multi) ...[
                      Positioned(
                        left: 4,
                        child: IconButton(
                          onPressed: _index > 0 ? () => _go(-1) : null,
                          icon: Icon(Icons.chevron_left,
                              color: _index > 0 ? Colors.white : Colors.white24,
                              size: 28),
                          style: IconButton.styleFrom(
                              backgroundColor: _index > 0
                                  ? Colors.white12
                                  : Colors.transparent,
                              shape: const CircleBorder()),
                        ),
                      ),
                      Positioned(
                        right: 4,
                        child: IconButton(
                          onPressed: _index < widget.screenshots.length - 1
                              ? () => _go(1)
                              : null,
                          icon: Icon(Icons.chevron_right,
                              color: _index < widget.screenshots.length - 1
                                  ? Colors.white
                                  : Colors.white24,
                              size: 28),
                          style: IconButton.styleFrom(
                              backgroundColor:
                                  _index < widget.screenshots.length - 1
                                      ? Colors.white12
                                      : Colors.transparent,
                              shape: const CircleBorder()),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            // Dots
            if (multi)
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.screenshots.length, (i) {
                    final active = i == _index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: active ? 18 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: active ? AppColors.accent : Colors.white24,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
              ),
          ],
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
