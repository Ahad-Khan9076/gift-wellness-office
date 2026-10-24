import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../utils/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  static const _quote =
      'You don\'t have to control your thoughts. You just have to stop letting them control you.';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;
    final quoteSize = isMobile ? 18.0 : 22.0;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFEEF4FF),
            AppColors.heroOrangeTint,
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
              isMobile ? 40 : 56,
              context.sectionHorizontalPadding,
              isMobile ? 44 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Wellness Care Centre',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontSize: isMobile ? 34 : 46,
                    letterSpacing: -0.5,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.06, end: 0),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: isMobile ? 340 : 640),
                  child: Column(
                    children: [
                      Text(
                        '“$_quote”',
                        textAlign: TextAlign.center,
                        style: AppTypography.loraQuote(fontSize: quoteSize),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Dan Millman',
                        textAlign: TextAlign.center,
                        style: AppTypography.sourceSans(
                          fontSize: isMobile ? 14 : 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryBlue,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 120.ms, duration: 500.ms),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: _trustBadges(theme),
                ).animate().fadeIn(delay: 220.ms, duration: 500.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _trustBadges(ThemeData theme) {
    const badges = [
      '100% Confidential',
      'Professional Therapists',
      'On-Campus & Convenient',
    ];
    return badges
        .map(
          (b) => Chip(
            label: Text(b),
            labelStyle: AppTypography.sourceSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.headingNavy,
            ),
            backgroundColor: AppColors.white,
            side: const BorderSide(color: AppColors.cardBorder),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          ),
        )
        .toList();
  }
}
