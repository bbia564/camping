import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:camping_ground/app/modules/settings_page/camp/binding.dart';
import 'package:camping_ground/app/modules/settings_page/camp/view.dart';
import 'package:camping_ground/app/tools/app_util.dart';
import 'package:camping_ground/app/tools/color_tool.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/modules/diary_page/bindings/diary_page_binding.dart';
import 'app/modules/diary_page/views/diary_page_view.dart';
import 'app/modules/home_page/bindings/home_page_binding.dart';
import 'app/modules/home_page/views/home_page_view.dart';
import 'app/modules/root_page/bindings/root_page_binding.dart';
import 'app/modules/root_page/views/root_page_view.dart';
import 'app/modules/settings_page/bindings/settings_page_binding.dart';
import 'app/modules/settings_page/views/ground.dart';
import 'app/modules/settings_page/views/settings_page_view.dart';

void main() {
  runApp(_initApp());
}

Widget ceInitGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  return GetMaterialApp(
    darkTheme: ThemeData.dark(),
    useInheritedMediaQuery: true,
    themeMode: ThemeMode.light,
    fallbackLocale: const Locale("zh", "CN"),
    debugShowCheckedModeBanner: false,
    initialRoute: '/in',
    getPages: Pags,
    defaultTransition: Transition.rightToLeft,
    theme: ThemeData(
        scaffoldBackgroundColor: CGColorTool.color("#F8F8F8"),
        indicatorColor: Colors.grey,
        brightness: Brightness.light,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.white.withOpacity(0),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: CGColorTool.color("#0F0F0F")),
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.transparent,
              statusBarColor: Colors.transparent),
          backgroundColor: CGColorTool.color("#F8F8F8"),
          scrolledUnderElevation: 0.0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.white)),
    builder: builder,
    navigatorObservers: [BotToastNavigatorObserver()],
    supportedLocales: const [
      Locale('zh', 'CN'),
      Locale('en', 'US'),
    ],
    localizationsDelegates: const [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
  );
}

_initApp() {
  if (!kIsWeb && Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  _setBotToast();

  Widget body = ceInitGetMaterialApp(
    builder: (context, child) {
      final botToastBuilder = BotToastInit();

      return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (p0, p1) {
          Widget body = GestureDetector(
            onTap: () {
              CGAppTool.keyboardDis(context);
            },
            child: child,
          );
          body = botToastBuilder(context, body);
          return body;
        },
      );
    },
  );
  return body;
}

void _setBotToast() {
  BotToast.defaultOption.notification.animationDuration =
      const Duration(seconds: 2);
}
List<GetPage<dynamic>> Pags = [
  GetPage(
    name: '/in',
    page: () => const GRPage(),
    binding: GRBind()
  ),
  GetPage(
    name: '/diary-page',
    page: () => const DiaryPageView(),
    binding: DiaryPageBinding(),
  ),
  GetPage(
    name: '/settings-page',
    page: () => const SettingsPageView(),
    binding: SettingsPageBinding(),
  ),
  GetPage(
    name: '/home-page',
    page: () => const HomePageView(),
    binding: HomePageBinding(),
  ),
  GetPage(
    name:'/root-page',
    page: () => const RootPageView(),
    binding: RootPageBinding(),
  ),
  GetPage(
    name:'/ground-page',
    page: () => const GroundPage(),
  ),
];