import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TierThreeView extends GetView {
  const TierThreeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TierThreeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TierThreeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
