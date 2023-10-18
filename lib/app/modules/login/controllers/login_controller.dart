import 'package:awesome_notifications/awesome_notifications.dart';
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
      print(response);
      if (response.statusCode == 200) {
        box.write("jwt", responseData.data!.jwToken);
        box.write("refresh", responseData.data!.refreshToken);
        box.write('user', responseData.toJson());
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 5,
            channelKey: "blissbill_channel",
            title: "Successful Login",
            body: "Your account is logged in",
          ),
        );
        print("success");
        if (responseData.data!.pin.toString() == "0") {
          Get.offAll(const NewPinView());
        } else {
          box.write('pin_code', responseData.data!.pin.toString());
          Get.offAll(const PinView());
        }
      } else {
        Get.defaultDialog(
            title: "Error", middleText: responseData.message.toString());
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: e.toString());
    }
    isLoading.value = false;
  }
}
