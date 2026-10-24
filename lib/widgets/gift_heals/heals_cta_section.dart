import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../utils/responsive.dart';
import '../../utils/landing_section_id.dart';
import 'gift_heals_section_shell.dart';

class HealsCtaSection extends StatelessWidget {
  const HealsCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;

    return GiftHealsSectionShell(
      backgroundColor: AppColors.white,
      paddingVertical: 48,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 24 : 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue,
              AppColors.secondaryBlue.withValues(alpha: 0.95),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Need one-on-one counseling?',
              style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'HEALS complements the Wellness Care Centre. Book confidential professional support anytime.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                OutlinedButton(
                  onPressed: () => AppRoutes.openHome(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white70),
                  ),
                  child: const Text('Wellness Care Centre'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      AppRoutes.openHomeSection(
                        context,
                        LandingSectionId.contact,
                      ),
                  child: const Text('Book a Session'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
