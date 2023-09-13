import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/pin/controllers/pin_controller.dart';

class NewPinView extends GetView {
  const NewPinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    var controller = Get.put(PinController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Pin'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Text(
            'Create Your Security Pin',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 30.sp,
                ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'We would require the pin to process your transactions',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 17.sp,
                ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                4,
                (index) => AnimatedContainer(
                  width: 60.w,
                  height: 60.h,
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    color: Theme.of(context).inputDecorationTheme.fillColor,
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
          ),
          SizedBox(
            width: double.infinity,
            height: 600.h,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7 / 0.6,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              itemBuilder: (context, index) => index == 9
                  ? const SizedBox()
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
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
