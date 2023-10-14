import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
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
      body: ListView(
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
          ),
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
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }
}
