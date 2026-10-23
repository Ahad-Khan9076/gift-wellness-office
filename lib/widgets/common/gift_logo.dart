import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

/// Placeholder GIFT University logo.
///
/// Replace with: `Image.asset('assets/images/gift_logo.png')` once the official
/// logo asset is added to [assets/images/].
class GiftLogo extends StatelessWidget {
  const GiftLogo({
    super.key,
    this.height = 40,
    this.compact = false,
    this.onDarkBackground = false,
  });

  final double height;
  final bool compact;
  final bool onDarkBackground;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height,
          width: height * 1.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            'G',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: height * 0.45,
            ),
          ),
        ),
        if (!compact) ...[
          SizedBox(width: height * 0.25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'GIFT University',
                style: AppTypography.sourceSans(
                  fontSize: height * 0.32,
                  fontWeight: FontWeight.w700,
                  color: onDarkBackground ? Colors.white : AppColors.primaryBlue,
                  height: 1.1,
                ),
              ),
              Text(
                'Wellness Office',
                style: AppTypography.sourceSans(
                  fontSize: height * 0.22,
                  fontWeight: FontWeight.w500,
                  color: onDarkBackground
                      ? Colors.white.withValues(alpha: 0.75)
                      : AppColors.bodyGray,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
