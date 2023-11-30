import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/data/ApiServices.dart';
import 'package:paybliss/app/modules/pin/views/new_pin_view.dart';
import 'package:paybliss/app/modules/signup/views/bvn_view.dart';
import 'package:paybliss/main.dart';

class SignupController extends GetxController {
  var formState = GlobalKey<FormState>();
  var bvnForm = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController referrals = TextEditingController();
  TextEditingController bvnNumber = TextEditingController();

  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
  RxBool isValid = false.obs;
  RxBool isLoading = false.obs;

  RxBool isBvn = false.obs;
  makeChecks() {
    if (formState.currentState!.validate()) {
      isValid.value = true;
    } else {
      isValid.value = false;
    }
  }

  verfyBvn() {
    if (bvnForm.currentState!.validate()) {
      isBvn.value = true;
    }
  }

  sendBvn() async {
    isLoading.value = true;
    if (bvnForm.currentState!.validate()) {
      var res = await ApiServices()
          .bvnVerification(box.read("email"), bvnNumber.text);
      print(res);
      if (res) {
        Get.offAll(const NewPinView());
      }
    }
    isLoading.value = false;
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
    var res = await ApiServices().registerUser(user);
    if (res == true) {
      Get.offAll(const BvnView());
    } else {
      Get.snackbar("Error", "Un-able to connect");
    }
    isLoading.value = false;
  }
}
