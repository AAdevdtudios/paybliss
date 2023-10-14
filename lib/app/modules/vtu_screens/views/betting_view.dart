import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/betting_controller.dart';

class BettingView extends GetView {
  const BettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BettingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Betting'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          children: [
            const Text("Service"),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  controller.betServices.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () => controller.betService.value =
                          controller.betServices[index],
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: controller.betService.value ==
                                controller.betServices[index]
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                      child: Text(
                        controller.betServices[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            const Text("Bet number"),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Bet Id",
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Pay"),
            ),
          ],
        ),
      ),
    );
  }
}
