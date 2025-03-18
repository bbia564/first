import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lease_start/pages/lease_setting/lease_setting_logic.dart';
import 'package:styled_widget/styled_widget.dart';

class LeaseSettingView extends GetView<LeaseSettingLogic> {
  const LeaseSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Setting",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(height: 10),
            <Widget>[
              const Text("Clear Record"),
              IconButton(onPressed: () {
                Get.defaultDialog(
                  title: "Clear Record",
                  middleText: "Are you sure to clear the record?",
                  confirm: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        controller.cleanRecord();
                      },
                      child: const Text("Confirm")),
                  cancel: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Cancel")),
                );
              }, icon: Icon(Icons.delete))
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            Divider(color: Colors.grey[200]),
            const SizedBox(height: 8,),
            <Widget>[
              const Text("About Us"),
              const Text("1.0.0").paddingOnly(right: 18)
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
          ].toColumn(),
        ).decorated(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
      )),
    );
  }
}
