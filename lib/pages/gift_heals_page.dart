import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../routes/app_routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/responsive.dart';
import '../utils/landing_section_id.dart';
import '../widgets/gift_heals/heals_about_section.dart';
import '../widgets/gift_heals/heals_benefits_section.dart';
import '../widgets/gift_heals/heals_case_reporting_section.dart';
import '../widgets/gift_heals/heals_cta_section.dart';
import '../widgets/gift_heals/heals_workflow_section.dart';
import '../widgets/sections/nav_bar.dart';

class GiftHealsPage extends StatelessWidget {
  const GiftHealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;

    return Scaffold(
      backgroundColor: AppColors.backgroundSoft,
      body: CustomScrollView(
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
              isGiftHealsPage: true,
              onNavigate: (id) => AppRoutes.openHomeSection(context, id),
              onBookSession: () => AppRoutes.openHomeSection(
                context,
                LandingSectionId.contact,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _HeroBlock(isMobile: isMobile, theme: theme),
          ),
          const SliverToBoxAdapter(child: HealsAboutSection()),
          const SliverToBoxAdapter(child: HealsWorkflowSection()),
          const SliverToBoxAdapter(child: HealsCaseReportingSection()),
          const SliverToBoxAdapter(child: HealsBenefitsSection()),
          const SliverToBoxAdapter(child: HealsCtaSection()),
        ],
      ),
    );
  }
}

class _HeroBlock extends StatelessWidget {
  const _HeroBlock({required this.isMobile, required this.theme});

  final bool isMobile;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8F5F3),
            Color(0xFFEEF4FF),
            AppColors.white,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.contentMaxWidth),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              context.sectionHorizontalPadding,
              isMobile ? 36 : 56,
              context.sectionHorizontalPadding,
              isMobile ? 40 : 56,
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.healing_rounded,
                        size: 18,
                        color: AppColors.calmingGreen,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Society for Health • GIFT University',
                        style: AppTypography.sourceSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryBlue,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 450.ms),
                const SizedBox(height: 24),
                Text(
                  'GIFT HEALS',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontSize: isMobile ? 38 : 52,
                    color: AppColors.primaryBlue,
                  ),
                ).animate().fadeIn(delay: 80.ms, duration: 500.ms),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Text(
                    'Structured peer support so every student is seen, supported, and safe.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                ).animate().fadeIn(delay: 160.ms, duration: 500.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
