import 'package:flutter/material.dart';
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
            const Text("Meter-type"),
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
              height: 50.h,
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
