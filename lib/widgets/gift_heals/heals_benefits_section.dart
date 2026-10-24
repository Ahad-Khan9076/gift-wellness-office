import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../utils/responsive.dart';
import 'gift_heals_section_shell.dart';
import 'heals_card_sizes.dart';

class HealsBenefitsSection extends StatelessWidget {
  const HealsBenefitsSection({super.key});

  static const _benefits = [
    (Icons.all_inclusive_rounded, AppColors.primaryBlue, 'No case is missed', 'Every report enters the HEALS pipeline.'),
    (Icons.timelapse_rounded, AppColors.calmingGreen, 'Early intervention', 'Support starts at the first sign of distress.'),
    (Icons.account_tree_outlined, AppColors.secondaryBlue, 'Structured support', 'Clear steps from PFA to closure.'),
    (Icons.fact_check_outlined, AppColors.accentOrange, 'Accountability', 'Supervisors review every decision point.'),
    (Icons.groups_2_outlined, AppColors.primaryBlue, 'Safe collaboration', 'Escalated cases use a secure shared space.'),
    (Icons.trending_up_rounded, AppColors.calmingGreen, 'Continuous improvement', 'Data informs training and outreach.'),
    (Icons.lock_person_outlined, AppColors.accentOrange, 'Student confidentiality', 'Privacy by design. No full names stored.'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final columns = isMobile ? 1 : (context.isTablet ? 2 : 3);

    return GiftHealsSectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HealsSectionTitle(
            title: 'Why HEALS Matters',
            subtitle: 'Seven pillars that protect students and strengthen care.',
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final spacing = 16.0;
              final itemWidth =
                  (constraints.maxWidth - spacing * (columns - 1)) / columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  for (var i = 0; i < _benefits.length; i++)
                    SizedBox(
                      width: columns == 1 ? double.infinity : itemWidth,
                      height: isMobile ? null : HealsCardSizes.benefitHeight,
                      child: _BenefitCard(
                        icon: _benefits[i].$1,
                        accent: _benefits[i].$2,
                        title: _benefits[i].$3,
                        line: _benefits[i].$4,
                        index: i + 1,
                        stretch: !isMobile,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BenefitCard extends StatelessWidget {
  const _BenefitCard({
    required this.icon,
    required this.accent,
    required this.title,
    required this.line,
    required this.index,
    required this.stretch,
  });

  final IconData icon;
  final Color accent;
  final String title;
  final String line;
  final int index;
  final bool stretch;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: stretch ? double.infinity : null,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.07),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: accent, size: 26),
              ),
              const Spacer(),
              Text(
                index.toString().padLeft(2, '0'),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: accent.withValues(alpha: 0.2),
                      fontSize: 28,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          if (stretch)
            Expanded(
              child: Text(
                line,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          else
            Text(line, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
