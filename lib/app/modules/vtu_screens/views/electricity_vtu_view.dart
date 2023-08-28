import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ElectricityVtuView extends GetView {
  const ElectricityVtuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ElectricityVtuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ElectricityVtuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
