import 'package:get/get.dart';
import 'package:lease_start/pages/lease_add/lease_add_logic.dart';
import 'package:lease_start/pages/lease_home/lease_home_logic.dart';
import 'package:lease_start/pages/lease_setting/lease_setting_logic.dart';
import 'package:lease_start/pages/lease_tab/lease_tab_logic.dart';


class LeaseTabBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LeaseTabLogic());
    Get.lazyPut(() => LeaseHomeLogic());
    Get.lazyPut(() => LeaseAddLogic());
    Get.lazyPut(() => LeaseSettingLogic());
  }
}