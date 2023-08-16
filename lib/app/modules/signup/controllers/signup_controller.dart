import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var formState = GlobalKey<FormFieldState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController referrals = TextEditingController();
  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
}
