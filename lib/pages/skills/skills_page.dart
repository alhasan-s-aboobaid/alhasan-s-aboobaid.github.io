import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:alhasan_abo_obaid/pages/skills/widgets/left_skills.dart';
import 'package:alhasan_abo_obaid/pages/skills/widgets/right_skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillsPage extends StatefulWidget {
  final Sizes sizes;

  const SkillsPage({super.key, required this.sizes});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.sizes.sectionPadding, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            16.verticalSpace,
            ScreenSizeUtil.getScreenType(context) == ScreenType.desktop
                ? Row(
                    children: [
                      Expanded(
                          child: LeftSkills(
                        sizes: widget.sizes,
                      )),
                      16.horizontalSpace,
                      const Expanded(child: EntranceFader(
                          delay: Duration(milliseconds: 1000),
                          child: RightSkills()))
                    ],
                  )
                : Column(
                    children: [
                      LeftSkills(
                        sizes: widget.sizes,
                      ),
                      16.verticalSpace,
                      EntranceFader(
                          delay: Duration(milliseconds: 1200),
                          child: const RightSkills(isVertical: true))
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
