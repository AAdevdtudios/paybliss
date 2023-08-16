import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/forgot_password/views/otp_view.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 40.sp,
                  ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Please enter your email associated with your account',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20.sp,
                  ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Form(
              key: controller.formState,
              child: Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20.sp,
                          ),
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) =>
                          GetUtils.isEmail(controller.email.text)
                              ? null
                              : "Full name too short",
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 70.h,
                      child: ElevatedButton(
                        onPressed: () => Get.off(const OtpView()),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
