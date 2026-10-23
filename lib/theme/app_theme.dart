import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_typography.dart';

/// Central [ThemeData] for GIFT Wellness Office (web-first, accessible contrast).
ThemeData buildAppTheme() {
  final bodyBase = GoogleFonts.sourceSans3TextTheme();

  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundSoft,
    fontFamily: GoogleFonts.sourceSans3().fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryBlue,
      primary: AppColors.primaryBlue,
      secondary: AppColors.accentOrange,
      surface: AppColors.white,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.headingNavy,
    ),
    textTheme: bodyBase.copyWith(
      displayLarge: AppTypography.fraunces(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 1.12,
      ),
      displayMedium: AppTypography.fraunces(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),
      headlineLarge: AppTypography.fraunces(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
      headlineMedium: AppTypography.fraunces(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.22,
      ),
      titleLarge: AppTypography.sourceSans(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.headingNavy,
      ),
      titleMedium: AppTypography.sourceSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.headingNavy,
      ),
      bodyLarge: AppTypography.sourceSans(
        fontSize: 17,
        height: 1.65,
      ),
      bodyMedium: AppTypography.sourceSans(
        fontSize: 15,
        height: 1.6,
      ),
      labelLarge: AppTypography.sourceSans(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentOrange,
        foregroundColor: AppColors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTypography.sourceSans(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryBlue,
        side: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTypography.sourceSans(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryBlue,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white.withValues(alpha: 0.92),
      foregroundColor: AppColors.headingNavy,
      titleTextStyle: AppTypography.sourceSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.headingNavy,
      ),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.cardBorder),
  );
}
