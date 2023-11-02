import 'package:get/get.dart';

import '../controllers/account_transfer_controller.dart';

class AccountTransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountTransferController>(
      () => AccountTransferController(),
    );
  }
}
