import 'package:flutter/material.dart';

import '../base_theme/base_theme_colors.dart';
import 'theme_data.dart';

/// Global constant of class [LightThemeColors] which inherit class [BaseThemeColors] defining set of colors an settings and called "Amazon Theme"
/// and used in declaring the [lightThemeData] which represent the system them used in the application.

final LightThemeColors lightTheme = LightThemeColors.instance();

class LightThemeColors extends BaseThemeColors {
  static LightThemeColors? _lightTheme;

  static LightThemeColors instance() {
    _lightTheme = _lightTheme ?? LightThemeColors();
    return _lightTheme!;
  }

  @override
  Color get primaryColor => const Color(0xFF01BCB5);

  @override
  Color get backgroundColor => Colors.white;

  @override
  Color get hintText => const Color(0xFF4F4F4F);

  @override
  Color get drawerText => const Color(0xFFA0A0A0);

  @override
  Color get textBody => Colors.white;

  @override
  Color get white => Colors.white;

  @override
  Color get purple => const Color(0xFFA549D2);

  @override
  Color get riderYellow => const Color(0xFFFFCA47);

  @override
  Color get primaryLight => const Color(0xFF13DED7);

  @override
  Color get disabledButton => const Color(0xFF98A2A2);

  @override
  Color get hintColor => const Color(0xFF4F4F4F);

  @override
  Color get addPhotoColor => const Color(0xFF4980D2);


  @override
  Color get black => Colors.black;


}
