import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:paybliss/app/data/ApiServices.dart';
import 'dart:convert';

import 'package:paybliss/app/data/Models/UserResponse.dart';
import 'package:paybliss/app/modules/pin/views/new_pin_view.dart';
import 'package:paybliss/app/modules/pin/views/pin_view.dart';
import 'package:paybliss/main.dart';

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
    var url = Uri.parse("${BaseUrl}auth/login");
    Map<String, String> res = {
      "email": email.text,
      "password": password.text,
    };
    try {
      var response = await client.post(
        url,
        body: json.encode(res),
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      var responseData = UserResponse.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        box.write("jwt", responseData.data!.jwToken);
        box.write("refresh", responseData.data!.refreshToken);
        if (responseData.data!.pin == 0) {
          Get.offAll(const NewPinView());
        }
        box.writeIfNull('pin_code', responseData.data!.pin.toString());
        Get.offAll(const PinView());
      }
      Get.defaultDialog(
          title: "Error", middleText: responseData.message.toString());
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: e.toString());
    }
    isLoading.value = false;
  }
}
