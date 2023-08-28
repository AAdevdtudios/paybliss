import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/modules/home/controllers/service_controller.dart';

import '../../vtu_screens/views/airtime_vtu_view.dart';
import '../../vtu_screens/views/cable_vtu_view.dart';
import '../../vtu_screens/views/data_vtu_view.dart';
import '../../vtu_screens/views/electricity_vtu_view.dart';

class MainHomeController extends GetxController {
  List<ServicesItem> services = [
    ServicesItem(
      name: "Airtime",
      icon: Bootstrap.phone,
      path: const AirtimeVtuView(),
    ),
    ServicesItem(
      name: "Data",
      icon: Bootstrap.bar_chart_fill,
      path: const DataVtuView(),
    ),
    ServicesItem(
      name: "Cable Tv",
      icon: Bootstrap.tv_fill,
      path: const CableVtuView(),
    ),
    ServicesItem(
      name: "More",
      icon: IonIcons.ellipsis_horizontal_circle_sharp,
      path: const ElectricityVtuView(),
    ),
  ];
}
