import 'package:flutter/material.dart';

/// GIFT University logo from [assets/images/logo_gift.png].
class GiftLogo extends StatelessWidget {
  const GiftLogo({
    super.key,
    this.height = 40,
    this.compact = false,
    this.onDarkBackground = false,
  });

  static const _assetPath = 'assets/images/logo_gift.png';

  final double height;
  final bool compact;
  final bool onDarkBackground;

  @override
  Widget build(BuildContext context) {
    // Logo artwork is wider than tall; compact mode uses a shorter height in the nav.
    final imageHeight = compact ? height * 0.85 : height;
    final maxWidth = compact ? height * 2.4 : height * 3.2;

    return Image.asset(
      _assetPath,
      height: imageHeight,
      width: maxWidth,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          height: imageHeight,
          width: maxWidth,
          child: Icon(
            Icons.image_not_supported_outlined,
            size: imageHeight * 0.6,
            color: onDarkBackground ? Colors.white54 : Colors.grey,
          ),
        );
      },
    );
  }
}
