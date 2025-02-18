


import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key, required this.count, required this.label});

  final int count;
  final String label;

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {

    Sizes sizes = Sizes.getSizes(ScreenSizeUtil.getScreenType(context));

    return TweenAnimationBuilder(tween: IntTween(
        begin: 0, end: widget.count),
      duration: const Duration(seconds: 2),
      builder: (context, value, child) {
        return Row(
          children: [
            Text("+", style: Theme.of(context).styles.bodyRegularLarge.copyWith(
                color: Theme.of(context).themeColors.primaryLight, fontSize: sizes.animatedPlusSize
            ),),
            2.horizontalSpace,
            Text(value.toString(), style: Theme.of(context).styles.headingSmall.copyWith(
                color: Colors.white, fontSize: sizes.animatedCountSize
            ),),
            2.horizontalSpace,
            Text(widget.label, style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                color: Theme.of(context).themeColors.disabledButton, fontSize: sizes.animatedTextSize
            ),),
          ],
        );
      },);
  }
}


