import 'package:flutter/material.dart';

import '../utils/section_keys.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/benefits_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/faq_section.dart';
import '../widgets/sections/footer_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/how_it_works_section.dart';
import '../widgets/sections/nav_bar.dart';
import '../widgets/sections/testimonials_section.dart';
import '../widgets/sections/therapists_section.dart';

/// Single-page GIFT Wellness Office landing experience (web-first, responsive).
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();
  final _sectionKeys = LandingSectionKeys();
  bool _handledRouteSection = false;

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  void _scrollToId(String id) => _scrollToSection(_sectionKeys.forId(id));

  void _bookSession() => _scrollToSection(_sectionKeys.contact);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_handledRouteSection) return;
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg is! String) return;
    _handledRouteSection = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _scrollToId(arg);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 88,
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: WellnessNavBar(
              onNavigate: _scrollToId,
              onBookSession: _bookSession,
            ),
          ),
          const SliverToBoxAdapter(child: HeroSection()),
          SliverToBoxAdapter(
            child: AboutSection(sectionKey: _sectionKeys.about),
          ),
          const SliverToBoxAdapter(child: BenefitsSection()),
          SliverToBoxAdapter(
            child: TherapistsSection(sectionKey: _sectionKeys.therapists),
          ),
          SliverToBoxAdapter(
            child: TestimonialsSection(sectionKey: _sectionKeys.testimonials),
          ),
          const SliverToBoxAdapter(child: HowItWorksSection()),
          const SliverToBoxAdapter(child: FaqSection()),
          SliverToBoxAdapter(
            child: ContactSection(sectionKey: _sectionKeys.contact),
          ),
          SliverToBoxAdapter(
            child: FooterSection(onNavigate: _scrollToId),
          ),
        ],
      ),
    );
  }
}
