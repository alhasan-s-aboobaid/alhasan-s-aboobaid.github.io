
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  final String iconPath;

  const IconWidget({
    super.key, required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      padding: 6.all,
      decoration: BoxDecoration(
          color: Theme.of(context).themeColors.hintColor.withOpacity(.3),
          borderRadius: 8.radiusAll
      ),
      child: iconPath.toAsset(w: 32, h: 32, fit: BoxFit.cover),
    );
  }
}