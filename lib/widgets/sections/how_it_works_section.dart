import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../utils/responsive.dart';
import '../common/section_shell.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  static const _steps = [
    (1, Icons.touch_app_outlined, 'Reach Out / Book Appointment', 'Message us or book online — we’ll respond with care and discretion.'),
    (2, Icons.privacy_tip_outlined, 'Confidential Intake Session', 'Share what feels comfortable. We listen and understand your needs.'),
    (3, Icons.route_outlined, 'Personalized Support Plan', 'Together we set gentle, realistic goals that fit your life as a student.'),
    (4, Icons.trending_up_rounded, 'Ongoing Care & Growth', 'Regular sessions, check-ins, and tools for lasting wellbeing.'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;

    return SectionShell(
      child: Column(
        children: [
          const SectionTitle(
            title: 'How It Works',
            subtitle: 'Four simple steps — you’re never rushed, and you’re always in control.',
          ),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < _steps.length; i++) ...[
                Expanded(
                  child: _StepCard(
                    step: _steps[i].$1,
                    icon: _steps[i].$2,
                    title: _steps[i].$3,
                    description: _steps[i].$4,
                    theme: theme,
                  ),
                ),
                if (i < _steps.length - 1 && !isMobile)
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.primaryBlue.withValues(alpha: 0.35),
                    ),
                  ),
                if (i < _steps.length - 1 && isMobile)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Icon(
                      Icons.arrow_downward_rounded,
                      color: AppColors.primaryBlue.withValues(alpha: 0.35),
                    ),
                  ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({
    required this.step,
    required this.icon,
    required this.title,
    required this.description,
    required this.theme,
  });

  final int step;
  final IconData icon;
  final String title;
  final String description;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.cardBorder),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryBlue.withValues(alpha: 0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(icon, color: AppColors.primaryBlue, size: 32),
              ),
              CircleAvatar(
                radius: 14,
                backgroundColor: AppColors.accentOrange,
                child: Text(
                  '$step',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(title, textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
