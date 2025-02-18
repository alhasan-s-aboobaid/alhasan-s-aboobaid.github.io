
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/theme_utils.dart';
import 'package:flutter/material.dart';

import 'base_theme_colors.dart';


extension BaseThemeExtension on ThemeData {

  String get hashedString {
    return primaryColor.toString() ;
  }

  BaseThemeColors get themeColors {
    return themeColorToBaseThemeMap[hashedString]!;
  }

}