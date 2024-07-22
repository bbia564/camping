import 'package:bot_toast/bot_toast.dart';
import 'package:camping_ground/app/modules/diary_page/controllers/diary_page_controller.dart';
import 'package:camping_ground/app/tools/app_util.dart';
import 'package:camping_ground/app/tools/dc_database.dart';
import 'package:camping_ground/app/tools/models.dart';
import 'package:camping_ground/app/tools/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final campsiteName = "campsite name".obs;
  final hasFire = false.obs;
  final dateStr = "2024-07-06".obs;

  final changeCamp_fire = false.obs;
  final changeCamp_textControl = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getLocalDatas();
  }

  @override
  void onClose() {
    changeCamp_textControl.dispose();
    super.onClose();
  }

  void getLocalDatas() async {
    campsiteName.value = CGSharedPreferences.getString("campsite_name",
            defValue: "campsite name") ??
        "campsite name";
    hasFire.value =
        CGSharedPreferences.getBool("has_fire", defValue: false) ?? false;
    dateStr.value = CGAppTool.formatDateWithoutHour(dateTime: DateTime.now());
  }

  void changeCamp() async {
    if (changeCamp_textControl.text.isEmpty) {
      BotToast.showText(text: "please input camp name");
      return;
    }
    CGSharedPreferences.putString("campsite_name", changeCamp_textControl.text);
    CGSharedPreferences.putBool("has_fire", changeCamp_fire.value);
    await Future.delayed(const Duration(milliseconds: 100));
    getLocalDatas();
    Get.back();
  }

  void addDiary(String title, String contentStr) async {
    if (title.isEmpty) {
      BotToast.showText(text: "please input title");
      return;
    }
    if (contentStr.isEmpty) {
      BotToast.showText(text: "please input content");
      return;
    }
    final newmodel = CGDiaryModel();
    newmodel.location = title;
    newmodel.content = contentStr;
    newmodel.createTime = DateTime.now().millisecondsSinceEpoch;

    await CGDatabaseTool().insetDiaryModel(newmodel);
    if (Get.isRegistered<DiaryPageController>()) {
      Get.find<DiaryPageController>().getAllDatas();
    }

    Get.back();
  }

  void addMeModel(String name, double amout) async {
    if (name.isEmpty) {
      BotToast.showText(text: "please input name");
      return;
    }
    if (amout <= 0.0) {
      BotToast.showText(text: "please input amout");
      return;
    }
    final newmodel = CGMaterialsModel();
    newmodel.name = name;
    newmodel.amount = amout;
    newmodel.createTime = DateTime.now().millisecondsSinceEpoch;

    await CGDatabaseTool().insetMaterialsModel(newmodel);
    if (Get.isRegistered<DiaryPageController>()) {
      Get.find<DiaryPageController>().getAllDatas();
    }

    Get.back();
  }
}
