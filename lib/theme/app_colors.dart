import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF09090E);
  static const Color surface = Color(0xFF12121A);
  static const Color card = Color(0xFF1A1A24);
  static const Color border = Color(0xFF252535);

  static const Color accent = Color(0xFF7C6FFF);
  static const Color accentGlow = Color(0x447C6FFF);
  static const Color accentSecondary = Color(0xFF06D6DB);

  static const Color textPrimary = Color(0xFFF0F0F8);
  static const Color textSecondary = Color(0xFF8B8EA0);
  static const Color textMuted = Color(0xFF4A4D5E);

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF7C6FFF), Color(0xFF4EA1FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1A1A24), Color(0xFF121219)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
