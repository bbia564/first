import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lease_start/pages/lease_add/lease_add_view.dart';
import 'package:lease_start/pages/lease_home/lease_home_view.dart';
import 'package:lease_start/pages/lease_tab/lease_tab_logic.dart';

import '../lease_setting/lease_setting_view.dart';

class LeaseTabView extends GetView<LeaseTabLogic> {
  const LeaseTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [LeaseHomeView(), const LeaseAddView(),LeaseSettingView()],
      ),
      bottomNavigationBar: Obx(() => _navLeaseBars()),
    );
  }

  Widget _navLeaseBars() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "History"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: "Add"),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: "Setting")
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
