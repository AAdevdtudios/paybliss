import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:paybliss/app/modules/pin/views/new_pin_view.dart';
import 'package:paybliss/app/modules/pin/views/pin_view.dart';
import 'package:paybliss/app/modules/signup/controllers/signup_controller.dart';
import 'package:paybliss/main.dart';

class BvnView extends GetView {
  const BvnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String name = box.read("firstname") ?? "Joseph";
    var controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('BVN number'),
        centerTitle: true,
      ),
      bottomNavigationBar: SizedBox(
        height: 125.h,
        width: double.infinity,
        child: Column(
          children: [
            Obx(() => ElevatedButton(
                  onPressed: controller.isBvn.value
                      ? () => controller.sendBvn()
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300.w, 60.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.white,
                          size: 50,
                        )
                      : const Text("Continue"),
                )),
            TextButton(
              onPressed: () =>
                  box.read("pin_code") == null || box.read("pin_code") == "0"
                      ? Get.offAll(const NewPinView())
                      : Get.offAll(const PinView()),
              child: Text(
                "Skip for now",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: controller.bvnForm,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          children: [
            Text(
              "$name in compliance with CBN regulations, we need to verify your identity with using your BVN. And your new account would be generated",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controller.bvnNumber,
              validator: (value) =>
                  GetUtils.isLengthGreaterThan(value, 11) ? "Too short" : null,
              onSaved: (newValue) => controller.verfyBvn(),
              onTapOutside: (event) => controller.verfyBvn(),
              decoration: const InputDecoration(
                hintText: "BVN number",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
