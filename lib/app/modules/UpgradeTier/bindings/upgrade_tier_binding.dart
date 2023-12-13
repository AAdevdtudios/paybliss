import 'package:get/get.dart';

import '../controllers/upgrade_tier_controller.dart';

class UpgradeTierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpgradeTierController>(
      () => UpgradeTierController(),
    );
  }
}
