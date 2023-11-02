import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:paybliss/app/modules/home/controllers/edit_profile_controller.dart';

class EditProfileView extends GetView {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditProfileView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formState,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          children: [
            SizedBox(
              height: 20.h,
            ),
            const Text("Firstname"),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: controller.firstname,
              onChanged: (val) => controller.makeChecks(),
              validator: (value) => GetUtils.isLengthLessThan(value, 3)
                  ? "Firstname too short"
                  : null,
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text("Lastname"),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: controller.lastname,
              onChanged: (val) => controller.makeChecks(),
              validator: (value) => GetUtils.isLengthLessThan(value, 3)
                  ? "Lastname too short"
                  : null,
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text("Email"),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: controller.email,
              onChanged: (val) => controller.makeChecks(),
              validator: (value) => GetUtils.isEmail(controller.email.text)
                  ? null
                  : "Bad email format",
            ),
            SizedBox(
              height: 40.h,
            ),
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 70.h,
                child: ElevatedButton(
                  onPressed: controller.isValid.value
                      ? controller.isLoading.value
                          ? null
                          : () => controller.updateUser()
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
                          "Update User",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                          ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
