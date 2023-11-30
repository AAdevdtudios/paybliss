import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/home/views/home_view.dart';

import '../controllers/permission_controller.dart';

class PermissionView extends GetView<PermissionController> {
  const PermissionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PermissionController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('PermissionView'),
        centerTitle: true,
      ),
      bottomNavigationBar: SizedBox(
        height: 125.h,
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => controller.setPermissions(),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300.w, 60.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Continue"),
            ),
            TextButton(
              onPressed: () => Get.offAll(const HomeView()),
              child: Text(
                "Skip for now",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      body: const Column(
        children: [
          Center(
            child: Text(
              'PermissionView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
