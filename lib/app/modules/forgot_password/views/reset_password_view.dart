import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/forgot_password/controllers/forgot_password_controller.dart';

class ResetPasswordView extends GetView {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                'Reset Password',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 40.sp,
                    ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Set up your new password for your email',
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
                      SizedBox(
                        height: 30.h,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.passwordObscure.value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20.sp,
                                  ),
                          validator: (val) =>
                              GetUtils.isLengthLessThan(6, val!.length)
                                  ? null
                                  : "Password must be greater than 6",
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: MaterialButton(
                              onPressed: () => controller.passwordObscure
                                  .value = !controller.passwordObscure.value,
                              child: Icon(
                                controller.passwordObscure.value == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: controller.confirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.confirmPasswordObscure.value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20.sp,
                                  ),
                          validator: (val) => GetUtils.hasMatch(
                                  controller.confirmPassword.text,
                                  controller.password.text)
                              ? null
                              : "Password doesn't match",
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: MaterialButton(
                              onPressed: () =>
                                  controller.confirmPasswordObscure.value =
                                      !controller.confirmPasswordObscure.value,
                              child: Icon(
                                controller.confirmPasswordObscure.value == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 70.h,
                        child: ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Rest Password",
                            style: TextStyle(
                              color: Colors.white70,
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
      ),
    );
  }
}
