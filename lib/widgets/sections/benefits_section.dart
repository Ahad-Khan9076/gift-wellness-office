import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../utils/responsive.dart';
import '../common/section_shell.dart';

class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

  static const _benefits = [
    (
      '01',
      Icons.lock_outline_rounded,
      AppColors.primaryBlue,
      'Complete Confidentiality',
      'What you share stays between you and your therapist, within ethical and legal guidelines.',
    ),
    (
      '02',
      Icons.psychology_outlined,
      AppColors.calmingGreen,
      'Qualified Clinical & Counseling Psychologists',
      'Support from trained professionals who understand student mental health.',
    ),
    (
      '03',
      Icons.payments_outlined,
      AppColors.accentOrange,
      'Clear, Student-Friendly Fees',
      'Professional sessions with transparent pricing — we’ll explain fees confidentially when you book.',
    ),
    (
      '04',
      Icons.location_on_outlined,
      AppColors.secondaryBlue,
      'On-Campus & Convenient',
      'Easy to reach between classes, without leaving the GIFT community.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;
    final isWide = context.screenWidth >= Breakpoints.desktop;

    return SectionShell(
      backgroundColor: AppColors.backgroundSoft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: Text(
                        'Why students choose us',
                        style: AppTypography.sourceSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryBlue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Why Students Trust Us',
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'We combine university-backed care with the warmth of a mentor who truly listens.',
                      maxLines: 3,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              if (isWide) ...[
                const SizedBox(width: 40),
                _TrustBadgeColumn(),
              ],
            ],
          ),
          if (isMobile) ...[
            const SizedBox(height: 24),
            const _TrustBadgeColumn(compact: true),
          ],
          const SizedBox(height: 36),
          _BenefitsGrid(isMobile: isMobile),
        ],
      ),
    );
  }
}

/// Equal-width, equal-height benefit cards (2×2 on desktop).
class _BenefitsGrid extends StatelessWidget {
  const _BenefitsGrid({required this.isMobile});

  final bool isMobile;

  static const _gap = 20.0;
  /// Shared height so all four cards match on wide layouts.
  static const _desktopCardHeight = 272.0;

  @override
  Widget build(BuildContext context) {
    final cards = BenefitsSection._benefits.map((b) {
      return _BenefitCard(
        index: b.$1,
        icon: b.$2,
        accent: b.$3,
        title: b.$4,
        description: b.$5,
        stretch: !isMobile,
      );
    }).toList();

    if (isMobile) {
      return Column(
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i > 0) const SizedBox(height: _gap),
            cards[i],
          ],
        ],
      );
    }

    Widget cell(Widget card) {
      return Expanded(
        child: SizedBox(
          height: _desktopCardHeight,
          child: card,
        ),
      );
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cell(cards[0]),
            const SizedBox(width: _gap),
            cell(cards[1]),
          ],
        ),
        const SizedBox(height: _gap),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cell(cards[2]),
            const SizedBox(width: _gap),
            cell(cards[3]),
          ],
        ),
      ],
    );
  }
}

class _TrustBadgeColumn extends StatelessWidget {
  const _TrustBadgeColumn({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: compact ? double.infinity : 200,
      padding: EdgeInsets.all(compact ? 20 : 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryBlue,
            AppColors.secondaryBlue.withValues(alpha: 0.95),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            compact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.verified_user_rounded,
            color: Colors.white.withValues(alpha: 0.95),
            size: compact ? 32 : 36,
          ),
          SizedBox(height: compact ? 12 : 16),
          Text(
            'Trusted care',
            style: AppTypography.fraunces(
              fontSize: compact ? 22 : 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Professional • Private • Student-focused',
            textAlign: compact ? TextAlign.center : TextAlign.start,
            style: AppTypography.sourceSans(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.88),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitCard extends StatefulWidget {
  const _BenefitCard({
    required this.index,
    required this.icon,
    required this.accent,
    required this.title,
    required this.description,
    this.stretch = false,
  });

  final String index;
  final IconData icon;
  final Color accent;
  final String title;
  final String description;
  final bool stretch;

  @override
  State<_BenefitCard> createState() => _BenefitCardState();
}

class _BenefitCardState extends State<_BenefitCard> {
  bool _hovered = false;

  Widget _cardBody(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: widget.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(widget.icon, color: widget.accent, size: 28),
              ),
              const Spacer(),
              Text(
                widget.index,
                style: AppTypography.fraunces(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: widget.accent.withValues(alpha: 0.25),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(widget.title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 10),
          Text(
            widget.description,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.55),
          ),
          if (widget.stretch) const Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: double.infinity,
        height: widget.stretch ? double.infinity : null,
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? widget.accent.withValues(alpha: 0.35)
                : AppColors.cardBorder,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.accent.withValues(alpha: _hovered ? 0.12 : 0.06),
              blurRadius: _hovered ? 28 : 20,
              offset: Offset(0, _hovered ? 14 : 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 4,
                width: double.infinity,
                color: widget.accent,
              ),
              if (widget.stretch)
                Expanded(child: _cardBody(theme))
              else
                _cardBody(theme),
            ],
          ),
        ),
      ),
    );
  }
}
