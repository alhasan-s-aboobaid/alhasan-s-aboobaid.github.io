import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/icon_manager.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/core/widgets/hover_text.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    final List<Map<String, dynamic>> projects = [
      {
        'name': 'Maids.cc Client App',
        'description': 'Get a full-time maid or a maid visa. Sign & pay online in 5 minutes.'
            ' Avoid visits to medical centers & typists. Cancel anytime. Winner ministry award.\n\n'
            'To apply for your maid\'s visa, Just upload your maid\'s passport copy & photo. We\'ll handle the entire visa process and deliver your maid\'s passport with her visa stamped.\n\n'
            'To get a full-time maid today, view maids videos and hire your favorite. We\'ll Uber your new maid to you.',
        'image': 'maidsapp1.png',
        'companyLogo':IconManager.maidsccLogo,
        'link': 'https://play.google.com/store/apps/details?id=cc.maids.app&hl=en'
      },
      {
        'name': 'ElectroMall',
        'description':
            'ElectroMall was the first one-of-its kind large format specialist retail store that catered to all multi-brand\ndigital gadgets and home electronic needs in Iraq.\n\nSince its inception, ElectroMall has almost become synonyms for all electronics needs, with its tech-savvy staff, product range, Staged presence and the will to help customers.',
        'image': 'electroapp.png',
        'companyLogo':IconManager.electromall,
        'link': 'https://play.google.com/store/apps/details?id=com.electromall.app&hl=en'
      },
      {
        'name': 'kelshimall كلشي مول',
        'companyLogo':IconManager.kelshimall,
        'description':
            'The Kalshi Mall project is an online marketplace that allows users to sell anything in a smooth and easy way through the website or application on Android and iPhone.\n\nThe goal of the project is to create an easy-to-handle electronic interface, where the user can advertise his goods or the things to be sold and reach the largest possible segment that may be interested in buying it.',
        'image': 'kelshimall.jpg',
        'link': 'https://play.google.com/store/apps/details?id=com.keshi_mall.klshi_mall&hl=en'
      }, /*
      {
        'name': '',
        'description': '',
        'image': 'electroapp.png',
        'link': 'https://play.google.com/store/apps/details?id=com.electromall.app&hl=en'
      },*/
    ];

    return CarouselSlider(
      options: CarouselOptions(
          height: 900.0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          pageSnapping: true,
          scrollDirection: Axis.vertical,
          animateToClosest: true),
      items: projects.map((project) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: 900.h,
                margin: const EdgeInsets.symmetric(horizontal: 80.0),
                padding: 16.all,
                decoration: BoxDecoration(
                  borderRadius: 8.radiusAll,
                  color: widget.screenType == ScreenType.desktop
                      ? Colors.white.withOpacity(.05)
                      : Colors.black,
                ),
                child: widget.screenType == ScreenType.desktop
                    ? Row(
                        children: [
                          _image(project),
                          16.horizontalSpace,
                          _descriptions(project, context)
                        ],
                      )
                    : Column(
                        children: [
                          _image(project),
                          16.verticalSpace,
                          _descriptions(project, context)
                        ],
                      ));
          },
        );
      }).toList(),
    );
  }

  Expanded _image(Map<String, dynamic> project) => Expanded(
        flex: 1,
        child: HoverScaleImage(path: "assets/projects/${project['image']}"),
      );

  Expanded _descriptions(Map<String, dynamic> project, BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          EntranceFader(
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        launchUrlString(project['link']);
                      },
                      child: HoverTextAnimation(text: project['name'])),

                  Spacer(),
                  project['companyLogo'].toString().toAsset(w: 56.w, h: 56.h,)
                ],
              )),
          24.verticalSpace,
          EntranceFader(
            delay: const Duration(milliseconds: 500),
            child: Text(
              project['description'],
              maxLines: widget.screenType == ScreenType.desktop ? null : 10,
              style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                  fontSize: widget.sizes.subtitleFontSize,
                  overflow: widget.screenType == ScreenType.desktop ? null : TextOverflow.ellipsis,

                  color: Theme.of(context).themeColors.disabledButton),
            ),
          ),

        ],
      ),
    );
  }
}

class HoverScaleImage extends StatefulWidget {
  const HoverScaleImage({super.key, required this.path});

  final String path;

  @override
  _HoverScaleImageState createState() => _HoverScaleImageState();
}

class _HoverScaleImageState extends State<HoverScaleImage> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            widget.path,
            fit: isHovered ? BoxFit.fill : BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
