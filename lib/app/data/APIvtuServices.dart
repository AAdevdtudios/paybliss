import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/main.dart';
import "package:http/http.dart" as http;

import 'ApiServices.dart';
import 'IVtu_Service.dart';

class VtuService implements IVtuService {
  static String vtu = "$BaseUrl/vtu";
  var client = http.Client();
  //Pay for airtime
  @override
  Future payAirtime(String network, amount, number) async {
    var url = Uri.parse(
        "$vtu/airtime?network=$network&amount=$amount&number=$number");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.post(
        url,
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        _showBottomSheet(
          "$amount was successfully credited",
          "Print Recept",
          FontAwesome.check,
          () => {},
          Colors.orange[300],
        );
      } else {
        _showVtuDialog(
          "Failed to Send",
          "Try again",
          Colors.red[100],
        );
      }
    } catch (e) {
      _showVtuDialog(
        "Network",
        "Unable to connect",
        Colors.red[100],
      );
    }
  }

  //Pay for Data
  @override
  Future payData(String network, plan, number, planName) async {
    var url = Uri.parse("$vtu/data?network=$network&plan=$plan&number=$number");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.post(
        url,
        headers: header,
      );
      if (response.statusCode == 200) {
        _showBottomSheet(
          "$planName was successfully credited",
          "Print Recept",
          FontAwesome.check,
          () => {},
          Colors.orange[300],
        );
      } else {
        _showVtuDialog(
          "Failed to Send",
          "Try again",
          Colors.red[100],
        );
      }
    } catch (e) {
      _showVtuDialog(
        "Network",
        "Unable to connect",
        Colors.red[100],
      );
    }
  }

  //Search for Data Value
  @override
  Future getDataValues(String network) async {
    var url = Uri.parse("$vtu/data?network=$network");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.get(
        url,
        headers: header,
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        _showVtuDialog(
          "Failed to Send",
          "Try again",
          Colors.red[100],
        );
      }
    } catch (e) {
      _showVtuDialog("Error", "Failed to load", Colors.red[200]);
    }
  }

  //Validate Cable eg Gotv Dstv
  @override
  Future<String> validateCable(
      String account, service, planId, int months) async {
    var url = Uri.parse(
        "$vtu/cable/validate?account=$account&service=$service&plan_id=$planId&months=$months");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.get(
        url,
        headers: header,
      );
      if (response.statusCode == 200) {
        return response.body[0].toString();
      } else {
        return "Invalid";
      }
    } catch (e) {
      return "Invalid";
    }
  }

  // List cables
  @override
  Future listCable(String account, service, planId, customerName) async {
    var url = Uri.parse(
        "$vtu/cable/list?account=$account&service=$service&planId=$planId&customerName=$customerName");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.get(
        url,
        headers: header,
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _showBottomSheet(
          "Failed to Send",
          "Try again",
          FontAwesome.xmark,
          () => {},
          Colors.red[100],
        );
      }
    } catch (e) {
      _showBottomSheet(
        "Network",
        "Unable to connect",
        FontAwesome.ban,
        () => Get.back(),
        Colors.red[100],
      );
    }
  }

  //Pay for Cable eg Gotv Dstv
  @override
  Future payCable(String account, service, planId, customerName) async {
    var url = Uri.parse(
        "$vtu/cable/pay?account=$account&service=$service&planId=$planId&customerName=$customerName");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.post(
        url,
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        _showBottomSheet(
          "GOTV 1 Month Subscription (2009594253) - GOTVNJ2.",
          "Print Recept",
          FontAwesome.check,
          () => {},
          Colors.orange[300],
        );
      } else {
        _showBottomSheet(
          "Failed to Send",
          "Try again",
          FontAwesome.xmark,
          () => {},
          Colors.red[100],
        );
      }
    } catch (e) {
      _showBottomSheet(
        "Network",
        "Unable to connect",
        FontAwesome.ban,
        () => Get.back(),
        Colors.red[100],
      );
    }
  }

  //Validate internet Eg Spectranet
  @override
  Future<String> internetValidate(
    String account,
    type,
  ) async {
    var url = Uri.parse("$vtu/internet/valid?account = $account&type = $type");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.get(
        url,
        headers: header,
      );
      if (response.statusCode == 200) {
        return "Name of user";
      } else {
        return "Failed";
      }
    } catch (e) {
      return "Failed";
    }
  }

  //List Data bundle
  @override
  Future<int?> listOfBundles(
    String account,
    type,
  ) async {
    var url = Uri.parse("$vtu/internet/list?account = $account&type = $type");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.get(
        url,
        headers: header,
      );
      if (response.statusCode == 200) {
        return 1;
      } else {
        _showVtuDialog("Failed", "Unable to getList", Colors.red[100]);
        return null;
      }
    } catch (e) {
      _showVtuDialog("Failed", "Unable to access information", Colors.red[100]);
      return null;
    }
  }

  //Pay for Internet
  @override
  Future payInternet(
    String account,
    type,
  ) async {
    var url = Uri.parse("$vtu/internet/pay?account=$account&type=$type");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.post(
        url,
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        _showBottomSheet(
          "GOTV 1 Month Subscription (2009594253) - GOTVNJ2.",
          "Print Recept",
          FontAwesome.check,
          () => {},
          Colors.orange[300],
        );
      } else {
        _showVtuDialog(
          "Failed to Send",
          "Try again",
          Colors.red[100],
        );
      }
    } catch (e) {
      _showVtuDialog(
        "Network",
        "Unable to connect",
        Colors.red[100],
      );
    }
  }

  // Get EPin
  @override
  Future getEpin() async {
    var url = Uri.parse("$vtu/education/get");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.get(
        url,
        headers: header,
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _showVtuDialog("Failed", "Failed to Load", Colors.red[200]);
      }
    } catch (e) {
      _showVtuDialog("Failed", "Failed to connect", Colors.red[200]);
    }
  }

  //Recharge Epin
  @override
  Future rechargeEpin(String id, ref, int qty) async {
    var url = Uri.parse("$vtu/Education/pay?id=$id&ref=$ref&qty=$qty");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.post(
        url,
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        _showBottomSheet(
          "Success",
          "Print Recept",
          FontAwesome.check,
          () => {},
          Colors.orange[300],
        );
      } else {
        _showVtuDialog(
          "Failed to Send",
          "Try again",
          Colors.red[100],
        );
      }
    } catch (e) {
      _showVtuDialog(
        "Network",
        "Unable to connect",
        Colors.red[100],
      );
    }
  }

  //Retrieve Pin
  @override
  Future retrieveEpin(String transId) async {
    var url = Uri.parse("$vtu/education/retrieve?trans_id=$transId");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.get(
        url,
        headers: header,
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _showVtuDialog(
          "Failed to Send",
          "Try again",
          Colors.red[100],
        );
      }
    } catch (e) {
      _showVtuDialog(
        "Network",
        "Unable to connect",
        Colors.red[100],
      );
    }
  }

  //Validate Electricity
  @override
  Future validateElectricity(
      String meterNumber, meterType, amount, service) async {
    var url = Uri.parse(
        "$vtu/electricity/valid?meter_number=$meterNumber&meter_type=$meterType&amount=$amount&service=$service");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.post(
        url,
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _showVtuDialog(
          "Failed to Send",
          "Try again",
          Colors.red[100],
        );
      }
    } catch (e) {
      _showVtuDialog(
        "Network",
        "Unable to connect",
        Colors.red[100],
      );
    }
  }

  //Pay for electricity
  @override
  Future payElectricity(String meterNumber, meterType, amount, service,
      productCode, info, customerName) async {
    var url = Uri.parse(
      "$vtu/electricity/pay?meter_number=$meterNumber&meter_type=$meterType&amount=$amount&service=$service&product_code=$productCode&info=$info&customer_name=$customerName",
    );
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.post(
        url,
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        _showBottomSheet(
          "Electricity pay",
          "Print Recept",
          FontAwesome.check,
          () => {},
          Colors.orange[300],
        );
      } else {
        _showVtuDialog(
          "Failed to Send",
          "Try again",
          Colors.red[100],
        );
      }
    } catch (e) {
      _showVtuDialog(
        "Network",
        "Unable to connect",
        Colors.red[100],
      );
    }
  }

  //Get bet
  @override
  Future getBets() async {
    var url = Uri.parse("$vtu/bet/list");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.get(url, headers: header);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _showVtuDialog(
          "Failed",
          "Unable to load",
          Colors.red[200],
        );
      }
    } catch (e) {
      _showVtuDialog(
        "Network",
        "Unable to load",
        Colors.red[200],
      );
    }
  }

  //Validate bet
  @override
  Future validateBet(String betId, customerId) async {
    var url = Uri.parse("$vtu/bet/valid?bet_id=$betId&customer_id=$customerId");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.post(
        url,
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _showVtuDialog(
          "Failed to Send",
          "Try again",
          Colors.red[100],
        );
      }
    } catch (e) {
      _showVtuDialog(
        "Network",
        "Unable to connect",
        Colors.red[100],
      );
    }
  }

  //Pay for bet
  @override
  Future payBet(String betId, customerId, amount, customerName) async {
    var url = Uri.parse(
        "$vtu/bet/valid?bet_id=$betId&customer_id=$customerId&amount=$amount&customerName=$customerName");
    header["Authorization"] = "Bearer ${box.read("jwt")}";
    try {
      var response = await client.post(
        url,
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        _showBottomSheet(
          "$customerId Successful",
          "Print Recept",
          FontAwesome.check,
          () => {},
          Colors.orange[300],
        );
      } else {
        _showVtuDialog(
          "Failed to Send",
          "Try again",
          Colors.red[100],
        );
      }
    } catch (e) {
      _showVtuDialog(
        "Network",
        "Unable to connect",
        Colors.red[100],
      );
    }
  }

  @override
  Future getTransport() {
    throw UnimplementedError();
  }
}

_showBottomSheet(
    String title, btnText, IconData icon, Function callBack, Color? color) {
  Get.bottomSheet(
    SizedBox(
      height: 150,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
            ),
          ),
          Text(
            title,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => callBack,
                child: Text(
                  btnText,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    barrierColor: Colors.grey[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(35),
    ),
    enableDrag: false,
    isDismissible: false,
  );
}

_showVtuDialog(String type, String message, Color? color) {
  Get.defaultDialog(title: type, middleText: message, backgroundColor: color);
}
