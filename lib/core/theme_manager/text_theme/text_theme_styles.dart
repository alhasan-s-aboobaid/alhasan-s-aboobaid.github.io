import 'package:alhasan_abo_obaid/core/theme_manager/light_theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// Base Theme which every new theme defined should inherit from this abstract class and override its getters if needed.
///
/// Please note that for every new theme defined, it should inherit and override all the colors that don't have a default value in the [TextTheme].

class TextThemeStyles {
  TextStyle get headingLarge =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 22.sp, height: 1.37, color: lightTheme.textBody);

  TextStyle get headingMedium =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 18.sp, height: 1.45, color: lightTheme.textBody);

  TextStyle get headingSmall =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 16.sp, height: 1.37, color: lightTheme.textBody);

  TextStyle get headline4AllCaps =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: 'Roboto', fontSize: 12.sp, height: 1.67, color: lightTheme.textBody);

  TextStyle get bodyLarge => TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 16.sp, height: 1.5, color: lightTheme.textBody);

  TextStyle get bodyMedium => TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 14.sp, height: 1.43, color: lightTheme.textBody);

  TextStyle get bodySmall => TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 12.sp, height: 1.34, color: lightTheme.textBody);

  TextStyle get bodyExtraSmall =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 10.sp, height: 1.4.sp, color: lightTheme.textBody);

  TextStyle get buttonLarge => TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 16.sp, height: 1.5, color: lightTheme.textBody,);

  TextStyle get buttonMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 14.sp, height: 1.57, color: lightTheme.textBody);

  TextStyle get buttonSmall =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 12.sp, height: 1.66, color: lightTheme.textBody);

  TextStyle get bodyRegularLarge =>
      TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 16.sp, height: 1.5, color: lightTheme.textBody);

  TextStyle get bodyRegularMedium =>
      TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 14.sp, height: 1.43, color: lightTheme.textBody);

  TextStyle get bodyRegularSmall =>
      TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 12.sp, height: 1.34, color: lightTheme.textBody);

  TextStyle get bodyRegularExtraSmall =>
      TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 10.sp, height: 1.4, color: lightTheme.textBody);
}
