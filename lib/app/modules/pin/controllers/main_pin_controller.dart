import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/data/ApiServices.dart';
import 'package:paybliss/app/modules/home/views/home_view.dart';

class MainPinController extends GetxController {
  var values = ["", "", "", ""].obs;
  RxString value = "".obs;

  confirmPin() async {
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
    try {
      await ApiServices().loginPin(int.parse(value.value));
      Get.back(closeOverlays: true);
      Get.to(const HomeView());
    } catch (e) {
      Get.back(closeOverlays: true);
      print(e.toString());
      Get.snackbar("Error", e.toString());
    }
  }
}
