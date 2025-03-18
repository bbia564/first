import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../lease_db/data_base.dart';

class LeaseSettingLogic extends GetxController {
  final LeaseDatabaseService service = Get.find();

  void cleanRecord() async{
    service.cleanLease();
    Get.snackbar("Success", "Clear successfully",
        backgroundColor: Colors.grey[800], colorText: Colors.white);
  }
}
