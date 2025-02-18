import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    {required double fontSize,
      required FontWeight fontWeight,
      required Color color,
      double? height}) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      height: height,
      fontWeight: fontWeight);
}

// Extra light style

TextStyle getExtraLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.extraLight,
      color: color);
}

// light style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.light, color: color);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color, double? height}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.regular,
      color: color,
      height: height);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.medium, color: color);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color, double? height}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
      color: color,
      height: height);
}

// extra bold style

TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.extraBold,
      color: color);
}

// Black style

TextStyle getBlackStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.black, color: color);
}
