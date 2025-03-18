import 'package:get/get.dart';
import 'package:lease_start/lease_db/data_base.dart';
import 'package:lease_start/lease_db/db_config.dart';

class LeaseHomeLogic extends GetxController{
  final LeaseDatabaseService leaseService = Get.find();
  late Future<List<Lease>> leaseFuture;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    leaseService.refreshLeases();
  }
}