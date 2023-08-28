import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EducationVtuView extends GetView {
  const EducationVtuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EducationVtuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EducationVtuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
