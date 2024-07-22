import 'package:camping_ground/app/tools/app_util.dart';
import 'package:camping_ground/app/tools/color_tool.dart';
import 'package:camping_ground/app/tools/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/diary_page_controller.dart';

class DiaryPageView extends GetView<DiaryPageController> {
  const DiaryPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final meView = Obx(() => controller.allMeModel.isEmpty
        ? Center(
            child: CGText("no datas",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: CGColorTool.color("#999999")),
          )
        : ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.allMeModel.length,
            itemBuilder: (context, index) {
              final item = controller.allMeModel[index];

              return CGGetContainer(
                  radius: 10.w,
                  width: double.infinity,
                  padding: EdgeInsets.all(14.w),
                  margin: EdgeInsets.only(bottom: 16.w),
                  color: CGColorTool.color("#F8F8F8"),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CGText("Purchase of materials",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textColor: CGColorTool.color("#767676")),
                        8.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CGText(item.name ?? "-", fontSize: 14),
                            CGText("${item.amount?.toStringAsFixed(2)}",
                                fontSize: 14,
                                textColor: CGColorTool.color("#69A92B")),
                          ],
                        )
                      ]));
            },
          ));

    final diaryView = Obx(() => controller.allDiary.isEmpty
        ? Center(
            child: CGText("no datas",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: CGColorTool.color("#999999")),
          )
        : ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.allDiary.length,
            itemBuilder: (context, index) {
              final item = controller.allDiary[index];

              return CGGetContainer(
                  radius: 10.w,
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  margin: EdgeInsets.only(bottom: 16.w),
                  color: CGColorTool.color("#F8F8F8"),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 46.h,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CGText("Date",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor: CGColorTool.color("#6A6A6A")),
                                4.verticalSpace,
                                Expanded(
                                    child: CGText(
                                        CGAppTool.formatDateWithoutHour(
                                            dateTime: DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    item.createTime!)))),
                              ],
                            )),
                            14.horizontalSpace,
                            Flexible(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CGText("Location",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor: CGColorTool.color("#6A6A6A")),
                                4.verticalSpace,
                                Expanded(child: CGText(item.location ?? "-")),
                              ],
                            ))
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      CGDivider(color: CGColorTool.color("#E0E0E0")),
                      16.verticalSpace,
                      CGText(
                        item.content ?? "-",
                        fontSize: 14,
                        maxline: 20,
                        fontWeight: FontWeight.w400,
                        textColor: CGColorTool.color("#6A6A6A"),
                      )
                    ],
                  ));
            },
          ));

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          // height: 40.w,
          width: 300.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(() {
                final selected = controller.selectedIndex.value == 0;
                return InkWell(
                    onTap: () {
                      controller.selectedIndex.value = 0;
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CGText("Diary",
                            fontWeight:
                                selected ? FontWeight.bold : FontWeight.w400),
                        16.verticalSpace,
                        selected
                            ? Container(
                                width: 100.w,
                                height: 4.w,
                                color: CGColorTool.color("#69A92B"),
                              )
                            : SizedBox(
                                height: 4.w,
                                width: 100,
                              )
                      ],
                    ));
              }),
              Obx(() {
                final selected = controller.selectedIndex.value == 1;
                return InkWell(
                  onTap: () {
                    controller.selectedIndex.value = 1;
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CGText("Materials",
                          fontWeight:
                              selected ? FontWeight.bold : FontWeight.w400),
                      16.verticalSpace,
                      selected
                          ? Container(
                              width: 100.w,
                              height: 4.w,
                              color: CGColorTool.color("#69A92B"),
                            )
                          : SizedBox(
                              height: 4.w,
                              width: 100,
                            )
                    ],
                  ),
                );
              })
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: CGGetContainer(
          radius: 10.w,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.all(16.w),
          child: Obx(()=>controller.selectedIndex.value == 0 ? diaryView : meView)),
    );
  }
}
