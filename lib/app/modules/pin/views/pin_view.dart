import 'package:flutter/material.dart';
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
        title: const Text('Security Pin'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? SizedBox(
                child: Center(
                  child: LoadingBouncingLine.circle(
                    borderColor: Theme.of(context).primaryColor,
                    borderSize: 3.0,
                    size: 50.0,
                    backgroundColor: Theme.of(context).primaryColor,
                    duration: const Duration(milliseconds: 500),
                  ),
                ),
              )
            : ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  Text(
                    'Login Pin',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 30.sp,
                        ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Enter your security pin to login',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 17.sp,
                        ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => AnimatedContainer(
                        width: 60.w,
                        height: 60.h,
                        duration: const Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Opacity(
                          opacity: 1,
                          child: Center(
                            child: Text(
                              controller.values[index],
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 600.h,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.7 / 0.6,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 12,
                      itemBuilder: (context, index) => index == 9
                          ? TextButton(
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.fingerprint,
                              ),
                            )
                          : TextButton(
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                              ),
                              onPressed: index == 11
                                  ? () => controller.removeLast()
                                  : () => controller.onTapFunction(index),
                              child: index == 11
                                  ? Icon(
                                      Icons.backspace,
                                      color: Theme.of(context).iconTheme.color,
                                    )
                                  : Text(
                                      index == 10 ? '0' : '${1 + index}',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                            ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
