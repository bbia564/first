import 'package:get/get.dart';
import 'package:lease_start/pages/lease_edit/lease_edit_logic.dart';

class LeaseEditBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LeaseEditLogic());
  }
}