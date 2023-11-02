import 'dart:convert';
//string user@example.com
import 'package:get/get.dart';
import 'package:paybliss/app/data/Models/UserResponse.dart';
import "package:http/http.dart" as http;
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

  Future<bool> register_loginUser(String email, String password) async {
    var url = Uri.parse("$BaseUrl/auth/login");
    Map<String, String> res = {
      "email": email,
      "password": password,
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
        return true;
      }
      _ShowDialog("Error", responseData.message.toString(), false);
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> registerUser(dynamic user) async {
    var url = Uri.parse("$BaseUrl/auth/register");

    try {
      var response = await client.post(
        url,
        body: json.encode(user),
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      print(response);
      var responseData = UserResponse.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        bool isLoggedIn =
            await register_loginUser(user["email"], user["password"]);
        if (isLoggedIn) {
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
          Get.offAll(const NewPinView());
          return true;
        } else {
          Get.offAll(const LoginView());
          return true;
        }
      }
      if (responseData.message.toString() == "User already exist") {
        Get.defaultDialog(
          title: "Error",
          middleText: responseData.message.toString(),
        );
        Get.off(const LoginView());
      }
      Get.defaultDialog(
        title: "Error",
        middleText: responseData.message.toString(),
      );
      return false;
    } catch (e) {
      Get.defaultDialog(
        title: "Network",
        middleText: "Un-able to access the internet",
      );
      return false;
    }
  }

  Future updateUser(dynamic user) async {
    var url = Uri.parse("$BaseUrl/auth/update-user");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.post(
        url,
        body: json.encode(user),
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
          },
        );
        _ShowDialog("Successful", responseData.message.toString(), false);
      } else {
        _ShowDialog("Error", responseData.message.toString(), false);
      }
    } catch (e) {
      print(e);
      _ShowDialog("error", "Un-able to access the internet", false);
    }
  }

  Future<bool> setPin(int pin) async {
    var url = Uri.parse("$BaseUrl/auth/set-pin");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    Map<String, int> res = {
      "pin": pin,
    };
    try {
      var response = await client.put(
        url,
        body: json.encode(res),
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      var responseData = UserResponse.fromJson(json.decode(response.body));
      print(responseData.data);
      if (response.statusCode == 200) {
        storesInfo(
          {
            "email": responseData.data!.email.toString(),
            "firstname": responseData.data!.firstName.toString(),
            "lastname": responseData.data!.lastName.toString(),
            "pin_code": responseData.data!.pin.toString(),
            "referralCode": responseData.data!.referralsCode.toString(),
          },
        );
        print(box.read("firstname"));
        return true;
      }
      _ShowDialog("Error", responseData.message.toString(), false);
    } catch (e) {
      Get.defaultDialog(
        title: "Network",
        middleText: "Un-able to access the internet",
      );
    }
    return true;
  }

// /user
  Future<bool> loginPin(int pin) async {
    var url = Uri.parse("$BaseUrl/auth/getPin?pin=$pin");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.get(
        url,
        headers: header,
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
          },
        );
        Get.offAllNamed(Routes.HOME);
        return true;
      } else if (response.statusCode == 401) {
        box.erase();
        Get.offAll(const OnboardingView());
        return false;
      } else {
        _ShowDialog("Error", responseData.message.toString(), true);
        return false;
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Network",
        middleText: "Un-able to access the internet",
      );
      return false;
    }
  }

  storesInfo(Map<String, String> data) {
    data.forEach((key, value) => box.write(key, value));
    print(box.read("firstname"));
  }
}

_ShowDialog(String type, String message, bool disable) {
  Get.defaultDialog(
    title: type,
    middleText: message,
  );
}
