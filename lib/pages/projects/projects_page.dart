
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/projects/widgets/project_card.dart';
import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  final Sizes sizes;
  final ScreenType screenType;
  ProjectsSection({required this.sizes, required this.screenType});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = screenType == ScreenType.desktop;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Projects under development", style: TextStyle(fontSize: sizes.titleFontSize, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          isDesktop
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

            ],
          )
              : Column(
            children: [

            ],
          ),
        ],
      ),
    );
  }
}