import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/home/controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResetPasswordView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        children: [
          SizedBox(
            height: 20.h,
          ),
          const Text("Password"),
          SizedBox(
            height: 20.h,
          ),
          TextFormField(
            controller: controller.password,
          ),
          SizedBox(
            height: 20.h,
          ),
          const Text("New Password"),
          SizedBox(
            height: 20.h,
          ),
          TextFormField(
            controller: controller.newPassword,
          ),
          SizedBox(
            height: 20.h,
          ),
          const Text("Confirm Password"),
          SizedBox(
            height: 20.h,
          ),
          TextFormField(),
          SizedBox(
            height: 40.h,
          ),
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
            child: const Text("Update Password"),
          ),
        ],
      ),
    );
  }
}
