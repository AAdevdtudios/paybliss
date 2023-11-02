import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tag_transfer_controller.dart';

class TagTransferView extends GetView<TagTransferController> {
  const TagTransferView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TagTransferView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TagTransferView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
