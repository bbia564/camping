
import 'package:camping_ground/app/tools/color_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class CEKeepAliveWrapper extends StatefulWidget {
  const CEKeepAliveWrapper(
      {super.key, @required this.child, this.keepAlive = true});

  final Widget? child;
  final bool keepAlive;

  @override
  State<CEKeepAliveWrapper> createState() => _CEKeepAliveWrapperState();
}

class _CEKeepAliveWrapperState extends State<CEKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant CEKeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}

Container CGGetContainer(
    {Key? key,
    double? width,
    double? height,
    double radius = 0,
    Color color = Colors.white,
    double borderWidth = 0.0,
    Color borderColor = const Color(0x00000fff),
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    Widget? child,
    Gradient? gradient,
    List<BoxShadow>? shadow,
    ImageProvider? bgImg,
    BoxFit? fit,
    Clip? clipBehavior}) {
  return Container(
    key: key,
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius)),
        border: Border.all(color: borderColor, width: borderWidth),
        color: color,
        gradient: gradient,
        boxShadow: shadow,
        image: bgImg != null
            ? DecorationImage(
                image: bgImg,
                fit: fit ?? BoxFit.contain,
              )
            : null),
    alignment: alignment,
    padding: padding,
    margin: margin,
    clipBehavior: clipBehavior ?? Clip.antiAlias,
    child: child,
  );
}

// ignore: non_constant_identifier_names
Widget CGText(
  String text, {
  double fontSize = 16,
  Color? textColor,
  int? maxline,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(
    text,
    maxLines: maxline,
    style: TextStyle(
        color: textColor ?? CGColorTool.color("#454545"),
        fontSize: fontSize.sp,
        fontWeight: fontWeight),
  );
}

Widget CGDivider({Color? color}) {
  return Divider(
    color: color ?? CGColorTool.color("#EBEBEB"),
    height: 1,
    thickness: 0,
    indent: 0,
    endIndent: 0,
  );
}


SMShowDatePicker(String title, Function(DateTime chooseDateTime) saveAction,
    {CupertinoDatePickerMode type = CupertinoDatePickerMode.date,
    DateTime? maxDatetime,
    DateTime? minDatetime,
    DateTime? initialDateTime}) {
  var today = DateTime.now();
  late DateTime chooseDate = DateTime.now();
  Get.bottomSheet(Container(
    height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.w))),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close_fullscreen_outlined,
                    color: CGColorTool.color("#AAAAAA"),
                  )),
              CGText(title, fontWeight: FontWeight.w400),
              TextButton(
                  onPressed: () {
                    saveAction(chooseDate);
                    Get.back();
                  },
                  child:
                      CGText("保存", textColor: CGColorTool.color("#B45555")))
            ],
          ),
        ),
        CGDivider(),
        Expanded(
          flex: 1,
          child: CupertinoDatePicker(
            mode: type,
            initialDateTime:
                initialDateTime ?? DateTime(today.year, today.month, today.day),
            minimumDate: minDatetime ?? DateTime(1970, 1, 1),
            maximumDate:
                maxDatetime ?? DateTime(today.year, today.month, today.day),
            maximumYear:
                maxDatetime != null ? maxDatetime.year : DateTime.now().year,
            minimumYear: minDatetime?.year ?? 1970,
            use24hFormat: true,
            onDateTimeChanged: (dayTime) {
              chooseDate = dayTime;
            },
          ),
        )
      ],
    ),
  ));
}
