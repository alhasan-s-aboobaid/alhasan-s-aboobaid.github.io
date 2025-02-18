
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/theme_enums.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/light_theme/light_theme_colors.dart';
import 'package:flutter/material.dart';

import '../light_theme/theme_data.dart';
import 'base_theme_colors.dart';




/// Global map which can help connecting between the string of the theme and the enum of the theme.
final Map<String, ThemeType> themeTypeMap = {
  themeTypeToString(ThemeType.LightTheme): ThemeType.LightTheme,
};

/// Global map which can help connecting between the enum of theme and the theme data of the theme.
Map<ThemeType, ThemeData> themeDataMap = {
  ThemeType.LightTheme: lightThemeData,
};

/// Global map which can help connecting between the identifier of the theme and the theme instance itself.

Map<String, BaseThemeColors> themeColorToBaseThemeMap = {
  lightTheme.getHashedString(): lightTheme,
};

/// Global function to get the string of the theme type(enum) without the "." in it
///
/// Example: For the theme type [ThemeType.LightTheme] returning "LightTheme" instead of "ThemeType.LightTheme".
String themeTypeToString(ThemeType? themeType) {
  if (themeType == null) return "LightTheme";
  return themeType.toString().split(".")[1];
}
/// Global helper function to access [themeTypeMap]
ThemeType getThemeTypeFromThemeString(String? theme) {
  if (theme == null) return ThemeType.LightTheme;
  return themeTypeMap[theme]!;
}

/// Global helper function to access [themeDataMap].

getThemeData(ThemeType? themeType) {
  return themeDataMap[themeType!];
}
