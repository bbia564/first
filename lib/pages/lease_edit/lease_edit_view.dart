import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'lease_edit_logic.dart';

class LeaseEditView extends GetView<LeaseEditLogic> {
  const LeaseEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit"),
        ),
        body: GetBuilder<LeaseEditLogic>(
            init: LeaseEditLogic(),
            builder: (_) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      child: <Widget>[
                        const Text("Cover"),
                        const SizedBox(height: 16),
                        controller.imageBytes == null
                            ? InkWell(
                                onTap: () {
                                  controller.pickImage();
                                },
                                child: SizedBox(
                                  width: 140,
                                  height: 140,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.grey[500],
                                    size: 60,
                                  ),
                                ).decorated(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[100]),
                              )
                            : Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topRight,
                                children: [
                                  Image.memory(
                                    width: 140,
                                    height: 140,
                                    controller.imageBytes!,
                                    fit: BoxFit.cover,
                                  ).clipRRect(all: 16),
                                  Positioned(
                                      top: -10,
                                      right: -10,
                                      child: IconButton(
                                        onPressed: () {
                                          controller.cleanImage();
                                        },
                                        icon: const Icon(Icons.cancel),
                                        color: Colors.white,
                                        style: ButtonStyle(
                                            iconSize:
                                                WidgetStateProperty.all(26)),
                                      ))
                                ],
                              )
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                    ).decorated(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: <Widget>[
                        const Text("House Area"),
                        TextField(
                          controller: controller.areaController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 14, height: 1),
                          decoration: const InputDecoration(
                              hintText: "Please Enter the house area",
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                    ).decorated(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: <Widget>[
                        const Text("Address"),
                        TextField(
                          controller: controller.addressController,
                          style: const TextStyle(fontSize: 14, height: 1),
                          decoration: const InputDecoration(
                              hintText: "Please Enter the address",
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                    ).decorated(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: <Widget>[
                        const Text("Date"),
                        TextField(
                            controller: controller.selectDateread,
                            focusNode: controller.focusNode,
                            readOnly: true,
                            style: const TextStyle(fontSize: 14, height: 1),
                            decoration: const InputDecoration(
                                hintText: "Please select date",
                                hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))))
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                    ).decorated(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white),
                          onPressed: () {
                            controller.updateLease();
                          },
                          child: const Text("Update")),
                    )
                  ].toColumn(),
                ),
              );
            }));
  }
}
