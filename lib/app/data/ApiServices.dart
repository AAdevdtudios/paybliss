import 'dart:convert';

//string user@example.com
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:paybliss/app/data/Models/AccountDetailsRes.dart';
import 'package:paybliss/app/data/Models/UserResponse.dart';
import 'package:paybliss/app/modules/login/views/login_view.dart';
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
        "bvn": responseData.data!.bvn.toString(),
        "tier": responseData.data!.tier.toString(),
        "jwt": responseData.data!.jwToken.toString(),
        "refresh": responseData.data!.refreshToken.toString()
      },
    );
    print(box.read("tire"));
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
    print("In");
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
    print(responseData.data!.tier.toString());
    storesInfo(
      {
        "pin_code": responseData.data!.pin.toString(),
        "tire": responseData.data!.tier.toString(),
      },
    );
    return true;
  }

// /user
  Future<bool> loginPin(int pin) async {
    var url = Uri.parse("$BaseUrl/auth/getPin?pin=$pin");
    header["Authorization"] = "Bearer ${box.read("jwt")}";

    var response = await client.get(
      url,
      headers: header,
    );
    if (response.statusCode == 500) {
      getStatusCode(500, "Server error");
      return false;
    }
    var responseData = UserResponse.fromJson(json.decode(response.body));
    if (responseData.statusCode != 200) {
      getStatusCode(
        responseData.statusCode!,
        responseData.message!,
      );
      throw responseData.message.toString();
    }
    storesInfo(
      {
        "email": responseData.data!.email.toString(),
        "firstname": responseData.data!.firstName.toString(),
        "lastname": responseData.data!.lastName.toString(),
        "pin_code": responseData.data!.pin.toString(),
        "referralCode": responseData.data!.referralsCode.toString(),
        "customerId": responseData.data!.customerId.toString(),
        "tier": responseData.data!.tier.toString(),
        "bvn": responseData.data!.bvn.toString(),
      },
    );

    //Get.offAllNamed(Routes.HOME);
    return true;
  }

  Future<bool> getAccount() async {
    var url = Uri.parse("$BaseUrl/Account");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    var response = await client.get(
      url,
      headers: header,
    );

    var responseData = AccountDetails.fromJson(json.decode(response.body));

    if (!(response.statusCode == 200)) {
      return false;
    }
    storesInfo(
      {
        "accountName": responseData.data!.accountName.toString(),
        "accountNumber": responseData.data!.accountNumber.toString(),
        "amount": responseData.data!.amount.toString()
      },
    );
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

  Future<bool> upgradeTier1(dynamic data) async {
    var url = Uri.parse("$BaseUrl/Account/upgrade-tier1");
    var response = await client.post(
      url,
      body: json.encode(data),
      headers: header,
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }

  storesInfo(Map<String, String> data) {
    data.forEach((key, value) => box.write(key, value));
    print(box.read("firstname"));
  }
}

_showDialog(String type, String message, bool? disable) {
  Get.defaultDialog(
    title: type,
    middleText: message,
  );
}

getStatusCode(int code, String message) {
  switch (code) {
    case 500:
      _showDialog("Error", "Server error", false);
      break;
    case 400:
      _showDialog("Error", message, false);
      break;
    default:
      _showDialog("Error", "Un known error", false);
  }
}
