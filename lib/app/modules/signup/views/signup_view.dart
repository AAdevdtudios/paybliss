import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../pin/views/new_pin_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                'Get Started',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 40.sp,
                    ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Create an account so you can start pay your bills and purchase top-ups faster',
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
                        controller: controller.fullName,
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onTapOutside: (event) => {},
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20.sp,
                            ),
                        decoration: const InputDecoration(
                          hintText: 'Full Name',
                          prefixIcon: Icon(
                            Icons.account_box,
                          ),
                        ),
                        validator: (value) => GetUtils.isLengthLessThan(
                                3, controller.fullName.text.length)
                            ? null
                            : "Full name too short",
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
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
                      TextFormField(
                        controller: controller.phone,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20.sp,
                            ),
                        decoration: const InputDecoration(
                          hintText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        validator: (value) =>
                            GetUtils.isPhoneNumber(controller.phone.text)
                                ? null
                                : "Invalid Phone number",
                      ),
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
                      TextFormField(
                        controller: controller.referrals,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.always,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20.sp,
                            ),
                        decoration: const InputDecoration(
                          hintText: 'Referral (Optional)',
                          prefixIcon: Icon(Icons.supervisor_account),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 70.h,
                        child: ElevatedButton(
                          onPressed: () => Get.off(const NewPinView()),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Register",
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
      ),
    );
  }
}
