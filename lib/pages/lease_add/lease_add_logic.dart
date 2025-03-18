import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lease_start/lease_db/data_base.dart';
import 'package:image_picker/image_picker.dart';

import '../../lease_db/db_config.dart';
import '../lease_tab/lease_tab_logic.dart';

class LeaseAddLogic extends GetxController {
  Rx<DateTime?> selectedDate = Rx<DateTime>(DateTime.now());
  final TextEditingController areaController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController selectDateread = TextEditingController();
  final LeaseDatabaseService leaseService = LeaseDatabaseService();
  final FocusNode focusNode = FocusNode();
  Uint8List? imageBytes;

  @override
  void onInit() {
    super.onInit();
    listenDateFocus();
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

  void addLease() async {
    if (imageBytes != null &&
        areaController.text != '' &&
        addressController.text != '' &&
        selectDateread.text != '') {
      final newLease = Lease(
          id: 0,
          imageUrl: imageBytes!,
          area: double.parse(areaController.text),
          address: addressController.text,
          time: selectedDate.value!);
      await leaseService.addLease(newLease);
      Get.snackbar("Added successfully", "Record added successfully",
          backgroundColor: Colors.grey[800], colorText: Colors.white);
      clean();
      LeaseTabLogic tabLogic = Get.find();
      tabLogic.currentIndex.value = 0;
      tabLogic.pageController.jumpToPage(0);
    } else {
      Get.snackbar("Error", "Please input",
          backgroundColor: Colors.grey[800], colorText: Colors.white);
    }
  }

  @override
  void dispose() {
    selectDateread.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
