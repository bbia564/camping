import 'package:camping_ground/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:camping_ground/app/modules/home_page/views/pop_base_view.dart';
import 'package:camping_ground/app/tools/color_tool.dart';
import 'package:camping_ground/app/tools/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PurchaseMaterials extends PopBaseView {
  const PurchaseMaterials({super.key});

  @override
  Widget contentView(mapdata) {
    var name = "";
    var amount = 0.0;
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
                CGText("Name", fontSize: 14),
                10.horizontalSpace,
                Expanded(
                    child: TextField(
                  textAlign: TextAlign.left,
                  maxLength: 20,
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: 'Input',
                      hintStyle: TextStyle(
                          color: CGColorTool.color('#9D9D9D'),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal)),
                  onChanged: (value) {
                    name = value;
                    mapdata["name"] = value;
                  },
                )),
              ],
            )),
        CGDivider(),
        SizedBox(
            height: 50.w,
            width: double.infinity,
            child: Row(
              children: [
                CGText("Amount", fontSize: 14),
                10.horizontalSpace,
                Expanded(
                    child: TextField(
                  textAlign: TextAlign.left,
                  maxLength: 20,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    CGAmountTextInputFormatter(),
                  ],
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: 'Input',
                      hintStyle: TextStyle(
                          color: CGColorTool.color('#9D9D9D'),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal)),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      amount = double.parse(value);
                      mapdata["amout"] = amount;
                    }
                  },
                )),
              ],
            )),
        CGDivider(),
      ],
    );
  }

  @override
  String popTitle() {
    return "Purchase materials";
  }

  @override
  void submit(mapdata) {
    print(mapdata);
    final str = mapdata["name"];
    final double amount = mapdata["amout"];
    Get.find<HomePageController>().addMeModel(str, amount);
  }
}

class CGAmountTextInputFormatter extends TextInputFormatter {
  final RegExp _exp = RegExp(r'^\d{0,5}(\.\d{0,2})?$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_exp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
