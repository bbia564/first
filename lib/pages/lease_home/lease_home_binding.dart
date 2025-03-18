import 'package:get/get.dart';
import 'package:lease_start/pages/lease_home/lease_home_logic.dart';


class LeaseHomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LeaseHomeLogic());
  }

}