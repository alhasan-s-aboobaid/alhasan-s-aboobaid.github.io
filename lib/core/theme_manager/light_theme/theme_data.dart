import 'dart:ui';

import 'package:flutter/material.dart';

import 'light_theme_colors.dart';

/// Global constant of class [ThemeData] which represent the Light Theme in the system
///
final ThemeData lightThemeData = ThemeData(
  primaryColor: lightTheme.primaryColor,
  //backgroundColor: lightTheme.backgroundColor,
  scaffoldBackgroundColor: lightTheme.backgroundColor,
  dialogBackgroundColor: lightTheme.backgroundColor,
  textTheme: const TextTheme(),
);
