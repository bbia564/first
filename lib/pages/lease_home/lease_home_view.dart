import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lease_start/pages/lease_edit/lease_edit_bindings.dart';
import 'package:lease_start/pages/lease_edit/lease_edit_view.dart';
import 'package:styled_widget/styled_widget.dart';
import 'lease_home_logic.dart';
import 'package:photo_view/photo_view.dart';

class LeaseHomeView extends GetView<LeaseHomeLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: <Widget>[
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 30, bottom: 30),
          child: Text(
            "Cleaning History",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Obx(() {
        if (controller.leaseService.lease.isEmpty) {
          return const Expanded(
              child: Center(
            child: Text("No Data"),
          ));
        }
        return Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final item =
                  controller.leaseService.lease.reversed.toList()[index];
              return SizedBox(
                width: double.infinity,
                height: 130,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: <Widget>[
                    // Container(
                    //   width: 120,
                    //   child: PhotoView(imageProvider:FileImage(File(item.imageUrl)),),
                    // ),
                    Image.memory(
                      item.imageUrl,
                      width: 100,
                      height: 90,
                      fit: BoxFit.cover,
                    ).clipRRect(all: 16),
                    Expanded(
                      child: Container(
                              child: <Widget>[
                        Text(
                          "${item.time.month}/${item.time.day}/${item.time.year}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.address,
                          style: const TextStyle(color: Colors.black54),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "${item.area} m²",
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
                          .paddingOnly(left: 16),
                    ),
                    // const Spacer(),
                    IconButton(
                      onPressed: () {
                        Get.toNamed('/leaseEdit',arguments: item);
                      },
                      icon: const Icon(Icons.edit),
                      iconSize: 20,
                    )
                  ].toRow(),
                ),
              ).decorated(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    const BoxShadow(
                        color: Color(0xFFBDBDBD),
                        offset: Offset(0.0, 6.0),
                        blurRadius: 5.0,
                        spreadRadius: 0)
                  ]);
            },
            itemCount: controller.leaseService.lease.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 20,
              );
            },
          ),
        ));
      })
    ].toColumn()));
  }
}
