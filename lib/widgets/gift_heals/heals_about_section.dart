import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../utils/responsive.dart';
import '../common/soft_card.dart';
import 'gift_heals_section_shell.dart';

class HealsAboutSection extends StatelessWidget {
  const HealsAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;

    return GiftHealsSectionShell(
      backgroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HealsSectionTitle(title: 'What is GIFT HEALS?'),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!isMobile)
                Expanded(
                  flex: 2,
                  child: _PeerSupportVisual(size: 220),
                ),
              if (!isMobile) const SizedBox(width: 32),
              Expanded(
                flex: 3,
                child: SoftCard(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isMobile) ...[
                        Center(child: _PeerSupportVisual(size: 160)),
                        const SizedBox(height: 24),
                      ],
                      Text(
                        'Society for Health at GIFT University',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.accentOrange,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'GIFT HEALS runs structured peer-support and mental health services for students '
                        'so help is organized, timely, and never overlooked.',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.headingNavy,
                          height: 1.55,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: const [
                          _TagChip(label: 'Peer support'),
                          _TagChip(label: 'Ambassadors'),
                          _TagChip(label: 'Supervised care'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: AppColors.primaryBlue.withValues(alpha: 0.15),
        ),
      ),
      child: Text(
        label,
        style: AppTypography.sourceSans(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryBlue,
        ),
      ),
    );
  }
}

class _PeerSupportVisual extends StatelessWidget {
  const _PeerSupportVisual({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primaryBlue.withValues(alpha: 0.12),
                  AppColors.calmingGreen.withValues(alpha: 0.06),
                ],
              ),
            ),
          ),
          Container(
            width: size * 0.72,
            height: size * 0.72,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryBlue.withValues(alpha: 0.12),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.groups_rounded,
              size: size * 0.32,
              color: AppColors.primaryBlue,
            ),
          ),
          Positioned(
            top: size * 0.08,
            right: size * 0.12,
            child: _orbitIcon(Icons.favorite_rounded, AppColors.calmingGreen),
          ),
          Positioned(
            bottom: size * 0.14,
            left: size * 0.06,
            child: _orbitIcon(Icons.psychology_alt_outlined, AppColors.accentOrange),
          ),
          Positioned(
            bottom: size * 0.22,
            right: size * 0.04,
            child: _orbitIcon(Icons.shield_outlined, AppColors.secondaryBlue),
          ),
        ],
      ),
    );
  }

  Widget _orbitIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Icon(icon, color: color, size: 22),
    );
  }
}
