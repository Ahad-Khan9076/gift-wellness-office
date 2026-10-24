import 'package:flutter/material.dart';

import '../pages/gift_heals_page.dart';
import '../pages/landing_page.dart';

abstract final class AppRoutes {
  static const home = '/';
  static const giftHeals = '/gift-heals';

  static Map<String, WidgetBuilder> get routes => {
        home: (_) => const LandingPage(),
        giftHeals: (_) => const GiftHealsPage(),
      };

  static void openGiftHeals(BuildContext context) {
    final current = ModalRoute.of(context)?.settings.name;
    if (current == giftHeals) return;
    Navigator.pushNamed(context, giftHeals);
  }

  static void openHome(BuildContext context) {
    final current = ModalRoute.of(context)?.settings.name;
    if (current == home) return;
    Navigator.pushNamedAndRemoveUntil(context, home, (_) => false);
  }

  /// Opens home and scrolls to a section by [LandingSectionId].
  static void openHomeSection(BuildContext context, String sectionId) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      home,
      (_) => false,
      arguments: sectionId,
    );
  }
}
