import 'package:camping_ground/app/assets/assets.dart';
import 'package:camping_ground/app/tools/color_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/root_page_controller.dart';

class RootPageView extends GetView<RootPageController> {
  const RootPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              controller.currentIndex.value = value;
            },
            children: controller.pageList,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            fixedColor: CGColorTool.color("#69A92B"),
            unselectedLabelStyle: TextStyle(
                color: CGColorTool.color("#292929"),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
            selectedLabelStyle: TextStyle(
                color: CGColorTool.color("#292929"),
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
            onTap: (value) {
              controller.currentIndex.value = value;
              controller.pageController.jumpToPage(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.homeNormal),
                  activeIcon: _tbTbarItem(Assets.homeSelected),
                  label: "Campsite"),
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.listNormal),
                  activeIcon: _tbTbarItem(Assets.listSelected),
                  label: "Diary"),
              BottomNavigationBarItem(
                label: "Settings",
                icon: _tbTbarItem(Assets.mineNormal),
                activeIcon: _tbTbarItem(Assets.mineSelected),
              )
            ],
          ),
        ));
  }

  Widget _tbTbarItem(String name) {
    return Image.asset(
      name,
      height: 22.h,
      width: 22.h,
      fit: BoxFit.cover,
    );
  }
}
