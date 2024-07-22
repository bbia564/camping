import 'package:camping_ground/app/modules/diary_page/views/diary_page_view.dart';
import 'package:camping_ground/app/modules/home_page/views/home_page_view.dart';
import 'package:camping_ground/app/modules/settings_page/views/settings_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPageController extends GetxController {

  RxInt currentIndex = 0.obs;

  final PageController pageController = PageController(initialPage: 0);

  
  List<Widget> pageList = [
    const HomePageView(),
    const DiaryPageView(),
    const SettingsPageView(),
  ];

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

  void changeCurrentPageIndex(int index) {
    currentIndex.value = index;
  }


}

