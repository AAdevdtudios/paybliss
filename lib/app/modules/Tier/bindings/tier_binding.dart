import 'package:get/get.dart';

import '../controllers/tier_controller.dart';

class TierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TierController>(
      () => TierController(),
    );
  }
}
