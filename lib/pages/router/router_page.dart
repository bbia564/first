
import 'package:get/get.dart';
import 'package:lease_start/pages/lease_add/lease_add_bindings.dart';
import 'package:lease_start/pages/lease_add/lease_add_view.dart';
import 'package:lease_start/pages/lease_edit/lease_edit_bindings.dart';
import 'package:lease_start/pages/lease_edit/lease_edit_view.dart';
import 'package:lease_start/pages/lease_setting/lease_setting_bindings.dart';
import 'package:lease_start/pages/lease_setting/lease_setting_view.dart';
import 'package:lease_start/pages/lease_tab/lease_tab_binding.dart';
import 'package:lease_start/pages/lease_tab/lease_tab_view.dart';

import '../default_components/default_components.dart';
import '../lease_home/lease_home_binding.dart';
import '../lease_home/lease_home_view.dart';

List<GetPage<dynamic>> LeaseGes = [
  GetPage(name: '/', page: () => const LeaseTabView(),binding: LeaseTabBinding()),
  GetPage(name: '/leaseHome', page:  () => LeaseHomeView(),binding: LeaseHomeBinding()),
  GetPage(name: '/leaseAdd', page:  () => const LeaseAddView(),binding: LeaseAddBindings()),
  GetPage(name: "/leaseEdit", page: () => const LeaseEditView(),binding: LeaseEditBindings()),
  GetPage(name: "/default_components", page: () => const DefaultComponents()),
  GetPage(name: "/leaseSetting", page: () => const LeaseSettingView(),binding: LeaseSettingBinding())
];