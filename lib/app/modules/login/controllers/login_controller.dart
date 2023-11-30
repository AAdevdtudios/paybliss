import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:paybliss/app/data/ApiServices.dart';

import 'package:paybliss/app/modules/pin/views/new_pin_view.dart';
import 'package:paybliss/app/modules/pin/views/pin_view.dart';

class LoginController extends GetxController {
  var formState = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
  RxBool isValid = false.obs;
  var client = http.Client();
  RxBool isLoading = false.obs;

  makeChecks() {
    if (formState.currentState!.validate()) {
      isValid.value = true;
      print(isValid.value);
    } else {
      isValid.value = false;
    }
  }

  login() async {
    isLoading.value = true;
    var res = await ApiServices().login(email.text, password.text);
    if (res.successful != true) {
      Get.snackbar("Error", res.message!);
    }
    if (res.data!.pin == 0) {
      Get.to(const NewPinView());
    } else {
      Get.to(const PinView());
    }
    isLoading.value = false;
  }
}
