import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../utils/responsive.dart';
import '../../utils/section_keys.dart';
import '../common/section_shell.dart';
import '../common/soft_card.dart';

class TherapistsSection extends StatelessWidget {
  const TherapistsSection({super.key});

  /// Team listing — update titles, bios, photos, and experience when details are ready.
  static const _therapists = [
    (
      'Dr Zaibun Nissa',
      'Clinical Psychologist',
      'Profile details coming soon',
      '—',
      'Compassionate, confidential support for GIFT students and the wider community.',
    ),
    (
      'Dr Ather Mujtaba',
      'Clinical Psychologist',
      'Profile details coming soon',
      '—',
      'Compassionate, confidential support for GIFT students and the wider community.',
    ),
    (
      'Miss Sibgha Farrooqi',
      'Counseling Psychologist',
      'Profile details coming soon',
      '—',
      'Compassionate, confidential support for GIFT students and the wider community.',
    ),
    (
      'Miss Hifza',
      'Counseling Psychologist',
      'Profile details coming soon',
      '—',
      'Compassionate, confidential support for GIFT students and the wider community.',
    ),
    (
      'Miss Esha',
      'Counseling Psychologist',
      'Profile details coming soon',
      '—',
      'Compassionate, confidential support for GIFT students and the wider community.',
    ),
    (
      'Miss Amna',
      'Counseling Psychologist',
      'Profile details coming soon',
      '—',
      'Compassionate, confidential support for GIFT students and the wider community.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final columns = context.isMobile ? 1 : (context.isTablet ? 2 : 3);

    return SectionShell(
      sectionKey: SectionKeys.therapists,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Meet Our Therapists',
            subtitle:
                'Experienced psychologists who care about your wellbeing — not labels or judgment.',
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final spacing = 20.0;
              final itemWidth =
                  (constraints.maxWidth - spacing * (columns - 1)) / columns;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: _therapists.map((t) {
                  return SizedBox(
                    width: itemWidth,
                    child: SoftCard(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _TherapistAvatar(name: t.$1),
                          const SizedBox(height: 16),
                          Text(t.$1, style: theme.textTheme.titleMedium),
                          Text(
                            t.$2,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.secondaryBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            t.$3,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.headingNavy,
                            ),
                          ),
                          if (t.$4 != '—') ...[
                            const SizedBox(height: 4),
                            Text(
                              'Experience: ${t.$4}',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                          const SizedBox(height: 12),
                          Text(t.$5, style: theme.textTheme.bodyMedium),
                          const SizedBox(height: 16),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('View Profile'),
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

class _TherapistAvatar extends StatelessWidget {
  const _TherapistAvatar({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    // Placeholder avatar — swap for Image.asset('assets/images/therapist_x.jpg')
    const titles = {'Dr', 'Dr.', 'Miss', 'Mr', 'Mr.', 'Ms', 'Ms.'};
    final initials = name
        .split(' ')
        .where((p) => p.isNotEmpty && !titles.contains(p))
        .take(2)
        .map((p) => p[0])
        .join();

    return Container(
      height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            AppColors.secondaryBlue.withValues(alpha: 0.85),
            AppColors.primaryBlue.withValues(alpha: 0.9),
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Photo placeholder',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
