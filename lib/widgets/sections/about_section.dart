import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../utils/responsive.dart';
import '../common/section_shell.dart';
import '../common/soft_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  static const _treatments = [
    (
      Icons.wb_cloudy_outlined,
      Color(0xFF6366F1),
      'Depression & Mood Disorders',
      'Overcoming persistent sadness, hopelessness, lack of motivation, and emotional numbness.',
    ),
    (
      Icons.air_outlined,
      Color(0xFF0D9488),
      'Anxiety, Stress & Panic',
      'Managing academic pressure, social anxiety, chronic stress, and sudden panic attacks.',
    ),
    (
      Icons.favorite_outline_rounded,
      Color(0xFF0033A0),
      'Suicidal Ideation & Crisis Support',
      'Providing urgent, non-judgmental assistance and hope during your darkest moments.',
    ),
    (
      Icons.spa_outlined,
      Color(0xFF7C3AED),
      'Trauma & Emotional Distress',
      'Processing past trauma, grief, loss, and overwhelming life transitions.',
    ),
    (
      Icons.auto_awesome_outlined,
      Color(0xFFFF6A00),
      'Personal & Interpersonal Growth',
      'Improving self-esteem, emotional regulation, relationships, and coping strategies.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;
    final isWide = context.screenWidth >= Breakpoints.tablet;

    return SectionShell(
      sectionKey: sectionKey,
      backgroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'What is the Wellness Center?',
            center: false,
          ),
          _IntroPanel(isWide: isWide, theme: theme),
          const SizedBox(height: 56),
          Text(
            'What We Treat & Support',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontSize: isMobile ? 26 : 28,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'We provide expert care and evidence-based interventions for a wide range of psychological conditions and personal concerns, including:',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = isMobile ? 1 : (isWide ? 2 : 1);
              final spacing = 20.0;
              final itemWidth =
                  (constraints.maxWidth - spacing * (columns - 1)) / columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: _treatments.map((t) {
                  return SizedBox(
                    width: columns == 1 ? double.infinity : itemWidth,
                    child: _TreatmentCard(
                      icon: t.$1,
                      accent: t.$2,
                      title: t.$3,
                      description: t.$4,
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 28,
              vertical: isMobile ? 20 : 24,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundSoft,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.volunteer_activism_rounded,
                  color: AppColors.calmingGreen,
                  size: isMobile ? 28 : 32,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Seeking help is a sign of strength. You deserve care that is compassionate, confidential, and professional.',
                    style: AppTypography.sourceSans(
                      fontSize: isMobile ? 15 : 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.headingNavy,
                      height: 1.55,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IntroPanel extends StatelessWidget {
  const _IntroPanel({required this.isWide, required this.theme});

  final bool isWide;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The Wellness Center is a dedicated mental health sanctuary designed to support both GIFT University students and members of the broader community. We offer a safe, confidential, and professional environment where individuals can address life\'s challenges, navigate emotional struggles, and receive evidence-based therapeutic care.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Text(
          'Mental health is just as important as physical health. Whether you are struggling with academic stress, personal life challenges, or clinical mental health conditions, our team of qualified and compassionate therapists is here to walk alongside you on your journey toward recovery and personal growth.',
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );

    if (!isWide) {
      return SoftCard(
        padding: const EdgeInsets.all(24),
        child: body,
      );
    }

    return SoftCard(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 120,
            margin: const EdgeInsets.only(top: 4, right: 28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primaryBlue, AppColors.calmingGreen],
              ),
            ),
          ),
          Expanded(child: body),
          const SizedBox(width: 32),
          SizedBox(
            width: 220,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryBlue.withValues(alpha: 0.08),
                        AppColors.heroOrangeTint,
                      ],
                    ),
                    border: Border.all(
                      color: AppColors.primaryBlue.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryBlue.withValues(alpha: 0.1),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.self_improvement_rounded,
                          color: AppColors.primaryBlue,
                          size: 36,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Safe • Confidential • Professional',
                        textAlign: TextAlign.center,
                        style: AppTypography.sourceSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryBlue,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TreatmentCard extends StatelessWidget {
  const _TreatmentCard({
    required this.icon,
    required this.accent,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final Color accent;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SoftCard(
      padding: const EdgeInsets.all(22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: accent, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(description, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
