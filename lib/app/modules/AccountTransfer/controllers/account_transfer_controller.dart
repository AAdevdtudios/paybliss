import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybliss/main.dart';

class AccountTransferController extends GetxController {
  TextEditingController bankName = TextEditingController();
  RxList<String> values = ["", "", "", ""].obs;
  RxInt currentTab = 0.obs;
  RxString value = "".obs;
  RxBool isLoading = false.obs;

  removeLast() {
    if (currentTab.value == 0) {
    } else {
      currentTab.value -= 1;
      List<String> c = value.value.split("");
      c.removeLast();
      value.value = c.join();
      updateReactiveList("");
    }
  }

  onTapFunction(int index) {
    if (index != 10) {
      int sum = index + 1;
      updateReactiveList(sum.toString());
      value.value += sum.toString();
      if (currentTab.value >= 3) {
        confirmPin();
      } else {
        confirmPin();
      }
    } else {
      value.value += "0";
      updateReactiveList("0");
      confirmPin();
    }
  }

  confirmPin() async {
    if (currentTab.value >= 3) {
      Future.delayed(
        const Duration(
          seconds: 7,
        ),
        () {
          if (box.read("pin_code") == value.value) {
            Get.snackbar("Successful", "Transfer complete");
            isLoading.value = false;
            Get.back();
          } else {
            Get.snackbar("Error", "Pin code is invalid");
            isLoading.value = false;
          }
        },
      );
    } else {
      currentTab.value += 1;
    }
  }

  updateReactiveList(String value) {
    values.removeAt(currentTab.value);
    values.insert(currentTab.value, value);
    values.refresh();
  }
}
