import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../utils/responsive.dart';
import '../common/section_shell.dart';
import '../common/soft_card.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  static const _testimonials = [
    (
      'I was scared someone would find out I was struggling. Here, I felt safe from day one, and my anxiety finally feels manageable.',
      5,
    ),
    (
      'Exam season was crushing me. My therapist helped me plan, breathe, and believe in myself again.',
      5,
    ),
    (
      'I thought asking for help meant I was weak. The Wellness Office showed me it’s actually brave.',
      5,
    ),
    (
      'Group sessions reminded me I’m not alone. That alone changed everything for me.',
      5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final columns = context.isMobile ? 1 : 2;

    return SectionShell(
      sectionKey: sectionKey,
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          const SectionTitle(
            title: 'What Students Are Saying',
            subtitle:
                'Real stories from GIFT students, shared with permission or anonymously.',
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final spacing = 20.0;
              final itemWidth =
                  (constraints.maxWidth - spacing * (columns - 1)) / columns;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: _testimonials.map((t) {
                  return SizedBox(
                    width: itemWidth,
                    child: SoftCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (i) => Icon(
                                i < t.$2
                                    ? Icons.star_rounded
                                    : Icons.star_outline_rounded,
                                color: AppColors.accentOrange,
                                size: 22,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '“${t.$1}”',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: AppColors.headingNavy,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
