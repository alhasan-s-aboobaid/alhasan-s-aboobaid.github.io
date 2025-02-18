

// Enum for screen type detection
import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }



class ScreenSizeUtil {
  static ScreenType getScreenType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return ScreenType.mobile;
    } else if (width < 1200) {
      return ScreenType.tablet;
    } else {
      return ScreenType.desktop;
    }
  }
}
