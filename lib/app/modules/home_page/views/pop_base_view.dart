import 'package:camping_ground/app/tools/color_tool.dart';
import 'package:camping_ground/app/tools/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

abstract class PopBaseView extends StatelessWidget {
  const PopBaseView({super.key});

  String popTitle();
  Widget contentView(Map<String, dynamic> data);

  void submit(Map<String, dynamic> datas);
  @override
  Widget build(BuildContext context) {


    var  mapData = <String, dynamic>{};
    return Material(
      color: Colors.transparent,
      child:  Center(
      child: CGGetContainer(
          radius: 10.w,
          width: 345.w,
          padding: EdgeInsets.all(17.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  CGText(popTitle()),
                  InkWell(
                    onTap: Get.back,
                    child: CGText("Cancel",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: CGColorTool.color("#7C7C7C")),
                  )
                ],
              ),
              ),
              16.verticalSpace,
              CGDivider(),
              contentView(mapData),
              16.verticalSpace,
              InkWell(
                onTap: () {
                  submit(mapData);
                },
                child: CGGetContainer(
                  radius: 4.w,
                  height: 50.h,
                  width: double.infinity,
                  color: CGColorTool.color("#69A92B"),
                  alignment: Alignment.center,
                  child: CGText("Submit",
                      fontSize: 14, textColor: Colors.white)),
              )
            ],
          )),
    ));
  }
}
