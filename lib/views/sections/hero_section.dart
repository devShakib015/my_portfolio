import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/models/launch_url.dart';
import 'package:my_portfolio/models/my_strings.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/theme/app_spacing.dart';
import 'package:my_portfolio/theme/app_typography.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final bool isDesktop = width >= 900;
    final double h = AppSpacing.pageH(width);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: size.height),
      color: AppColors.background,
      child: Stack(
        children: [
          // Ambient glow orbs
          Positioned(
            left: -120,
            top: size.height * 0.15,
            child: _Orb(size: 520, color: AppColors.accent.withAlpha(46)),
          ),
          Positioned(
            right: -80,
            bottom: size.height * 0.05,
            child:
                _Orb(size: 400, color: AppColors.accentSecondary.withAlpha(26)),
          ),
          // Main content
          Padding(
            padding: EdgeInsets.fromLTRB(h, 80 + 48.0, h, 60),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: _HeroText(
                          onViewWork: onViewWork,
                          onContact: onContact,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: const _HeroDecoration(),
                      ),
                    ],
                  )
                : _HeroText(onViewWork: onViewWork, onContact: onContact),
          ),
          // Scroll indicator
          const Positioned(
            bottom: 28,
            left: 0,
            right: 0,
            child: _ScrollIndicator(),
          ),
        ],
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;

  const _HeroText({required this.onViewWork, required this.onContact});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double displaySize = width >= 900 ? 62 : (width >= 600 ? 46 : 34);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Role badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.accent.withAlpha(102)),
            borderRadius: BorderRadius.circular(40),
            color: AppColors.accent.withAlpha(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: AppColors.accent, blurRadius: 6),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                MyStrings.tagLine,
                style: AppTypography.caption.copyWith(
                  color: AppColors.accent,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 200.ms)
            .slideY(begin: 0.3, end: 0, duration: 600.ms, delay: 200.ms),

        const SizedBox(height: 22),

        // Name
        Text("Hey, ${MyStrings.headLine}.",
                style: AppTypography.display(displaySize))
            .animate()
            .fadeIn(duration: 700.ms, delay: 400.ms)
            .slideY(begin: 0.3, end: 0, duration: 700.ms, delay: 400.ms),

        const SizedBox(height: 8),

        // Typewriter line
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('I ', style: AppTypography.display(displaySize)),
            DefaultTextStyle(
              style: AppTypography.display(displaySize)
                  .copyWith(color: AppColors.accent),
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 1200),
                animatedTexts: MyStrings.keywords
                    .map(
                      (k) => TypewriterAnimatedText(
                        k,
                        speed: const Duration(milliseconds: 90),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        )
            .animate()
            .fadeIn(duration: 700.ms, delay: 600.ms)
            .slideY(begin: 0.3, end: 0, duration: 700.ms, delay: 600.ms),

        const SizedBox(height: 24),

        // Tagline paragraph
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(
            'CTO of Shpper — building the future of logistics & '
            'e-commerce with Flutter, Firebase, and Cloud. Explore 6+ years '
            'of production work below.',
            style: AppTypography.body,
          ),
        )
            .animate()
            .fadeIn(duration: 700.ms, delay: 800.ms)
            .slideY(begin: 0.2, end: 0, duration: 700.ms, delay: 800.ms),

        const SizedBox(height: 36),

        // CTAs
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            _PrimaryButton(label: 'View My Work', onTap: onViewWork),
            _OutlineButton(
                label: 'GitHub',
                onTap: () => MyUrl.launchURL(
                    'https://github.com/${MyStrings.myGithub}')),
          ],
        )
            .animate()
            .fadeIn(duration: 700.ms, delay: 1000.ms)
            .slideY(begin: 0.2, end: 0, duration: 700.ms, delay: 1000.ms),

        const SizedBox(height: 40),

        // Social links
        _SocialRow().animate().fadeIn(duration: 700.ms, delay: 1200.ms),
      ],
    );
  }
}

class _HeroDecoration extends StatefulWidget {
  const _HeroDecoration();

  @override
  State<_HeroDecoration> createState() => _HeroDecorationState();
}

class _HeroDecorationState extends State<_HeroDecoration>
    with TickerProviderStateMixin {
  late final AnimationController _c1; // inner  — 8s clockwise
  late final AnimationController _c2; // middle — 14s counter-clockwise
  late final AnimationController _c3; // outer  — 22s clockwise
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _c1 = AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat();
    _c2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 14))
          ..repeat();
    _c3 =
        AnimationController(vsync: this, duration: const Duration(seconds: 22))
          ..repeat();
    _pulse = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2200))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c1.dispose();
    _c2.dispose();
    _c3.dispose();
    _pulse.dispose();
    super.dispose();
  }

  Widget _ring(double radius, double opacity) {
    final d = radius * 2;
    return Container(
      width: d,
      height: d,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.accent.withAlpha((opacity * 255).toInt()),
          width: 1,
        ),
      ),
    );
  }

  Widget _node(String label, IconData icon, Color color, double x, double y) {
    return Positioned(
      left: x - 36,
      top: y - 16,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFF0E0E1A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withAlpha(160), width: 1),
          boxShadow: [
            BoxShadow(
                color: color.withAlpha(80), blurRadius: 12, spreadRadius: 0),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 11, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9.5,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double sz = 420;
    const double cx = sz / 2;
    const double cy = sz / 2;

    return Center(
      child: SizedBox(
        width: sz,
        height: sz,
        child: AnimatedBuilder(
          animation: Listenable.merge([_c1, _c2, _c3, _pulse]),
          builder: (_, __) {
            final a1 = _c1.value * 2 * math.pi;
            final a2 = -_c2.value * 2 * math.pi; // counter-clockwise
            final a3 = _c3.value * 2 * math.pi;
            final pv = _pulse.value;

            return Stack(
              alignment: Alignment.center,
              children: [
                // Ambient radial glow
                Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      AppColors.accent.withAlpha(14),
                      Colors.transparent,
                    ]),
                  ),
                ),
                // Orbit rings
                _ring(85, 0.28),
                _ring(135, 0.18),
                _ring(172, 0.11),

                // ── Inner orbit (clockwise): Flutter, Dart ──
                _node('Flutter', Icons.phone_android_rounded, AppColors.accent,
                    cx + 85 * math.cos(a1), cy + 85 * math.sin(a1)),
                _node(
                    'Dart',
                    Icons.code_rounded,
                    AppColors.accentSecondary,
                    cx + 85 * math.cos(a1 + math.pi),
                    cy + 85 * math.sin(a1 + math.pi)),

                // ── Middle orbit (counter-clockwise): Firebase, AWS, CI/CD ──
                _node(
                    'Firebase',
                    Icons.local_fire_department_rounded,
                    const Color(0xFFFF7043),
                    cx + 135 * math.cos(a2),
                    cy + 135 * math.sin(a2)),
                _node(
                    'AWS',
                    Icons.cloud_rounded,
                    const Color(0xFFFF9800),
                    cx + 135 * math.cos(a2 + 2 * math.pi / 3),
                    cy + 135 * math.sin(a2 + 2 * math.pi / 3)),
                _node(
                    'CI/CD',
                    Icons.loop_rounded,
                    AppColors.accent,
                    cx + 135 * math.cos(a2 + 4 * math.pi / 3),
                    cy + 135 * math.sin(a2 + 4 * math.pi / 3)),

                // ── Outer orbit (clockwise): AI/ML, DevOps, GCP ──
                _node(
                    'AI / ML',
                    Icons.psychology_rounded,
                    const Color(0xFF00D4AA),
                    cx + 172 * math.cos(a3 + math.pi / 6),
                    cy + 172 * math.sin(a3 + math.pi / 6)),
                _node(
                    'DevOps',
                    Icons.settings_outlined,
                    AppColors.accentSecondary,
                    cx + 172 * math.cos(a3 + math.pi / 6 + 2 * math.pi / 3),
                    cy + 172 * math.sin(a3 + math.pi / 6 + 2 * math.pi / 3)),
                _node(
                    'GCP',
                    Icons.storage_rounded,
                    const Color(0xFF4FC3F7),
                    cx + 172 * math.cos(a3 + math.pi / 6 + 4 * math.pi / 3),
                    cy + 172 * math.sin(a3 + math.pi / 6 + 4 * math.pi / 3)),

                // ── Center node ──
                Container(
                  width: 74,
                  height: 74,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.accentGradient,
                    boxShadow: [
                      BoxShadow(
                        color:
                            AppColors.accent.withAlpha((pv * 110 + 55).toInt()),
                        blurRadius: 22 + pv * 14,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.terminal_rounded,
                        color: Colors.white, size: 28),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ).animate().fadeIn(duration: 1000.ms, delay: 600.ms).scale(
          begin: const Offset(0.82, 0.82),
          end: const Offset(1, 1),
          duration: 1000.ms,
          delay: 600.ms,
          curve: Curves.easeOutBack,
        );
  }
}

class _SocialRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socials = [
      (
        icon: FontAwesomeIcons.github,
        url: 'https://github.com/${MyStrings.myGithub}'
      ),
      (
        icon: FontAwesomeIcons.facebookF,
        url: 'https://facebook.com/${MyStrings.myFacebook}'
      ),
      (
        icon: FontAwesomeIcons.squareWhatsapp,
        url: 'https://api.whatsapp.com/send?phone=${MyStrings.myWhatsApp}'
      ),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
          socials.map((s) => _SocialIcon(icon: s.icon, url: s.url)).toList(),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final FaIconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => MyUrl.launchURL(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 10),
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color:
                _hovered ? AppColors.accent.withAlpha(38) : Colors.transparent,
            border: Border.all(
              color:
                  _hovered ? AppColors.accent.withAlpha(127) : AppColors.border,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: FaIcon(
              widget.icon,
              size: 15,
              color: _hovered ? AppColors.accent : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _Orb extends StatelessWidget {
  final double size;
  final Color color;

  const _Orb({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
        ),
      ),
    );
  }
}

class _ScrollIndicator extends StatefulWidget {
  const _ScrollIndicator();

  @override
  State<_ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<_ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..repeat(reverse: true);
    _anim = Tween<double>(begin: 0, end: 8)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _anim,
        builder: (_, child) =>
            Transform.translate(offset: Offset(0, _anim.value), child: child),
        child: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.textMuted,
          size: 24,
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 1800.ms);
  }
}

// ── Buttons ──────────────────────────────────────────────────────────────────

class _PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _PrimaryButton({required this.label, required this.onTap});

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _hovered
                ? const [
                    BoxShadow(
                      color: AppColors.accentGlow,
                      blurRadius: 24,
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: AppTypography.label.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _OutlineButton({required this.label, required this.onTap});

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color:
                  _hovered ? AppColors.accent.withAlpha(178) : AppColors.border,
              width: 1.5,
            ),
            color:
                _hovered ? AppColors.accent.withAlpha(20) : Colors.transparent,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppTypography.label.copyWith(
              color: _hovered ? AppColors.accent : AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
