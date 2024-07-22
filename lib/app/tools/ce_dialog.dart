
import 'package:camping_ground/app/tools/color_tool.dart';
import 'package:camping_ground/app/tools/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DCAmountTextInputFormatter extends TextInputFormatter {
  final RegExp _exp = RegExp(r'^\d{0,5}(\.\d{0,1})?$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_exp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

class DCDialog extends StatelessWidget {
  final String title;
  final String contentStr;
  final Function() okAction;
  final Function()? cancleAction;
  const DCDialog(
      {super.key,
      this.cancleAction,
      required this.okAction,
      required this.title,
      required this.contentStr});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: CGGetContainer(
            radius: 10.w,
            width: 300.w,
            height: 180.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                14.verticalSpace,
                CGText(title, fontSize: 14),
                13.verticalSpace,
                CGText(contentStr),
                20.verticalSpace,
                Divider(
                  color: CGColorTool.color("#EFEFEF"),
                ),
                SizedBox(
                  height: 46.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: Get.back,
                          child: Container(
                            alignment: Alignment.center,
                            child: CGText("Cancel",
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      CGGetContainer(
                        height: 30.h,
                        width: 1,
                        color: CGColorTool.color("#EFEFEF"),
                      ),
                      Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: okAction,
                            child: Container(
                              alignment: Alignment.center,
                              child: CGText("Ok",
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}
