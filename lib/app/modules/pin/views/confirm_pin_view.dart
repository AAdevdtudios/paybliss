import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/pin/controllers/confirm_pin_controller.dart';

class ConfirmPinView extends GetView {
  const ConfirmPinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ConfirmPinController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Pin'),
        centerTitle: true,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Confirm Your Security Pin',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 30.sp,
                    ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Re-enter your Security pin for confirmation',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 17.sp,
                    ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Container(
                    height: 60.h,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: controller.value.value.length > index
                        ? const CircleAvatar(
                            backgroundColor: Colors.orange,
                          ).animate().fadeIn()
                        : const SizedBox(),
                  ),
                ),
              ),
              CustomKeyBoard(
                maxLength: 4,
                pinTheme: PinTheme(
                  keysColor: Get.theme.primaryColor,
                ),
                specialKey: const SizedBox(),
                onChanged: (val) => controller.value.value = val,
                onCompleted: (val) => controller.confirmPin(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
