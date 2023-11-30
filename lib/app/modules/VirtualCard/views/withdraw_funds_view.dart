import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawFundsView extends GetView {
  const WithdrawFundsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var ps = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Card Balance'),
            Text(
              "${ps[0] + ps[1]}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        children: [
          Text(
            "Withdraw funds",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "Withdraw funds from your virtual card to your main wallet",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text("Amount"),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Withdraw Funds"),
          ),
        ],
      ),
    );
  }
}
