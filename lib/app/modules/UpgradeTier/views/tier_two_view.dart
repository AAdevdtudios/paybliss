import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TierTwoView extends GetView {
  const TierTwoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TierTwoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TierTwoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
