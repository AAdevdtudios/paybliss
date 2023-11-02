import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GiftcardPayView extends GetView {
  const GiftcardPayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Giftcard'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Center(
            child: Text(
              'GiftcardPayView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
