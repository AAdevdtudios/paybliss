import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/account_transfer_controller.dart';

class AccountTransferView extends GetView<AccountTransferController> {
  const AccountTransferView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AccountTransferController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccountTransferView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const Text("Please provide account number"),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Account number",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Bank name"),
              const SizedBox(
                height: 10,
              ),
              TextField(
                readOnly: true,
                controller: controller.bankName,
                decoration: const InputDecoration(
                  hintText: "Bank name",
                ),
                onTap: () => Get.bottomSheet(
                  Container(
                    height: 400.h,
                    color: Colors.white,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      children: [
                        ListTile(
                          title: const Text("United Bank Of Africa"),
                          onTap: () => controller.bankName.text =
                              "United Bank Of Africa",
                        ),
                        ListTile(
                          title: const Text("First bank Africa"),
                          onTap: () =>
                              controller.bankName.text = "First bank Africa",
                        ),
                        ListTile(
                          title: const Text("GTB"),
                          onTap: () => controller.bankName.text = "GTB",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                child: const Text("Continue"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
