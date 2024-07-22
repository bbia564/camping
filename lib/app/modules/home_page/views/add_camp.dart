import 'package:camping_ground/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:camping_ground/app/modules/home_page/views/pop_base_view.dart';
import 'package:camping_ground/app/tools/color_tool.dart';
import 'package:camping_ground/app/tools/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddCamp extends PopBaseView {
  const AddCamp({super.key});

  @override
  Widget contentView(mapdata) {
    var location = "";
    var contentText = "";
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
                CGText("Location", fontSize: 14),
                10.horizontalSpace,
                Expanded(
                    child: TextField(
                  textAlign: TextAlign.left,
                  maxLength: 20,
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: 'Input location',
                      hintStyle: TextStyle(
                          color: CGColorTool.color('#9D9D9D'),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal)),
                  onChanged: (value) {
                    location = value;
                    mapdata["location"] = location;
                  },
                )),
              ],
            )),
        CGDivider(),
        12.verticalSpace,
        CGText("Diary", fontSize: 14),
        SizedBox(
            width: double.infinity,
            height: 120.w,
            child: TextField(
              textAlign: TextAlign.left,
              maxLength: 200,
              maxLines: 20,
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
              decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintText: 'Input something',
                  hintStyle: TextStyle(
                      color: CGColorTool.color('#9D9D9D'),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal)),
              onChanged: (value) {
                contentText = value;
                mapdata["contentText"] = value;
              },
            ))
      ],
    );
  }

  @override
  String popTitle() {
    return "Add Camp Diary";
  }

  @override
  void submit(mapdata) {
    print(mapdata);
    final str = mapdata["location"];
    final ccc = mapdata["contentText"];
    Get.find<HomePageController>().addDiary(str, ccc);
    
  }
}
