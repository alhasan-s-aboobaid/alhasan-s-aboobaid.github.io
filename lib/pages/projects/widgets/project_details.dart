import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/core/widgets/custom_button.dart';
import 'package:alhasan_abo_obaid/pages/projects/widgets/tech_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectDetails extends StatelessWidget {
  final Map<String, dynamic> project;
  final Sizes sizes;

  const ProjectDetails({
    Key? key,
    required this.project,
    required this.sizes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = ScreenSizeUtil.getScreenType(context);
    final bool isMobile = screenType == ScreenType.mobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Role, year and company logo row
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project['role'],
                    style: TextStyle(
                      color: Theme.of(context).themeColors.primaryLight,
                      fontSize: isMobile ? 12 : 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isMobile) 4.verticalSpace,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).themeColors.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      project['year'],
                      style: TextStyle(
                        color: Theme.of(context).themeColors.primaryColor,
                        fontSize: isMobile ? 10 : 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            project['companyLogo'].toString().toAsset(w: isMobile ? 32.w : 40.w, h: isMobile ? 32.h : 40.h),
          ],
        ),
        12.verticalSpace,
        // Project title
        Text(
          project['name'],
          style: Theme.of(context).styles.headingLarge.copyWith(
                fontSize: isMobile ? sizes.titleFontSize * 0.8 : sizes.titleFontSize,
                color: Colors.white,
              ),
        ),
        isMobile ? 12.verticalSpace : 16.verticalSpace,
        // Project description
        Text(
          project['description'],
          style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                fontSize: isMobile ? sizes.subtitleFontSize * 0.9 : sizes.subtitleFontSize,
                color: Theme.of(context).themeColors.disabledButton,
              ),
          maxLines: isMobile ? 4 : 6, // Fewer lines on mobile
          overflow: TextOverflow.ellipsis,
        ),
        isMobile ? 16.verticalSpace : 20.verticalSpace,
        // Tech stack section
        TechStack(techStack: project['techStack'], isMobile: isMobile),
        isMobile ? 16.verticalSpace : 20.verticalSpace,
        // Highlights section - conditionally show on mobile
        if (!isMobile || (isMobile && project['highlights'].length <= 2))
          _buildHighlights(context, project['highlights'], isMobile),
        isMobile ? 20.verticalSpace : 24.verticalSpace,
        // Action buttons
        isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(
                    title: "View Project",
                    onPressed: () {
                      launchUrlString(project['link']);
                    },
                  ),
                  if (project['github'].isNotEmpty) 12.verticalSpace,
                  if (project['github'].isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        launchUrlString(project['github']);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                              size: 16,
                            ),
                            8.horizontalSpace,
                            Text(
                              "Source Code",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              )
            : Row(
                children: [
                  CustomButton(
                    title: "View Project",
                    onPressed: () {
                      launchUrlString(project['link']);
                    },
                  ),
                  16.horizontalSpace,
                  if (project['github'].isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        launchUrlString(project['github']);
                      },
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.github,
                            color: Colors.white,
                            size: 20,
                          ),
                          8.horizontalSpace,
                          Text(
                            "Source Code",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
      ],
    );
  }

  Widget _buildHighlights(BuildContext context, List<dynamic> highlights, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Key Contributions",
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        isMobile ? 8.verticalSpace : 12.verticalSpace,
        ...highlights.take(isMobile ? 2 : highlights.length).map((highlight) =>
          _buildHighlightItem(context, highlight, isMobile)
        ).toList(),
      ],
    );
  }

  Widget _buildHighlightItem(BuildContext context, String highlight, bool isMobile) {
    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 6.0 : 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: Theme.of(context).themeColors.primaryColor,
            size: isMobile ? 14 : 16,
          ),
          6.horizontalSpace,
          Expanded(
            child: Text(
              highlight,
              style: TextStyle(
                color: Theme.of(context).themeColors.disabledButton,
                fontSize: isMobile ? 12 : 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
