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
                'Flutter Developer  ·  CTO',
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
        Text("Hey, I'm Shakib.", style: AppTypography.display(displaySize))
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
            'CTO & co-founder building digital products with Flutter. '
            '6+ years crafting mobile, web, and cross-platform experiences '
            'that are fast, beautiful, and maintainable.',
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
            _OutlineButton(label: "Let's Talk", onTap: onContact),
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

class _HeroDecoration extends StatelessWidget {
  const _HeroDecoration();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 340,
        height: 340,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 310,
              height: 310,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withAlpha(38),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Container(
              width: 270,
              height: 270,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.accent.withAlpha(51),
                  width: 1.5,
                ),
              ),
            ),
            Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.accentSecondary.withAlpha(38),
                  width: 1,
                ),
              ),
            ),
            // Center glowing icon
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.accentGradient,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.accentGlow,
                    blurRadius: 32,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.code_rounded,
                  color: Colors.white,
                  size: 42,
                ),
              ),
            ),
          ],
        ),
      ).animate().fadeIn(duration: 1000.ms, delay: 600.ms).scale(
            begin: const Offset(0.82, 0.82),
            end: const Offset(1, 1),
            duration: 1000.ms,
            delay: 600.ms,
            curve: Curves.easeOutBack,
          ),
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
