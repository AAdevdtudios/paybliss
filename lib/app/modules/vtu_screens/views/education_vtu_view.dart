import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/education_controller.dart';

class EducationVtuView extends GetView {
  const EducationVtuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(EducationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          children: [
            const Text("Services"),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  controller.services.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.pinService.value =
                            controller.services[index];
                        if (controller.pinService.value == "NECO") {
                          controller.amount.text = "800";
                        } else {
                          controller.amount.text = "3900";
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: controller.pinService.value ==
                                controller.services[index]
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                      child: Text(
                        controller.services[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Amount"),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              enabled: false,
              controller: controller.amount,
            ),
            const SizedBox(
              height: 30,
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
