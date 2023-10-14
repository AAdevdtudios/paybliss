import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  var index = 0.obs;
  List<String> bookStyle = ["Flight", "Hotels"];
  var selectedDate = DateTime.now().obs;
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
}
