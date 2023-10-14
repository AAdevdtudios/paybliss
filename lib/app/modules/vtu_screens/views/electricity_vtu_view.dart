import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/vtu_screens/controllers/electricity_controller.dart';

class ElectricityVtuView extends GetView {
  const ElectricityVtuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ElectricityController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electricity bills'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const Text("Meter-type").animate().fadeIn(
                  duration: const Duration(
                    seconds: 5,
                  ),
                ),
            SizedBox(
              height: 20.h,
            ),
            DropdownButtonFormField(
              value: controller.meterType.value,
              alignment: Alignment.bottomCenter,
              onChanged: (newValue) =>
                  controller.meterType.value = newValue as String,
              items: List.generate(
                controller.meterTypes.length,
                (index) => DropdownMenuItem(
                  value: controller.meterTypes[index],
                  child: Text(
                    controller.meterTypes[index],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            const Text("Service"),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  controller.service.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () => controller.meterService.value =
                          controller.service[index],
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: controller.meterService.value ==
                                controller.service[index]
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                      child: Text(
                        controller.service[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            const Text("Meter Number"),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Meter Number",
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            const Text("Amount"),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Amount",
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            SizedBox(
              height: 70.h,
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Pay"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
