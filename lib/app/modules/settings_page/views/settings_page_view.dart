import 'package:camping_ground/app/assets/assets.dart';
import 'package:camping_ground/app/tools/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/settings_page_controller.dart';

class SettingsPageView extends GetView<SettingsPageController> {
  const SettingsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    final models = [
      {"title": "Clear", "img": Assets.settingsClear,"index":0},
      {"title": "Share", "img": Assets.settingsShare,"index":1},
      {"title": "Appraise", "img": Assets.settingsCommon,"index":2},
      {"title": "About", "img": Assets.settingsAbout,"index":3}
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body:Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: models.map((e)=> InkWell(
          onTap: () {
            controller.cellTaped(e["index"] as int);
          },
          child: CGGetContainer(
            radius: 10.w,
            height: 50.h,
            
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 10.w),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                14.horizontalSpace,
                Image.asset(e["img"] as String,height: 24.h,width: 24.w,fit: BoxFit.cover,),
                12.horizontalSpace,
                CGText("${e["title"]}",fontWeight: FontWeight.w400)
              ],
            )
          ),
        )).toList(),
      ),),
    );
  }
}
