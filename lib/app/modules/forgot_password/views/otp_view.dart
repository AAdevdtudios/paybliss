import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:paybliss/app/modules/forgot_password/views/reset_password_view.dart';

class OtpView extends GetView<ForgotPasswordController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              'OTP Verification?',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 40.sp,
                  ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Enter 4 digit code sent to your email address james@gmail.com',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17.sp,
                  ),
            ),
            SizedBox(
              height: 30.h,
            ),
            TextField(
              controller: controller.otp,
              keyboardType: TextInputType.none,
              decoration: const InputDecoration(
                hintText: 'Enter OTP',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 70.h,
              child: ElevatedButton(
                onPressed: () => Get.off(const ResetPasswordView()),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Confirm Password",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 25.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
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
                            : () => controller.addToText(index),
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
      ),
    );
  }
}
