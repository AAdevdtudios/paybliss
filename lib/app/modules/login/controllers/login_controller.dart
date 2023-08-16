import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var formState = GlobalKey<FormFieldState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
}
