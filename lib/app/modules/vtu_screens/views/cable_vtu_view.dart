import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/vtu_screens/controllers/cable_vtu_controller.dart';

class CableVtuView extends GetView {
  const CableVtuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CableVtuController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cable-Tv'),
        centerTitle: true,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10.h,
              ),
              const Text("Tv Subscription"),
              SizedBox(
                height: 10.h,
              ),
              DropdownButtonFormField(
                value: controller.selectedValue.value,
                alignment: Alignment.bottomCenter,
                onChanged: (newValue) =>
                    controller.selectedValue.value = newValue as String,
                items: List.generate(
                  controller.cables.length,
                  (index) => DropdownMenuItem(
                    value: controller.cables[index],
                    child: Text(
                      controller.cables[index],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              const Text("Smartcard Number"),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Smartcard Number",
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              controller.isValid.value
                  ? Column(
                      children: [
                        const Text("Account Name"),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          enabled: false,
                          decoration: const InputDecoration(
                            hintText: "Account Name",
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        const Text("Bouquet"),
                        SizedBox(
                          height: 10.h,
                        ),
                        DropdownButtonFormField(
                          value: controller.selectedValue.value,
                          alignment: Alignment.bottomCenter,
                          onChanged: (newValue) => controller
                              .selectedValue.value = newValue as String,
                          items: List.generate(
                            controller.cables.length,
                            (index) => DropdownMenuItem(
                              value: controller.cables[index],
                              child: Text(
                                controller.cables[index],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    )
                  : const SizedBox(),
              SizedBox(
                height: 70.h,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(controller.isValid.value ? "Pay" : "Validate"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
