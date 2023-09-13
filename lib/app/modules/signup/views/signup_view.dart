import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.formState,
          child: Obx(
            () => ListView(
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
                        fontSize: 17.sp,
                      ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.firstName,
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (val) => controller.makeChecks(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 17.sp,
                            ),
                        decoration: const InputDecoration(
                          hintText: 'Firstname',
                          prefixIcon: Icon(
                            Icons.account_box,
                          ),
                        ),
                        validator: (value) =>
                            GetUtils.isLengthLessThan(value, 6)
                                ? "Full name too short"
                                : null,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.lastName,
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (val) => controller.makeChecks(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 17.sp,
                            ),
                        decoration: const InputDecoration(
                          hintText: 'Lastname',
                          prefixIcon: Icon(
                            Icons.account_box,
                          ),
                        ),
                        validator: (value) =>
                            GetUtils.isLengthLessThan(value, 6)
                                ? "Full name too short"
                                : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) => controller.makeChecks(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 17.sp,
                      ),
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) => GetUtils.isEmail(controller.email.text)
                      ? null
                      : "Bad email format",
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: controller.phone,
                  keyboardType: TextInputType.number,
                  onChanged: (val) => controller.makeChecks(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 17.sp,
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
                TextFormField(
                  controller: controller.password,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (val) => controller.makeChecks(),
                  obscureText: controller.passwordObscure.value,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 17.sp,
                      ),
                  validator: (val) => GetUtils.isLengthLessThan(val, 6)
                      ? "Password must be greater than 6"
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: MaterialButton(
                      onPressed: () => controller.passwordObscure.value =
                          !controller.passwordObscure.value,
                      child: Icon(
                        controller.passwordObscure.value == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: controller.confirmPassword,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (val) => controller.makeChecks(),
                  obscureText: controller.confirmPasswordObscure.value,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 17.sp,
                      ),
                  validator: (val) =>
                      GetUtils.hasMatch(val, controller.password.text)
                          ? null
                          : "Password doesn't match",
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: MaterialButton(
                      onPressed: () => controller.confirmPasswordObscure.value =
                          !controller.confirmPasswordObscure.value,
                      child: Icon(
                        controller.confirmPasswordObscure.value == true
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                        fontSize: 17.sp,
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
                    onPressed: controller.isValid.value
                        ? controller.isLoading.value
                            ? null
                            : () => controller.registerUser()
                        : null,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.white,
                            size: 50,
                          )
                        : Text(
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
      ),
    );
  }
}
