import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lease_mgt_logic.dart';

class LeaseMgtView extends GetView<PageLogic> {
  const LeaseMgtView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.effertz.value
              ? const CircularProgressIndicator(color: Colors.purple)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.kwrviux();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
