import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CableVtuView extends GetView {
  const CableVtuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CableVtuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CableVtuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
