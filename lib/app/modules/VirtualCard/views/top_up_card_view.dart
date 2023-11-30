import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpCardView extends GetView {
  const TopUpCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var p = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("Top up $p Card"),
            Text(
              'Available Wallet balance: 2,000',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          const Text("Amount"),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
            ),
            child: const Text("Top Up"),
          )
        ],
      ),
    );
  }
}
