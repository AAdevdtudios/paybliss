import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/data/ApiServices.dart';

class LoginController extends GetxController {
  var formState = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
  RxBool isValid = false.obs;
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

    await ApiServices().loginUser(email.text, password.text);
    isLoading.value = false;
  }
}
