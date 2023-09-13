import 'package:get/get.dart';

import 'package:paybliss/app/modules/vtu_screens/controllers/airtime_controller.dart';
import 'package:paybliss/app/modules/vtu_screens/controllers/cable_vtu_controller.dart';
import 'package:paybliss/app/modules/vtu_screens/controllers/data_controller.dart';
import 'package:paybliss/app/modules/vtu_screens/controllers/electricity_controller.dart';

import '../controllers/vtu_screens_controller.dart';

class VtuScreensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ElectricityController>(
      () => ElectricityController(),
    );
    Get.lazyPut<CableVtuController>(
      () => CableVtuController(),
    );
    Get.lazyPut<DataController>(
      () => DataController(),
    );
    Get.lazyPut<AirtimeController>(
      () => AirtimeController(),
    );
    Get.lazyPut<VtuScreensController>(
      () => VtuScreensController(),
    );
  }
}
