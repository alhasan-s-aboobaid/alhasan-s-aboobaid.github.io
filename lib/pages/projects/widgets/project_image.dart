import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/pages/projects/widgets/hover_scale_image.dart';
import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectImage({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = ScreenSizeUtil.getScreenType(context);
    final bool isMobile = screenType == ScreenType.mobile;

    // For desktop, we use Expanded with flex
    // For mobile, we don't use Expanded since it's in a Column
    final Widget imageContainer = ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        height: isMobile ? 220 : 350, // Smaller height on mobile
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).themeColors.primaryColor.withOpacity(0.3),
              blurRadius: 12,
              spreadRadius: 5,
            ),
          ],
        ),
        child: HoverScaleImage(path: "assets/projects/${project['image']}"),
      ),
    );

    // Return the appropriate widget based on screen type
    if (screenType == ScreenType.desktop || screenType == ScreenType.tablet) {
      return Expanded(
        flex: 2,
        child: imageContainer,
      );
    } else {
      return imageContainer;
    }
  }
}
