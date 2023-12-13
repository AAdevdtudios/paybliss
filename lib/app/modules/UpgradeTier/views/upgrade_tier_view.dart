import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upgrade_tier_controller.dart';

class UpgradeTierView extends GetView<UpgradeTierController> {
  const UpgradeTierView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UpgradeTierController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Upgrade Tier to ${1 + controller.tireNumber()}'),
        centerTitle: true,
      ),
      body: Obx(
        () => PageStorage(
          bucket: controller.pageStorageBucket,
          child: controller.screens[controller.tireNumber()],
        ),
      ),
    );
  }
}
