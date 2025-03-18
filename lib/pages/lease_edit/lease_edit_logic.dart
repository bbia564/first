import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lease_start/lease_db/db_config.dart';
import 'package:lease_start/pages/lease_tab/lease_tab_binding.dart';
import 'package:lease_start/pages/lease_tab/lease_tab_view.dart';
import 'dart:typed_data';
import '../../lease_db/data_base.dart';

class LeaseEditLogic extends GetxController {
  late Lease info;
  Rx<DateTime?> selectedDate = Rx<DateTime>(DateTime.now());
  late TextEditingController areaController;
  late TextEditingController addressController;
  late TextEditingController selectDateread;
  final LeaseDatabaseService leaseService = LeaseDatabaseService();
  final FocusNode focusNode = FocusNode();
  late Uint8List? imageBytes;

  @override
  void onInit() {
    super.onInit();
    listenDateFocus();
    info = Get.arguments as Lease;
    areaController = TextEditingController(text: info.area.toString());
    addressController = TextEditingController(text: info.address);
    selectDateread = TextEditingController(
        text: "${info.time.month}/${info.time.day}/${info.time.year}");
    imageBytes = info.imageUrl;
  }

  void listenDateFocus() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        selectDate();
      }
    });
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageBytes = await image.readAsBytes();
      update();
    }
  }

  Future<void> selectDate() async {
    final DateTime? piked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (piked != null && piked != selectedDate.value) {
      selectedDate.value = piked;
      selectDateread.text = "${piked.month}/${piked.day}/${piked.year}";
      update();
    }
    FocusScope.of(Get.context!).unfocus();
  }

  void cleanImage() {
    imageBytes = null;
    update();
  }

  void clean() {
    imageBytes = null;
    selectedDate.value = DateTime.now();
    areaController.clear();
    addressController.clear();
    selectDateread.clear();
  }

  void updateLease() async {
    if (imageBytes != null &&
        areaController.text != '' &&
        addressController.text != '' &&
        selectDateread.text != '') {
      final newLease = Lease(
          id: info.id,
          imageUrl: imageBytes!,
          area: double.parse(areaController.text),
          address: addressController.text,
          time: selectedDate.value!);
      await leaseService.updateLease(newLease);
      clean();
      Get.back();
      Get.snackbar("Updated successfully", "Record updated successfully",
          backgroundColor: Colors.grey[800], colorText: Colors.white);
    } else {
      Get.snackbar("Error", "Please input",
          backgroundColor: Colors.grey[800], colorText: Colors.white);
    }
  }

  @override
  void dispose() {
    selectDateread.dispose();
    focusNode.dispose();
    areaController.dispose();
    addressController.dispose();
    selectDateread.dispose();
    super.dispose();
  }
}
