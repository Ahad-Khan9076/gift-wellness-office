import 'package:flutter/material.dart';

/// Breakpoints tuned for Flutter Web + mobile.
abstract final class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isMobile => screenWidth < Breakpoints.mobile;
  bool get isTablet =>
      screenWidth >= Breakpoints.mobile && screenWidth < Breakpoints.tablet;
  bool get isDesktop => screenWidth >= Breakpoints.tablet;

  /// App bar shows inline links only on wide layouts (avoids overflow on tablets).
  bool get showDesktopNav => screenWidth >= Breakpoints.desktop;

  /// Horizontal padding for section content.
  double get sectionHorizontalPadding {
    if (isMobile) return 20;
    if (isTablet) return 40;
    return 64;
  }

  /// Max content width for readable lines on large screens.
  double get contentMaxWidth {
    if (screenWidth > Breakpoints.desktop) return 1140;
    return screenWidth;
  }

  int get gridColumns {
    if (isMobile) return 1;
    if (isTablet) return 2;
    return 3;
  }
}
