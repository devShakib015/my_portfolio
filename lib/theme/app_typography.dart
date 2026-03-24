import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  static TextStyle display(double size) => GoogleFonts.spaceGrotesk(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.1,
        letterSpacing: -1.5,
      );

  static TextStyle heading(double size) => GoogleFonts.spaceGrotesk(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
      );

  static final TextStyle body = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.75,
  );

  static final TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  static final TextStyle label = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );

  static final TextStyle caption = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textMuted,
    letterSpacing: 1.0,
  );

  static final TextStyle navLink = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.2,
  );
}
