import 'package:alhasan_abo_obaid/core/providers/page_provider.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/theme_enums.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/theme_utils.dart';
import 'package:alhasan_abo_obaid/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PageProvider>(
        create: (context) => PageProvider(),
      ),
    ],
    child: ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      fontSizeResolver: FontSizeResolvers.height,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Alhasan Abo Obaid Portfolio",
        theme: getThemeData(ThemeType.LightTheme),
        home: const HomePage(),
      ),
    ),
  ));
}
