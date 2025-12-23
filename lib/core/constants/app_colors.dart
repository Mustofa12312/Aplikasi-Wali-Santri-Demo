import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Core monochrome
  static const Color black = Color(0xFF0B0B0F);
  static const Color white = Color(0xFFFFFFFF);

  // Surfaces
  static const Color background = Color(0xFFF7F7F8);
  static const Color surface = Color(0xFFFFFFFF);

  // Borders & dividers
  static const Color outline = Color(0xFFE6E6EA);

  // Text variants
  static Color textPrimary = black;
  static Color textSecondary = black.withOpacity(0.65);
  static Color textTertiary = black.withOpacity(0.45);

  // Status (tetap kalem, tidak norak)
  static const Color success = Color(0xFF1E7F55);
  static const Color warning = Color(0xFF9A6B00);
  static const Color danger = Color(0xFFB42318);
}
