import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/projects/models/project_model.dart';
import 'package:alhasan_abo_obaid/pages/projects/widgets/flip_project_card.dart';
import 'package:alhasan_abo_obaid/pages/projects/widgets/header_section.dart';
import 'package:flutter/material.dart';

class ProjectsSection extends StatefulWidget {
  final Sizes sizes;
  final ScreenType screenType;

  const ProjectsSection({super.key, required this.sizes, required this.screenType});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projects = Project.getProjects();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.screenType == ScreenType.mobile ? widget.sizes.sectionPadding * 0.8 : widget.sizes.sectionPadding,
        vertical: widget.screenType == ScreenType.mobile ? 24 : 32,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            HeaderSection(sizes: widget.sizes),
            (widget.screenType == ScreenType.mobile ? 24 : 32).vertical,
            // Projects List
            _buildProjectsList(projects),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsList(List<Map<String, dynamic>> projects) {
    // Use a vertical list for all screen types
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: SizedBox(
            height: widget.screenType == ScreenType.mobile ? 550 : 600, // Increased height for larger images
            child: FlipProjectCard(
              project: projects[index],
              index: index,
              screenType: widget.screenType,
              sizes: widget.sizes,
            ),
          ),
        );
      },
    );
  }
}


