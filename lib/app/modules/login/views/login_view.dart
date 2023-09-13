import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:paybliss/app/modules/forgot_password/views/forgot_password_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: controller.formState,
          child: Obx(
            () => ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 40.sp,
                      ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Login with your account details',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 17.sp,
                      ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (val) => controller.makeChecks(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 17.sp,
                      ),
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) => GetUtils.isEmail(controller.email.text)
                      ? null
                      : "Email is incorrect",
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: controller.password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.passwordObscure.value,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (val) => controller.makeChecks(),
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
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Get.to(const ForgotPasswordView()),
                      child: Text(
                        'Forgot-password',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
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
                            : () => controller.login()
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
                            "Login",
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
