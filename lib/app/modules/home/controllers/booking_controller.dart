import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:intl/intl.dart';

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
            "https://airports-by-api-ninjas.p.rapidapi.com/v1/airports?name=${fromSearch.text}"),
        headers: {
          'X-RapidAPI-Key':
              '7511401619mshdd5d7ccfa91ac69p16d883jsn60f05734c744',
          'X-RapidAPI-Host': 'airports-by-api-ninjas.p.rapidapi.com'
        },
      );
      if (res.statusCode == 200) {
        List<dynamic> response = json.decode(res.body);
        data = response.map((e) => e["name"].toString()).toList();
        print(data);
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
            "https://airports-by-api-ninjas.p.rapidapi.com/v1/airports?name=${toSearch.text}"),
        headers: {
          'X-RapidAPI-Key':
              '7511401619mshdd5d7ccfa91ac69p16d883jsn60f05734c744',
          'X-RapidAPI-Host': 'airports-by-api-ninjas.p.rapidapi.com'
        },
      );
      if (res.statusCode == 200) {
        List<dynamic> response = json.decode(res.body);
        data = response.map((e) => e["name"].toString()).toList();
        print(data);
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
