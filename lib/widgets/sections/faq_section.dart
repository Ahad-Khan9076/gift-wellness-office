import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../common/section_shell.dart';
import '../common/soft_card.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  static const _faqs = [
    (
      'Is everything confidential?',
      'Yes. Your sessions and records are handled with strict confidentiality, in line with professional ethics and applicable law. Information is only shared if there is risk of harm to you or others, or when required by law.',
    ),
    (
      'What are the fees for counseling sessions?',
      'Therapy is a professional service with session fees. Rates and payment options are shared clearly and confidentially during booking — ask us anything; there is no pressure to commit before you feel ready.',
    ),
    (
      'Do I need a referral?',
      'No referral is needed. You can reach out directly to book an appointment whenever you feel ready.',
    ),
    (
      'What if I’m in crisis?',
      'If you are in immediate danger or crisis, contact local emergency services or a trusted person right away. You can also message us for urgent guidance — we will prioritize your safety and connect you to appropriate help.',
    ),
    (
      'Will my parents or university know?',
      'Routine counseling is confidential. We do not inform parents or faculty about your attendance or what you discuss, except in rare safety-related situations as explained above.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SectionShell(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Frequently Asked Questions',
            subtitle:
                'Honest answers — because you deserve to know exactly how we protect and support you.',
          ),
          SoftCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                for (var i = 0; i < _faqs.length; i++)
                  Theme(
                    data: theme.copyWith(dividerColor: AppColors.cardBorder),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 4,
                      ),
                      childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                      title: Text(
                        _faqs[i].$1,
                        style: theme.textTheme.titleMedium?.copyWith(fontSize: 16),
                      ),
                      iconColor: AppColors.primaryBlue,
                      collapsedIconColor: AppColors.bodyGray,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _faqs[i].$2,
                            style: theme.textTheme.bodyMedium,
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
