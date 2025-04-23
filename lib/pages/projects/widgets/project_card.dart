import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:alhasan_abo_obaid/pages/projects/widgets/project_details.dart';
import 'package:alhasan_abo_obaid/pages/projects/widgets/project_image.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  final int index;
  final ScreenType screenType;
  final Sizes sizes;

  const ProjectCard({
    Key? key,
    required this.project,
    required this.index,
    required this.screenType,
    required this.sizes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isEven = index % 2 == 0;

    return EntranceFader(
      delay: Duration(milliseconds: 300 * index),
      offset: Offset(isEven ? -30 : 30, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: 16.radiusAll,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: screenType == ScreenType.desktop
            ? _buildDesktopProjectCard(context, isEven)
            : _buildMobileProjectCard(context),
      ),
    );
  }

  Widget _buildDesktopProjectCard(BuildContext context, bool isEven) {
    return Row(
      children: [
        if (isEven) ProjectImage(project: project),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ProjectDetails(project: project, sizes: sizes),
          ),
        ),
        if (!isEven) ProjectImage(project: project),
      ],
    );
  }

  Widget _buildMobileProjectCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mobile image has different constraints
        ProjectImage(project: project),
        // Smaller padding on mobile
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProjectDetails(project: project, sizes: sizes),
        ),
      ],
    );
  }
}
