import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../theme/app_colors.dart';
import '../../utils/responsive.dart';

/// Shared wrapper for GIFT HEALS page sections (max width, padding, entrance).
class GiftHealsSectionShell extends StatelessWidget {
  const GiftHealsSectionShell({
    super.key,
    required this.child,
    this.backgroundColor,
    this.paddingVertical = 56,
  });

  final Widget child;
  final Color? backgroundColor;
  final double paddingVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor ?? AppColors.backgroundSoft,
      padding: EdgeInsets.symmetric(
        vertical: context.isMobile ? paddingVertical * 0.7 : paddingVertical,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.contentMaxWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.sectionHorizontalPadding,
            ),
            child: child
                .animate()
                .fadeIn(duration: 480.ms, curve: Curves.easeOut)
                .slideY(begin: 0.035, end: 0, duration: 480.ms),
          ),
        ),
      ),
    );
  }
}

class HealsSectionTitle extends StatelessWidget {
  const HealsSectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.center = false,
  });

  final String title;
  final String? subtitle;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: center ? TextAlign.center : TextAlign.start,
          style: theme.textTheme.headlineMedium,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(
            subtitle!,
            textAlign: center ? TextAlign.center : TextAlign.start,
            style: theme.textTheme.bodyLarge,
          ),
        ],
        const SizedBox(height: 32),
      ],
    );
  }
}
