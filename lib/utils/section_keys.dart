import 'package:flutter/material.dart';

import 'landing_section_id.dart';

/// Per–landing-page scroll keys (avoids GlobalKey clashes when routes rebuild).
final class LandingSectionKeys {
  final about = GlobalKey();
  final therapists = GlobalKey();
  final testimonials = GlobalKey();
  final contact = GlobalKey();

  GlobalKey forId(String id) {
    switch (id) {
      case LandingSectionId.about:
        return about;
      case LandingSectionId.therapists:
        return therapists;
      case LandingSectionId.testimonials:
        return testimonials;
      case LandingSectionId.contact:
        return contact;
      default:
        return about;
    }
  }
}
