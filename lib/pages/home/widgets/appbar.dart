import 'package:alhasan_abo_obaid/core/providers/page_provider.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/constants.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/core/widgets/custom_button.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.sizes});

  final Sizes sizes;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(sizes.appBarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late PageProvider pageProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pageProvider = Provider.of<PageProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenType screenType = ScreenSizeUtil.getScreenType(context);
    bool isDesktop = screenType == ScreenType.desktop;

    return AppBar(
      backgroundColor: Colors.black87,
      elevation: 1,
      automaticallyImplyLeading: ScreenSizeUtil.getScreenType(context) == ScreenType.mobile,
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.sizes.sectionPadding),
        child: Align(
            alignment: Alignment.center,
            child:  _buildDesktopNav(pageProvider)),
      ),
    );
  }

  Widget _buildDesktopNav(PageProvider pageProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            _navItem("Home", 0),
            _navItem("Skills", 1),
            _navItem("Latest Projects", 2),
            //_navItem("Contact", 3),
          ],
        ),

        const Spacer(),
        if(ScreenSizeUtil.getScreenType(context) == ScreenType.desktop)
        EntranceFader(
          offset: const Offset(50, 0),
          child: CustomButton(
            title: "Download CV",
            onPressed: () {
              launchUrlString(Constants.cvUrl);
            },
          ),
        ),
        4.horizontalSpace,
        if(ScreenSizeUtil.getScreenType(context) == ScreenType.desktop)
          EntranceFader(
            offset: const Offset(50, 0),
            delay: const Duration(milliseconds: 500),
            child: Row(
            children: [
              _socialIcon(FontAwesomeIcons.facebook, onTap: () {
                launchUrlString("https://www.facebook.com/alhasan.aboobaid");
              },),
              //_socialIcon(FontAwesomeIcons.xTwitter),
              _socialIcon(FontAwesomeIcons.linkedin, onTap: () {
                launchUrlString("www.linkedin.com/in/alhasan-abo-obaid-602501124");
              },),
              _socialIcon(FontAwesomeIcons.github, onTap: () {
                launchUrlString("https://github.com/alhasan-s-aboobaid");
              },),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileNav() {
    return Row(
      children: [
        Icon(Icons.person, color: Colors.white, size: 16.h), // Hamburger Menu
        4.horizontalSpace,
        Text("Alhasan Abo Obaid",
            style: Theme.of(context)
                .styles
                .bodyRegularLarge
                .copyWith(color: Theme.of(context).themeColors.textBody)),

      ],
    );
  }

  Widget _navItem(String title, int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {},
      onExit: (_) {},
      child: GestureDetector(
        onTap: () {
          pageProvider.setCurrentIndex(index);
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAnimatedText(title, pageProvider, index),
               /* if(pageProvider.currentIndex == index)
                  2.verticalSpace,
                if(pageProvider.currentIndex == index)
                  Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).themeColors.primaryLight
                  ),
                )*/
              ],
            )),
      ),
    );
  }

  Widget _buildAnimatedText(String text, PageProvider pageState, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: pageState.currentIndex == index ? 1 : 0),
      duration: const Duration(milliseconds: 600),
      builder: (context, progress, child) {
        // Calculate the number of characters to be filled based on the progress
        int charsToFill = (progress * text.length).toInt();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(text.length, (i) {
            return Text(
              text[i],
              style: Theme.of(context).styles.headingLarge.copyWith(
                fontSize: ScreenSizeUtil.getScreenType(context) == ScreenType.desktop ? null : 16.sp,
                color: i < charsToFill
                    ? Theme.of(context).themeColors.primaryColor // Color for filled characters
                    : Theme.of(context).themeColors.disabledButton,
              )
            );
          }),
        );
      },
    );
  }

  Widget _socialIcon(IconData icon, {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap ?? (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
