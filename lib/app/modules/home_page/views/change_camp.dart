import 'package:camping_ground/app/assets/assets.dart';
import 'package:camping_ground/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:camping_ground/app/modules/home_page/views/pop_base_view.dart';
import 'package:camping_ground/app/tools/color_tool.dart';
import 'package:camping_ground/app/tools/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangeCamp extends PopBaseView {
  const ChangeCamp({super.key});

  @override
  Widget contentView(mapdata) {
    return GetBuilder<HomePageController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 50.w,
                width: double.infinity,
                child: Row(
                  children: [
                    CGText("Camp name", fontSize: 14),
                    10.horizontalSpace,
                    Expanded(
                        child: TextField(
                      controller: controller.changeCamp_textControl,
                      textAlign: TextAlign.left,
                      maxLength: 20,
                      style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      decoration: InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          hintText: 'Input Camp name',
                          hintStyle: TextStyle(
                              color: CGColorTool.color('#9D9D9D'),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal)),
                    )),
                  ],
                )),
            CGDivider(),
            16.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => controller.changeCamp_fire.isTrue
                    ? CGGetContainer(
                        radius: 4.w,
                        color: CGColorTool.color("#EFEFEF"),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.w, horizontal: 8.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CGText("Fire-using",
                                fontSize: 14, fontWeight: FontWeight.w400),
                            8.horizontalSpace,
                            Image.asset(
                              Assets.iconSelected,
                              height: 11.w,
                              width: 11.w,
                            )
                          ],
                        ))
                    : InkWell(
                        onTap: () {
                          controller.changeCamp_fire.value = true;
                        },
                        child: CGText("Fire-using",
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )),
                24.horizontalSpace,
                Obx(() => controller.changeCamp_fire.isFalse
                    ? CGGetContainer(
                        radius: 4.w,
                        color: CGColorTool.color("#EFEFEF"),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.w, horizontal: 8.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CGText("Fireless",
                                fontSize: 14, fontWeight: FontWeight.w400),
                            8.horizontalSpace,
                            Image.asset(
                              Assets.iconSelected,
                              height: 11.w,
                              width: 11.w,
                            )
                          ],
                        ))
                    : InkWell(
                        onTap: () {
                          controller.changeCamp_fire.value = false;
                        },
                        child: CGText("Fireless",
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  String popTitle() {
    return "Change Camp";
  }

  @override
  void submit(mapdata) {
    Get.find<HomePageController>().changeCamp();
  }
}
