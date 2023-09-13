import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/data/ApiServices.dart';

class SignupController extends GetxController {
  var formState = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController referrals = TextEditingController();

  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
  RxBool isValid = false.obs;
  RxBool isLoading = false.obs;

  makeChecks() {
    if (formState.currentState!.validate()) {
      isValid.value = true;
    } else {
      isValid.value = false;
    }
  }

  registerUser() async {
    isLoading.value = true;

    Map<String, dynamic> user = {
      "firstname": firstName.text,
      "lastname": lastName.text,
      "email": email.text,
      "password": password.text,
      "phonenumber": phone.text,
    };
    await ApiServices().registerUser(user);
    // if (res == true) {
    //   Get.offAll(const LoginView());
    // }
    isLoading.value = false;
  }
}
