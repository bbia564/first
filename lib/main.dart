import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lease_start/pages/router/router_page.dart';

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
      initialRoute: '/',
      getPages:LeaseGes,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}

