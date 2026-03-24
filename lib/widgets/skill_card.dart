import 'package:flutter/material.dart';
import 'package:my_portfolio/models/skill.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/theme/app_typography.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;

  const SkillCard({super.key, required this.skill});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _progressAnim;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    _progressAnim = Tween<double>(
      begin: 0,
      end: widget.skill.progress / 100,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                _hovered ? AppColors.accent.withAlpha(100) : AppColors.border,
            width: 1,
          ),
          color: _hovered ? AppColors.card : const Color(0xFF141420),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 26,
                  height: 26,
                  child: Image.asset(
                    widget.skill.image,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.code_rounded,
                      color: AppColors.accent,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.skill.title,
                    style: AppTypography.label.copyWith(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                AnimatedBuilder(
                  animation: _progressAnim,
                  builder: (_, __) => Text(
                    '${(_progressAnim.value * 100).round()}%',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.accent,
                      fontSize: 11,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: _progressAnim,
              builder: (_, __) => ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: LinearProgressIndicator(
                  value: _progressAnim.value,
                  backgroundColor: AppColors.border,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.accent,
                  ),
                  minHeight: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
