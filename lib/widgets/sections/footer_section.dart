import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../utils/responsive.dart';
import '../../utils/landing_section_id.dart';
import '../common/gift_logo.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key, required this.onNavigate});

  final void Function(String sectionId) onNavigate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;
    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      color: AppColors.headingNavy,
      padding: EdgeInsets.symmetric(
        horizontal: context.sectionHorizontalPadding,
        vertical: isMobile ? 40 : 56,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.contentMaxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GiftLogo(height: 44, onDarkBackground: true),
                  if (!isMobile) const Spacer(),
                  if (isMobile) const SizedBox(height: 24),
                  Wrap(
                    spacing: 20,
                    runSpacing: 8,
                    children: [
                      _FooterLink(
                        label: 'About',
                        onTap: () => onNavigate(LandingSectionId.about),
                      ),
                      _FooterLink(
                        label: 'Therapists',
                        onTap: () => onNavigate(LandingSectionId.therapists),
                      ),
                      _FooterLink(
                        label: 'Contact',
                        onTap: () => onNavigate(LandingSectionId.contact),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Divider(color: Colors.white.withValues(alpha: 0.15)),
              const SizedBox(height: 20),
              Text(
                'An initiative of the Department of Psychology, GIFT University',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Privacy & Confidentiality: Counseling records are protected under professional ethical standards. We do not share your information with faculty, staff, or family except where required for safety or by law.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.65),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '© $year GIFT University. All rights reserved.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white.withValues(alpha: 0.9),
        padding: EdgeInsets.zero,
      ),
      child: Text(label),
    );
  }
}
