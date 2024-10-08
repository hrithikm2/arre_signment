import 'package:arre_signment/app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const _baseSize = 16.0;

  static TextTheme textTheme(BuildContext context) => TextTheme(
        displayLarge: _getTextStyle(size: 40, weight: FontWeight.bold),
        displayMedium: _getTextStyle(size: 36, weight: FontWeight.bold),
        displaySmall: _getTextStyle(size: 32, weight: FontWeight.bold),
        headlineLarge: _getTextStyle(size: 30, weight: FontWeight.w600),
        headlineMedium: _getTextStyle(size: 24, weight: FontWeight.w600),
        headlineSmall: _getTextStyle(size: 20, weight: FontWeight.w600),
        titleLarge: _getTextStyle(size: 18, weight: FontWeight.w600),
        titleMedium: _getTextStyle(size: 16, weight: FontWeight.w500),
        titleSmall: _getTextStyle(size: 14, weight: FontWeight.w500),
        bodyLarge: _getTextStyle(size: 16),
        bodyMedium: _getTextStyle(size: 14),
        bodySmall: _getTextStyle(size: 12),
        labelLarge: _getTextStyle(size: 14, weight: FontWeight.w500),
        labelMedium: _getTextStyle(size: 12, weight: FontWeight.w500),
        labelSmall: _getTextStyle(size: 10, weight: FontWeight.w500),
      );

  static TextStyle _getTextStyle({
    required double size,
    FontWeight weight = FontWeight.normal,
    FontStyle style = FontStyle.normal,
    double? letterSpacing,
    double? height,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      fontStyle: style,
      letterSpacing: letterSpacing,
      height: height,
      color: color ?? AppColors.textColor,
    );
  }

  // Custom styles with color options
  static TextStyle ultraSmall({BuildContext? context, Color? color}) =>
      _getTextStyle(size: 10, color: color);
  static TextStyle extraSmall({BuildContext? context, Color? color}) =>
      _getTextStyle(size: 12, color: color);
  static TextStyle small({BuildContext? context, Color? color}) =>
      _getTextStyle(size: 14, color: color);
  static TextStyle regular({BuildContext? context, Color? color}) =>
      _getTextStyle(size: 16, color: color);
  static TextStyle large({BuildContext? context, Color? color}) =>
      _getTextStyle(size: 20, color: color);

  // Helper method to scale font sizes
  static TextStyle scale(TextStyle style, double factor) {
    return style.copyWith(fontSize: (style.fontSize ?? _baseSize) * factor);
  }

  // Helper method to change color of a TextStyle
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }
}
