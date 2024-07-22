import 'package:bot_toast/bot_toast.dart';
import 'package:camping_ground/app/modules/diary_page/controllers/diary_page_controller.dart';
import 'package:camping_ground/app/tools/ce_dialog.dart';
import 'package:camping_ground/app/tools/dc_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void cellTaped(int index) {
    if (index == 0) {
      showclearAleart();
    } else if (index == 1) {
      Share.share('check out my website', subject: 'Look what I made!');
    } else if (index == 2) {
      showVersionAleart();
    } else if (index == 3) {
      showVersionAleart();
    }
  }

  void showclearAleart() {
    Get.dialog(Center(
      child: DCDialog(
        title: "Tips",
        contentStr: "Are you sure to clear all records",
        okAction: cleanDatas,
      ),
    ));
  }

  void showVersionAleart() {
    Get.dialog(Center(
      child: DCDialog(
        title: "Version",
        contentStr: "V1.0.0",
        okAction: Get.back,
      ),
    ));
  }

  void cleanDatas() async {
    Get.back();
    await CGDatabaseTool().clean();
    if (Get.isRegistered<DiaryPageController>()) {
      Get.find<DiaryPageController>().getAllDatas();
    }

    BotToast.showText(text: "Clear Success");
  }
}
