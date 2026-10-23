import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../theme/app_colors.dart';
import '../../utils/responsive.dart';

/// Shared section wrapper: max width, padding, optional background, scroll anchor.
class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.child,
    this.sectionKey,
    this.backgroundColor,
    this.paddingVertical = 72,
  });

  final Widget child;
  final Key? sectionKey;
  final Color? backgroundColor;
  final double paddingVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      color: backgroundColor ?? AppColors.backgroundSoft,
      padding: EdgeInsets.symmetric(
        vertical: context.isMobile ? paddingVertical * 0.65 : paddingVertical,
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
                .fadeIn(duration: 500.ms, curve: Curves.easeOut)
                .slideY(begin: 0.04, end: 0, duration: 500.ms, curve: Curves.easeOut),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.center = true,
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
          const SizedBox(height: 12),
          Text(
            subtitle!,
            textAlign: center ? TextAlign.center : TextAlign.start,
            maxLines: 4,
            style: theme.textTheme.bodyLarge,
          ),
        ],
        const SizedBox(height: 40),
      ],
    );
  }
}
