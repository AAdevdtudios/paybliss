import 'dart:convert';
//string user@example.com
import 'package:get/get.dart';
import 'package:paybliss/app/data/Models/UserResponse.dart';
import "package:http/http.dart" as http;
import 'package:paybliss/app/modules/login/views/login_view.dart';
import 'package:paybliss/app/modules/pin/views/new_pin_view.dart';
import 'package:paybliss/app/modules/pin/views/pin_view.dart';
import 'package:paybliss/main.dart';

const String BaseUrl = "https://blissbill.onrender.com/api/";
Map<String, String> header = {
  "Accept": "application/json",
  "content-type": "application/json",
  "Authorization": "Bearer ${box.read("jwt")}"
};

class ApiServices {
  var client = http.Client();

  Future<bool> loginUser(String email, String password) async {
    var url = Uri.parse("${BaseUrl}auth/login");
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
        box.write("jwt", responseData.data!.jwToken);
        box.write("refresh", responseData.data!.refreshToken);
        print(box.read('jwt'));
        if (responseData.data!.pin == 0) {
          Get.offAll(const NewPinView());
        }
        box.writeIfNull('pin_code', responseData.data!.pin.toString());
        Get.offAll(const PinView());
        return true;
      }
      _ShowDialog("Error", responseData.message.toString(), false);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> registerUser(dynamic user) async {
    var url = Uri.parse("${BaseUrl}auth/register");

    try {
      var response = await client.post(
        url,
        body: json.encode(user),
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      var responseData = UserResponse.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        //await loginUser(user["email"], user["password"]);
        Get.to(const LoginView());
        return true;
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

  Future<bool> setPin(int pin) async {
    var url = Uri.parse("${BaseUrl}auth/set-pin");
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
      if (response.statusCode == 200) {
        box.writeIfNull('pin_code', pin.toString());
        print("Done");
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

  Future<UserResponse> getUser() async {
    var url = Uri.parse("${BaseUrl}auth/user");
    var response = await client.get(url, headers: header);
    var responseData = UserResponse.fromJson(json.decode(response.body));
    return responseData;
  }
}

_ShowDialog(String type, String message, bool disable) {
  Get.defaultDialog(
    title: type,
    middleText: message,
    barrierDismissible: disable,
  );
}
