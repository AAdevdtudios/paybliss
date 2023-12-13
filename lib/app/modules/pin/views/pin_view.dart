import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../controllers/main_pin_controller.dart';
import '../controllers/pin_controller.dart';

class PinView extends GetView<PinController> {
  const PinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainPinController());
    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Pin'),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 20.h,
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
              onCompleted: (p0) async => await controller.confirmPin(),
              onChanged: (x) => controller.value.value = x,
            ),
          ],
        ),
      ),
    );
  }
}
