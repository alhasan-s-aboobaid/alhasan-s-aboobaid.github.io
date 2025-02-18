
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
          Text("Projects", style: TextStyle(fontSize: sizes.titleFontSize, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          isDesktop
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProjectCard(sizes: sizes, title: "Project 1"),
              ProjectCard(sizes: sizes, title: "Project 2"),
              ProjectCard(sizes: sizes, title: "Project 3"),
            ],
          )
              : Column(
            children: [
              ProjectCard(sizes: sizes, title: "Project 1"),
              SizedBox(height: 10),
              ProjectCard(sizes: sizes, title: "Project 2"),
              SizedBox(height: 10),
              ProjectCard(sizes: sizes, title: "Project 3"),
            ],
          ),
        ],
      ),
    );
  }
}