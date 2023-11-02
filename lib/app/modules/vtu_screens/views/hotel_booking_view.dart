import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HotelBookingView extends GetView {
  const HotelBookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HotelBookingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HotelBookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
