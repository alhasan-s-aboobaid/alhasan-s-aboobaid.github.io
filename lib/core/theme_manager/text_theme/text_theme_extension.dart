
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_styles.dart';
import 'package:flutter/material.dart';


/// An extension on the [ThemeData] class to make it possible to access all attributes in [BaseThemeColors] whether they are
/// default attributes in [ThemeData] like:primaryColor Or custom attributes like: breadCrumbTextColor
///
/// Example of usage: Theme.of(context).themeColors.breadCrumbTextColor

extension BaseThemeExtension on ThemeData {
  static TextThemeStyles? _textThemeStyles;

  static TextThemeStyles instance() {
    _textThemeStyles = _textThemeStyles ?? TextThemeStyles();
    return _textThemeStyles!;
  }

  TextThemeStyles get styles {
    return instance();
  }

}