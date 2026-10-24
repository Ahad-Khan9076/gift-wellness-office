import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../common/horizontal_flow_steps.dart';
import 'gift_heals_section_shell.dart';

class HealsCaseReportingSection extends StatelessWidget {
  const HealsCaseReportingSection({super.key});

  static const _steps = [
    FlowStepItem(
      step: 1,
      icon: Icons.info_outline_rounded,
      title: 'Basic Information',
      description: 'When, where, and who reported.',
    ),
    FlowStepItem(
      step: 2,
      icon: Icons.person_outline_rounded,
      title: 'Student Information',
      description: 'Confidential IDs only. No full names.',
    ),
    FlowStepItem(
      step: 3,
      icon: Icons.category_outlined,
      title: 'Nature of Problem',
      description: 'Stress, mood, academic, or other.',
    ),
    FlowStepItem(
      step: 4,
      icon: Icons.signal_cellular_alt_rounded,
      title: 'Severity Level',
      description: 'Low to crisis levels guide escalation.',
    ),
    FlowStepItem(
      step: 5,
      icon: Icons.visibility_outlined,
      title: 'Key Observations',
      description: 'Behavior, triggers, and risk signs.',
    ),
    FlowStepItem(
      step: 6,
      icon: Icons.volunteer_activism_outlined,
      title: 'Support Provided',
      description: 'PFA, resources, and referrals.',
    ),
    FlowStepItem(
      step: 7,
      icon: Icons.notes_rounded,
      title: 'Structured Notes',
      description: 'Summary and action items.',
    ),
    FlowStepItem(
      step: 8,
      icon: Icons.update_rounded,
      title: 'Status & Follow-Up',
      description: 'Open, escalated, closed, next check-in.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GiftHealsSectionShell(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          const HealsSectionTitle(
            title: 'How Case Reporting Works',
            subtitle: 'Eight blocks in order, from intake to follow-up.',
            center: true,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 28),
            decoration: BoxDecoration(
              color: AppColors.heroOrangeTint,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.accentOrange.withValues(alpha: 0.35),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.lock_rounded, color: AppColors.accentOrange),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'No full student names are ever stored.',
                    style: AppTypography.sourceSans(
                      fontWeight: FontWeight.w700,
                      color: AppColors.headingNavy,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const StaticFlowSteps(steps: _steps),
        ],
      ),
    );
  }
}
