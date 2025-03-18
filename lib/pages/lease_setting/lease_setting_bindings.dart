import 'package:get/get.dart';
import 'lease_setting_logic.dart';

class LeaseSettingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LeaseSettingLogic());
  }

}