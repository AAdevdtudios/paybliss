import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import "package:http/http.dart" as http;

class BookingController extends GetxController {
  var index = 0.obs;
  List<String> bookStyle = ["Flight", "Hotels"];
  var selectedDate = DateTime.now().obs;
  TextEditingController toSearch = TextEditingController();
  TextEditingController fromSearch = TextEditingController();

  @override
  void onInit() {
    fromSearch = TextEditingController();
    toSearch = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    fromSearch = TextEditingController();
    toSearch = TextEditingController();
    super.onReady();
  }

  @override
  void onClose() {
    fromSearch.dispose();
    toSearch.dispose();
    super.onClose();
  }

  TextEditingController datePicked = TextEditingController(
    text: DateTime.now().toString(),
  );

  showDate() async {
    DateTime? datePicker = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (datePicker != null && datePicker != selectedDate.value) {
      datePicked.text = DateFormat("dd-MM-yyyy").format(datePicker).toString();
    }
  }

  getSearch() async {
    List<String> data = [];
    try {
      var res = await http.get(
        Uri.parse(
            "https://test.api.amadeus.com/v1/reference-data/locations?subType=CITY,AIRPORT&keyword=${fromSearch.text}"),
        headers: {
          "Authorization": "Bearer 4Zu7A4TBHQ2NQqtxyWbhNasxTUHe",
        },
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> response = json.decode(res.body);
        for (var value in response["data"]) {
          data.add(value["name"]);
        }
        if (data.isEmpty) {
          return "No data found";
        }
        return data;
      } else if (res.statusCode == 401) {
        print("Me");
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  toFetch() async {
    List<String> data = [];
    try {
      var res = await http.get(
        Uri.parse(
            "https://test.api.amadeus.com/v1/reference-data/locations?subType=CITY,AIRPORT&keyword=${toSearch.text}"),
        headers: {
          "Authorization": "Bearer gbK0m9UmKC1Q9OOzPErrzA2Wahz6",
        },
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> response = json.decode(res.body);
        for (var value in response["data"]) {
          data.add(value["name"]);
        }
        if (data.isEmpty) {
          return "No data found";
        }
        return data;
      } else if (res.statusCode == 401) {
        print("Me");
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
