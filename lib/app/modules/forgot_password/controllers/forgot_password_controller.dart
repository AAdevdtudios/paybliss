import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var formState = GlobalKey<FormFieldState>();
  TextEditingController email = TextEditingController();

  //Controllers
  TextEditingController otp = TextEditingController();

  removeLast() {
    List<String> c = otp.text.toString().split("");
    c.removeLast();
    otp.text = c.join();
  }

  addToText(int val) {
    if (val != 10) {
      int sum = val + 1;
      otp.text += sum.toString();
    } else {
      otp.text += '0';
    }
  }

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
}
