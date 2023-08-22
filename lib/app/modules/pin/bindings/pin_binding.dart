import 'package:get/get.dart';

import 'package:paybliss/app/modules/pin/controllers/confirm_pin_controller.dart';
import 'package:paybliss/app/modules/pin/controllers/main_pin_controller.dart';

import '../controllers/pin_controller.dart';

class PinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPinController>(
      () => MainPinController(),
    );
    Get.lazyPut<ConfirmPinController>(
      () => ConfirmPinController(),
    );
    Get.lazyPut<PinController>(
      () => PinController(),
    );
  }
}
