import 'package:ecomly_app/core/utils/core_utils.dart';
import 'package:flutter/material.dart';

abstract class Colours {
  // Light Theme Primary Tint Color Swatch
  static const Color lightThemePrimaryTint = Color(0xfff9e9cdc);

  // Light Theme Primary Color Swatch
  static const Color lightThemePrimaryColour = Color(0xff524eb7);

  // Light Theme Secondary Color Swatch
  static const Color lightThemeSecondaryColour = Color(0xff766331);

  // Light Theme Primary Text Color Swatch
  static const Color lightThemePrimaryTextColour = Color(0xff282344);

  // Light Theme Secondary Text Color Swatch
  static const Color lightThemeSecondaryTextColour = Color(0xff9491a1);

  // Light Theme Pink Color Swatch
  static const Color lightThemePinkColour = Color(0xffff08e98);

  // Light Theme White Color Swatch
  static const Color lightThemeWhiteColour = Color(0xffffffff);

  // Light Theme Tint Stock Color Swatch
  static const Color lightThemeTintStockColour = Color(0xfff6f6f9);

  // Light Theme Yellow Color Swatch
  static const Color lightThemeYellowColour = Color(0xffffeec613);

  // Light Theme Stock Color Swatch
  static const Color lightThemeStockColour = Color(0xfffe4e4e9);

  // darkThemeDarkSharp Color Swatch
  static const Color darkThemeDarkSharpColour = Color(0xff191821);

  // darkThemeBGDark Color Swatch
  static const Color darkThemeBGDark = Color(0xff0e0d11);

  // darkThemeDarkNavBar Color Swatch
  static const Color darkThemeDarkNavBarColour = Color(0xff201f27);

  static Color classicAdaptiveTextColour(BuildContext context) =>
      CoreUtils.adaptiveColour(
        context,
        lightModeColour: lightThemePrimaryTextColour,
        darkModeColour: lightThemeWhiteColour,
      );
}
