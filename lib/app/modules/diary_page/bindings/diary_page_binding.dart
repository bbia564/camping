import 'package:get/get.dart';

import '../controllers/diary_page_controller.dart';

class DiaryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiaryPageController>(
      () => DiaryPageController(),
    );
  }
}
