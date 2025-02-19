
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsSection extends StatelessWidget {
  final Sizes sizes;
  final ScreenType screenType;
  const ProjectsSection({required this.sizes, required this.screenType});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = screenType == ScreenType.desktop;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        64.verticalSpace,
        "assets/icons/under_construction.png".toAsset(w: 150, h: 150),
        Text("Under Construction", style: TextStyle(fontSize: sizes.titleFontSize, fontWeight: FontWeight.bold, color: Colors.white)),
      ],
    );
  }
}