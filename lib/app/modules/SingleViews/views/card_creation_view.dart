import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/modules/home/views/home_view.dart';
import 'package:paybliss/main.dart';

class CardCreationView extends GetView {
  const CardCreationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Card'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Amount to Top-up"),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Amount",
              ),
              keyboardType: TextInputType.number,
            ),
            const Text("Amount must be greater than \$5"),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: 300.w,
                child: ElevatedButton(
                  onPressed: () {
                    box.write("card", "value");
                    print(box.read("card"));
                    Get.to(const HomeView());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                  ),
                  child: const Text("Create Card"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
