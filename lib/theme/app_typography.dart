import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Font pairing: Fraunces (headings) + Source Sans 3 (UI/body) + Lora (quotes).
abstract final class AppTypography {
  static TextStyle fraunces({
    double? fontSize,
    FontWeight fontWeight = FontWeight.w600,
    Color? color,
    double? height,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.fraunces(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppColors.headingNavy,
      height: height,
      fontStyle: fontStyle,
    );
  }

  static TextStyle sourceSans({
    double? fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double? height,
    FontStyle fontStyle = FontStyle.normal,
    double? letterSpacing,
  }) {
    return GoogleFonts.sourceSans3(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppColors.bodyGray,
      height: height,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle loraQuote({
    required double fontSize,
    Color? color,
  }) {
    return GoogleFonts.lora(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      color: color ?? AppColors.headingNavy.withValues(alpha: 0.88),
      height: 1.55,
    );
  }
}
