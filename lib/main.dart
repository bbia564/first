import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lease_start/pages/default_components/default_tool.dart';
import 'package:lease_start/pages/lease_add/lease_add_bindings.dart';
import 'package:lease_start/pages/lease_add/lease_add_view.dart';
import 'package:lease_start/pages/lease_edit/lease_edit_bindings.dart';
import 'package:lease_start/pages/lease_edit/lease_edit_view.dart';
import 'package:lease_start/pages/lease_home/lease_home_binding.dart';
import 'package:lease_start/pages/lease_home/lease_home_view.dart';
import 'package:lease_start/pages/lease_mgt/lease_mgt_binding.dart';
import 'package:lease_start/pages/lease_mgt/lease_mgt_view.dart';
import 'package:lease_start/pages/lease_setting/lease_setting_bindings.dart';
import 'package:lease_start/pages/lease_setting/lease_setting_view.dart';
import 'package:lease_start/pages/lease_tab/lease_tab_binding.dart';
import 'package:lease_start/pages/lease_tab/lease_tab_view.dart';
import 'package:lease_start/pages/network_fail/no_network_binding.dart';
import 'package:lease_start/pages/network_fail/no_network_view.dart';

import 'lease_db/data_base.dart';

main() async{
  Get.put(LeaseDatabaseService());
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/init',
      getPages:LeaseGes,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}
List<GetPage<dynamic>> LeaseGes = [
  GetPage(name: '/init', page: () => const LeaseMgtView(),binding: LeaseMgtBinding()),
  GetPage(name: '/leastTab', page: () => const LeaseTabView(),binding: LeaseTabBinding()),
  GetPage(name: '/leaseHome', page:  () => LeaseHomeView(),binding: LeaseHomeBinding()),
  GetPage(name: '/leaseTool', page:  () => const DefaultTool()),
  GetPage(name: '/leaseAdd', page:  () => const LeaseAddView(),binding: LeaseAddBindings()),
  GetPage(name: '/networkFail', page:  () => NoNetworkPage(),binding: NoNetworkBinding()),
  GetPage(name: "/leaseEdit", page: () => const LeaseEditView(),binding: LeaseEditBindings()),
  GetPage(name: "/leaseSetting", page: () => const LeaseSettingView(),binding: LeaseSettingBinding())
];
