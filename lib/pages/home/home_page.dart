import 'package:alhasan_abo_obaid/core/providers/page_provider.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/icon_manager.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/appbar.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/drawer.dart';
import 'package:alhasan_abo_obaid/pages/profile/profile_page.dart';
import 'package:alhasan_abo_obaid/pages/profile/profile_page_mobile.dart';
import 'package:alhasan_abo_obaid/pages/projects/projects_page.dart';
import 'package:alhasan_abo_obaid/pages/skills/skills_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late PageProvider pageProvider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    pageProvider = Provider.of<PageProvider>(context);
  }


  @override
  Widget build(BuildContext context) {
    ScreenType screenType = ScreenSizeUtil.getScreenType(context);
    Sizes sizes = Sizes.getSizes(screenType);

    return Scaffold(
      key: _scaffoldKey,
      //drawer: const CustomDrawer(),
      //drawerScrimColor: Colors.black.withOpacity(0.5),
      appBar: CustomAppBar(sizes: sizes, ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IconManager.pattern1),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: PageView(
          controller: pageProvider.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ScreenSizeUtil.getScreenType(context) == ScreenType.desktop ? ProfileSection(sizes: sizes): ProfileSectionMobile(sizes: sizes),
            SkillsPage(sizes: sizes),
            ProjectsSection(sizes: sizes, screenType: screenType),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                64.verticalSpace,
                "assets/icons/under_construction.png".toAsset(w: 150, h: 150),
                Text("Under Construction", style: TextStyle(fontSize: sizes.titleFontSize, fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            )
            //ProjectsSection(sizes: sizes, screenType: screenType),
          ],
        ),
      ),
    );
  }
}
