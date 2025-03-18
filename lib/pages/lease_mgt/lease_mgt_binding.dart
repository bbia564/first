import 'package:get/get.dart';

import 'lease_mgt_logic.dart';

class LeaseMgtBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
