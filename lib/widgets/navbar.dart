import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/theme/app_spacing.dart';
import 'package:my_portfolio/theme/app_typography.dart';

enum NavSection { hero, about, skills, works, contact }

class Navbar extends StatefulWidget {
  final ScrollController scrollController;
  final NavSection activeSection;
  final void Function(NavSection) onNavTap;

  const Navbar({
    super.key,
    required this.scrollController,
    required this.activeSection,
    required this.onNavTap,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _scrolled = false;
  bool _mobileMenuOpen = false;

  static const _items = [
    (label: 'Home', section: NavSection.hero),
    (label: 'About', section: NavSection.about),
    (label: 'Skills', section: NavSection.skills),
    (label: 'Works', section: NavSection.works),
    (label: 'Contact', section: NavSection.contact),
  ];

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 50;
    if (scrolled != _scrolled) setState(() => _scrolled = scrolled);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isDesktop = width >= 768;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                height: 72,
                decoration: BoxDecoration(
                  color: _scrolled
                      ? AppColors.surface.withAlpha(220)
                      : Colors.transparent,
                  border: _scrolled
                      ? const Border(
                          bottom: BorderSide(
                            color: AppColors.border,
                            width: 1,
                          ),
                        )
                      : null,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.pageH(width),
                ),
                child: Row(
                  children: [
                    _Logo(),
                    const Spacer(),
                    if (isDesktop)
                      Row(
                        children: _items.map((item) {
                          return _NavLink(
                            label: item.label,
                            isActive: widget.activeSection == item.section,
                            onTap: () => widget.onNavTap(item.section),
                          );
                        }).toList(),
                      )
                    else
                      IconButton(
                        onPressed: () =>
                            setState(() => _mobileMenuOpen = !_mobileMenuOpen),
                        icon: Icon(
                          _mobileMenuOpen
                              ? Icons.close_rounded
                              : Icons.menu_rounded,
                          color: AppColors.textPrimary,
                          size: 24,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (!isDesktop && _mobileMenuOpen)
            Container(
              color: AppColors.surface.withAlpha(248),
              child: Column(
                children: _items.map((item) {
                  return ListTile(
                    title: Text(
                      item.label,
                      style: AppTypography.label.copyWith(
                        color: widget.activeSection == item.section
                            ? AppColors.accent
                            : AppColors.textSecondary,
                      ),
                    ),
                    onTap: () {
                      setState(() => _mobileMenuOpen = false);
                      widget.onNavTap(item.section);
                    },
                  );
                }).toList(),
              ),
            )
                .animate()
                .fadeIn(duration: 200.ms)
                .slideY(begin: -0.05, end: 0, duration: 200.ms),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 200.ms);
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'dev',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          TextSpan(
            text: 'Shakib',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final bool highlight = widget.isActive || _hovered;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppTypography.navLink.copyWith(
              color: highlight ? AppColors.accent : AppColors.textSecondary,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
