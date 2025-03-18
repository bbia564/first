import 'package:get/get.dart';
import 'lease_add_logic.dart';


class LeaseAddBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LeaseAddLogic());
  }
}