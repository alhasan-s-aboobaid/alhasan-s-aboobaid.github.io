import 'package:flutter/material.dart';

/// Base Theme which every new theme defined should inherit from this abstract class and override its getters if needed.
///
/// Please note that for every new theme defined, it should inherit and override all the colors that don't have a default value in the [BaseThemeColors].

abstract class BaseThemeColors {
  /// Unique identifier for each theme
  String getHashedString() => primaryColor.toString();

  Color get primaryColor;
  Color get backgroundColor;
  Color get white;
  Color get hintText;
  Color get drawerText;
  Color get textBody;
  Color get purple;
  Color get riderYellow;
  Color get primaryLight;
  Color get disabledButton;
  Color get hintColor;
  Color get addPhotoColor;
  Color get black;


}