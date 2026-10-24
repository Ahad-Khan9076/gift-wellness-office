import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../utils/responsive.dart';
import 'gift_heals_section_shell.dart';
import 'heals_card_sizes.dart';

class HealsWorkflowSection extends StatelessWidget {
  const HealsWorkflowSection({super.key});

  static const _steps = [
    (Icons.sentiment_dissatisfied_outlined, 'Student in Distress', 'A student shows signs of emotional difficulty.'),
    (Icons.badge_outlined, 'Ambassador Identification', 'A trained HEALS ambassador recognizes and responds.'),
    (Icons.medical_services_outlined, 'Psychological First Aid (PFA)', 'Immediate calm, safety, and support.'),
    (Icons.note_add_outlined, 'Case Entry into the System', 'The case is logged securely in HEALS.'),
    (Icons.settings_suggest_outlined, 'Automatic System Actions', 'Alerts, routing, and reminders are triggered.'),
    (Icons.supervisor_account_outlined, 'Supervisor Review', 'A supervisor assesses severity and next steps.'),
    (Icons.call_split_outlined, 'Escalation Decision', 'Choose continued peer support or escalation.'),
    (Icons.support_agent_outlined, 'Secondary Intervention (Non-Escalated)', 'Structured support without escalation.'),
    (Icons.hub_outlined, 'Escalated Case Collaboration Space', 'Secure space for coordinated professional care.'),
    (Icons.monitor_heart_outlined, 'Follow-Up & Monitoring', 'Check-ins until the student is stable.'),
    (Icons.task_alt_outlined, 'Case Closure', 'Case closed with documented outcomes.'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return GiftHealsSectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HealsSectionTitle(
            title: 'How HEALS Works',
            subtitle:
                'Every case follows a clear path from first contact to closure.',
          ),
          if (isMobile)
            _HorizontalWorkflow(steps: _steps)
          else
            _VerticalWorkflow(steps: _steps),
        ],
      ),
    );
  }
}

class _HorizontalWorkflow extends StatelessWidget {
  const _HorizontalWorkflow({required this.steps});

  final List<(IconData, String, String)> steps;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HealsCardSizes.workflowHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: steps.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return SizedBox(
            width: HealsCardSizes.workflowMobileWidth,
            child: _WorkflowStepCard(
              stepNumber: index + 1,
              icon: steps[index].$1,
              title: steps[index].$2,
              line: steps[index].$3,
              accent: index.isEven ? AppColors.primaryBlue : AppColors.accentOrange,
            ),
          );
        },
      ),
    );
  }
}

class _VerticalWorkflow extends StatelessWidget {
  const _VerticalWorkflow({required this.steps});

  final List<(IconData, String, String)> steps;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 16.0;
        const columns = 3;
        final itemWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (var i = 0; i < steps.length; i++)
              SizedBox(
                width: itemWidth,
                height: HealsCardSizes.workflowHeight,
                child: _WorkflowStepCard(
                  stepNumber: i + 1,
                  icon: steps[i].$1,
                  title: steps[i].$2,
                  line: steps[i].$3,
                  accent: i.isEven ? AppColors.primaryBlue : AppColors.accentOrange,
                ),
              ),
          ],
        );
      },
    );
  }
}

class _WorkflowStepCard extends StatelessWidget {
  const _WorkflowStepCard({
    required this.stepNumber,
    required this.icon,
    required this.title,
    required this.line,
    required this.accent,
  });

  final int stepNumber;
  final IconData icon;
  final String title;
  final String line;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$stepNumber',
                  style: AppTypography.sourceSans(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              const Spacer(),
              Icon(icon, color: accent, size: 24),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  height: 1.25,
                ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Text(
              line,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13,
                    height: 1.35,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
