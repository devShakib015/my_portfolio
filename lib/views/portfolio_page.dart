import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/views/sections/about_section.dart';
import 'package:my_portfolio/views/sections/contact_section.dart';
import 'package:my_portfolio/views/sections/hero_section.dart';
import 'package:my_portfolio/views/sections/skills_section.dart';
import 'package:my_portfolio/views/sections/works_section.dart';
import 'package:my_portfolio/widgets/marquee_strip.dart';
import 'package:my_portfolio/widgets/navbar.dart';
import 'package:my_portfolio/models/my_strings.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollController = ScrollController();
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _worksKey = GlobalKey();
  final _contactKey = GlobalKey();

  NavSection _activeSection = NavSection.hero;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateActiveSection);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_updateActiveSection)
      ..dispose();
    super.dispose();
  }

  void _updateActiveSection() {
    if (!mounted) return;
    const double threshold = 120;

    final entries = [
      (NavSection.hero, _heroKey),
      (NavSection.about, _aboutKey),
      (NavSection.skills, _skillsKey),
      (NavSection.works, _worksKey),
      (NavSection.contact, _contactKey),
    ];

    NavSection active = NavSection.hero;
    for (final (section, key) in entries) {
      final ctx = key.currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;
      final dy = box.localToGlobal(Offset.zero).dy;
      if (dy <= threshold) active = section;
    }

    if (active != _activeSection) {
      setState(() => _activeSection = active);
    }
  }

  void _scrollToSection(NavSection section) {
    final keyMap = {
      NavSection.hero: _heroKey,
      NavSection.about: _aboutKey,
      NavSection.skills: _skillsKey,
      NavSection.works: _worksKey,
      NavSection.contact: _contactKey,
    };

    final key = keyMap[section];
    if (key?.currentContext == null) return;

    final box = key!.currentContext!.findRenderObject() as RenderBox?;
    if (box == null) return;

    final targetOffset =
        (_scrollController.offset + box.localToGlobal(Offset.zero).dy - 80)
            .clamp(0.0, _scrollController.position.maxScrollExtent);

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroSection(
                  key: _heroKey,
                  onViewWork: () => _scrollToSection(NavSection.works),
                  onContact: () => _scrollToSection(NavSection.contact),
                ),
                MarqueeStrip(items: MyStrings.homePageMainContents),
                AboutSection(key: _aboutKey),
                SkillsSection(key: _skillsKey),
                WorksSection(key: _worksKey),
                ContactSection(key: _contactKey),
              ],
            ),
          ),
          Navbar(
            scrollController: _scrollController,
            activeSection: _activeSection,
            onNavTap: _scrollToSection,
          ),
        ],
      ),
    );
  }
}
