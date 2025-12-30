import 'package:flutter/material.dart';

abstract class TextStyles {
  // --- Text Style 1: Heading Bold ---
  /// weight: w700
  /// size: 48
  /// height: 1.2 >> 57.6px
  static const TextStyle headingBold = TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.w700, // bold
    height: 1.2,
  );

  // --- Text Style 2: Heading Bold 1 ---
  /// weight: w700
  /// size: 20
  /// height: 1.5 >> 30px
  static const TextStyle headingBold1 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700, // bold
    height: 1.5,
  );

  // --- CONTINUATION: Heading Regular (Requested Style) ---

  /// weight: w400 (Regular)
  /// size: 32
  static const TextStyle headingRegular = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w400, // regular
    height: 1.25,
  );

  // --- Other Headings (Previously Defined) ---

  /// weight: w600 (SemiBold)
  /// size: 32
  static const TextStyle headingMedium = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w600, // semiBold
    height: 1.25,
  );

  /// weight: w500 (Medium)
  /// size: 24
  static const TextStyle headingSmall = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500, // medium
    height: 1.3,
  );

  // --- Body Text ---

  /// weight: w400 (Regular)
  /// size: 16
  static const TextStyle bodyRegular = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400, // regular
    height: 1.4,
  );

  /// weight: w500 (Medium)
  /// size: 16
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500, // medium
    height: 1.4,
  );

  // --- Caption & Detail Text ---

  /// weight: w400 (Regular)
  /// size: 14
  static const TextStyle captionRegular = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400, // regular
    height: 1.5,
  );

  /// weight: w300 (Light)
  /// size: 12
  static const TextStyle detailLight = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w300, // light
    height: 1.6,
  );

  // --- Utility Text Styles ---

  /// weight: w700 (Bold)
  /// size: 14 - for buttons
  static const TextStyle buttonText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700, // bold
    letterSpacing: 0.5, // slightly tracked text
  );
}
