import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, this.backgroundColor, required this.title, this.onPressed});

  final Color? backgroundColor;
  final String title;
  final Function()? onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {


    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: _isHovered
              ?  LinearGradient(
            colors: [Theme.of(context).themeColors.primaryColor, Theme.of(context).themeColors.textBody],
            stops: const [0.0, 1.0],
          )
              : null,
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: Theme.of(context).themeColors.primaryColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 16,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ]
              : [],
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: () {
            if(widget.onPressed!=null) {
              widget.onPressed!();
            }
          },
          child: Container(
              height: 50.h,
              padding: 8.all,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: 10.radiusAll,
            color: widget.onPressed == null ? Theme.of(context).themeColors.disabledButton : widget.backgroundColor ?? Theme.of(context).themeColors.primaryColor,
          ),
          child: Text(widget.title, style: Theme.of(context).styles.bodyRegularMedium.copyWith(fontSize: Sizes.getSizes(ScreenSizeUtil.getScreenType(context)).buttonFontSize, color: Theme.of(context).themeColors.white),
          )),
        ),
      ),
    );
  }
}
