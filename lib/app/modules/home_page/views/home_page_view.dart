import 'package:camping_ground/app/assets/assets.dart';
import 'package:camping_ground/app/modules/home_page/views/add_camp.dart';
import 'package:camping_ground/app/modules/home_page/views/change_camp.dart';
import 'package:camping_ground/app/modules/home_page/views/purchase_materials.dart';
import 'package:camping_ground/app/tools/color_tool.dart';
import 'package:camping_ground/app/tools/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: CGText("Campsite"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            CGGetContainer(
                radius: 10.w,
                height: 192.h,
                width: double.infinity,
                bgImg: const AssetImage(Assets.homeLogo),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CGText("Location",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: CGColorTool.color("#6A6A6A")),
                      Obx(() => CGText(controller.campsiteName.value)),
                      6.verticalSpace,
                      CGGetContainer(
                          radius: 4.w,
                          width: 100.w,
                          height: 26.h,
                          alignment: Alignment.center,
                          color: CGColorTool.color("#E8F7D9"),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                Assets.fireIcon,
                                width: 14.w,
                                height: 16.w,
                              ),
                              8.horizontalSpace,
                              Obx(() => CGText(
                                  controller.hasFire.isTrue
                                      ? "Fire-using"
                                      : "Fireless",
                                  fontSize: 12,
                                  textColor: CGColorTool.color("#69A92B"))),
                            ],
                          )),
                      14.verticalSpace,
                      Obx(() => CGText(controller.dateStr.value,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: CGColorTool.color("#959595"))),
                      26.verticalSpace,
                      InkWell(
                        onTap: () {
                          Get.dialog(const ChangeCamp());
                        },
                        child: CGGetContainer(
                            radius: 4.w,
                            width: 130.w,
                            height: 32.h,
                            alignment: Alignment.center,
                            color: CGColorTool.color("#69A92B"),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CGText("Change camp",
                                    fontSize: 12, textColor: Colors.white),
                                4.horizontalSpace,
                                Image.asset(
                                  Assets.arrowWhite,
                                  width: 16.w,
                                  height: 16.w,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                )),
            16.verticalSpace,
            InkWell(
              onTap: () {
                Get.dialog(const AddCamp());
              },
              child: CGGetContainer(
                  radius: 10.w,
                  width: double.infinity,
                  height: 94.h,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.addIcon,
                        width: 20.w,
                        height: 20.w,
                        fit: BoxFit.cover,
                      ),
                      10.horizontalSpace,
                      CGText("Add Camp Diary"),
                    ],
                  )),
            ),
            16.verticalSpace,
            InkWell(
                onTap: () {
                  Get.dialog(const PurchaseMaterials());
                },
                child: CGGetContainer(
                    radius: 10.w,
                    width: double.infinity,
                    height: 94.h,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Assets.addIcon,
                          width: 20.w,
                          height: 20.w,
                          fit: BoxFit.cover,
                        ),
                        10.horizontalSpace,
                        CGText("Add purchases"),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
