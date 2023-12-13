import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/data/ApiServices.dart';
import 'package:paybliss/app/modules/home/views/home_view.dart';
import 'package:paybliss/main.dart';

class ConfirmPinController extends GetxController {
  RxList<String> values = ["", "", "", ""].obs;
  RxInt currentTab = 0.obs;
  RxString value = "".obs;
  RxBool isLoading = false.obs;

  confirmPin() async {
    String confirmPin = box.read('confirm_pin');
    Get.dialog(
      const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.white60,
    );

    if (confirmPin == value.value) {
      var res = await ApiServices().setPin(int.parse(value.value));
      if (res == true) {
        Get.back();
        Get.to(const HomeView());
      }
      Get.back();
    } else {
      Get.back();
      Get.snackbar(
        "Error",
        'Pin code does\'nt match your pin',
        backgroundColor: Colors.red[300],
      );
    }
  }
}
