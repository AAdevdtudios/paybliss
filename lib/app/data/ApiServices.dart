import 'dart:convert';

//string user@example.com
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:paybliss/app/data/Models/UserResponse.dart';
import 'package:paybliss/app/modules/Permission/views/permission_view.dart';
import 'package:paybliss/app/modules/login/views/login_view.dart';
import 'package:paybliss/app/modules/onboarding/views/onboarding_view.dart';
import 'package:paybliss/app/modules/pin/views/new_pin_view.dart';
import 'package:paybliss/app/routes/app_pages.dart';
import 'package:paybliss/main.dart';

const String BaseUrl = "https://blissbill.onrender.com/api";
Map<String, String> header = {
  "Accept": "application/json",
  "content-type": "application/json",
  "Authorization": ""
};

class ApiServices {
  var client = http.Client();

  Future<UserResponse> login(String email, String password) async {
    var url = Uri.parse("$BaseUrl/auth/login");
    Map<String, String> res = {
      "email": email,
      "password": password,
    };
    var response = await client.post(
      url,
      body: json.encode(res),
      headers: header,
      encoding: Encoding.getByName("utf-8"),
    );
    var responseData = UserResponse.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      storesInfo(
        {
          "email": responseData.data!.email.toString(),
          "firstname": responseData.data!.firstName.toString(),
          "lastname": responseData.data!.lastName.toString(),
          "pin_code": responseData.data!.pin.toString(),
          "referralCode": responseData.data!.referralsCode.toString(),
          "jwt": responseData.data!.jwToken.toString(),
          "refresh": responseData.data!.refreshToken.toString()
        },
      );
      return responseData;
    }
    _showDialog("Error", responseData.message.toString(), false);
    return responseData;
  }

  Future<bool> registerUser(dynamic user) async {
    var url = Uri.parse("$BaseUrl/auth/register");

    var response = await client.post(
      url,
      body: json.encode(user),
      headers: header,
      encoding: Encoding.getByName("utf-8"),
    );

    var responseData = UserResponse.fromJson(json.decode(response.body));
    if (response.statusCode != 200) {
      if (responseData.message.toString() == "User already exist") {
        Get.defaultDialog(
          title: "Error",
          middleText: responseData.message.toString(),
          actions: [
            TextButton(
              onPressed: () => Get.off(const LoginView()),
              child: const Text("Login"),
            )
          ],
        );
      } else {
        Get.defaultDialog(
          title: "Error",
          middleText: responseData.message.toString(),
        );
      }
      return false;
    }

    storesInfo(
      {
        "email": responseData.data!.email.toString(),
        "firstname": responseData.data!.firstName.toString(),
        "lastname": responseData.data!.lastName.toString(),
        "referralCode": responseData.data!.referralsCode.toString(),
        "jwt": responseData.data!.jwToken.toString(),
        "refresh": responseData.data!.refreshToken.toString()
      },
    );
    return true;
  }

  Future<bool> updateUser(dynamic user) async {
    var url = Uri.parse("$BaseUrl/auth/update-user");
    header["Authorization"] = "Bearer ${box.read("jwt")}";

    var response = await client.post(
      url,
      body: json.encode(user),
      headers: header,
      encoding: Encoding.getByName("utf-8"),
    );

    var responseData = UserResponse.fromJson(json.decode(response.body));

    if (response.statusCode != 200) {
      _showDialog("Error", responseData.message.toString(), false);
      return false;
    }

    storesInfo(
      {
        "email": responseData.data!.email.toString(),
        "firstname": responseData.data!.firstName.toString(),
        "lastname": responseData.data!.lastName.toString(),
      },
    );
    _showDialog("Successful", responseData.message.toString(), false);
    return true;
  }

  Future<bool> setPin(int pin) async {
    var url = Uri.parse("$BaseUrl/auth/set-pin");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    Map<String, int> res = {
      "pin": pin,
    };

    var response = await client.put(
      url,
      body: json.encode(res),
      headers: header,
      encoding: Encoding.getByName("utf-8"),
    );

    var responseData = UserResponse.fromJson(json.decode(response.body));

    if (response.statusCode != 200) {
      _showDialog("Error", responseData.message.toString(), false);
      return false;
    }
    storesInfo(
      {
        "pin_code": responseData.data!.pin.toString(),
      },
    );
    return true;
  }

// /user
  Future<bool> loginPin(int pin) async {
    print("In");
    var url = Uri.parse("$BaseUrl/auth/getPin?pin=$pin");
    header["Authorization"] = "Bearer ${box.read("jwt")}";

    var response = await client.get(
      url,
      headers: header,
    );
    print(response.body);

    var responseData = UserResponse.fromJson(json.decode(response.body));
    if (response.statusCode != 200) {
      if (response.statusCode == 401) {
        _showDialog("Error", "Session has expired", true);

        box.erase();
        Get.offAll(const OnboardingView());
        return false;
      } else {
        _showDialog("Error", responseData.message.toString(), true);
        return false;
      }
    }
    storesInfo(
      {
        "email": responseData.data!.email.toString(),
        "firstname": responseData.data!.firstName.toString(),
        "lastname": responseData.data!.lastName.toString(),
        "pin_code": responseData.data!.pin.toString(),
        "referralCode": responseData.data!.referralsCode.toString(),
      },
    );
    print(box.read("firstname") + responseData.data!.firstName.toString());
    if (box.read("permissions") == null) {
      Get.offAll(const PermissionView());
      return true;
    }

    Get.offAllNamed(Routes.HOME);
    return true;
  }

  Future<bool> bvnVerification(String email, String bvn) async {
    var url = Uri.parse("$BaseUrl/auth/bvn");
    Map<String, String> res = {
      "email": email,
      "bvn": bvn,
    };
    var response = await client.post(
      url,
      body: json.encode(res),
      headers: header,
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  storesInfo(Map<String, String> data) {
    data.forEach((key, value) => box.write(key, value));
    print(box.read("firstname"));
  }
}

_showDialog(String type, String message, bool disable) {
  Get.defaultDialog(
    title: type,
    middleText: message,
  );
}
