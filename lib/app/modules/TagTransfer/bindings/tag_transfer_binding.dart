import 'package:get/get.dart';

import '../controllers/tag_transfer_controller.dart';

class TagTransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TagTransferController>(
      () => TagTransferController(),
    );
  }
}
