import 'package:camping_ground/app/modules/diary_page/controllers/diary_page_controller.dart';
import 'package:camping_ground/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:camping_ground/app/modules/settings_page/controllers/settings_page_controller.dart';
import 'package:camping_ground/app/tools/dc_database.dart';
import 'package:camping_ground/app/tools/shared_preferences.dart';
import 'package:get/get.dart';

import '../controllers/root_page_controller.dart';

class RootPageBinding extends Bindings {
  @override
  void dependencies() {
    CGSharedPreferences.initialize();
    CGDatabaseTool().init();
    Get.lazyPut<RootPageController>(
      () => RootPageController(),
    );
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
    Get.lazyPut<DiaryPageController>(
      () => DiaryPageController(),
    );
    Get.lazyPut<SettingsPageController>(
      () => SettingsPageController(),
    );
  }
}
