import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vtu_screens_controller.dart';

class VtuScreensView extends GetView<VtuScreensController> {
  const VtuScreensView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VtuScreensView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VtuScreensView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
