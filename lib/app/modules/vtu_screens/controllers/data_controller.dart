import 'dart:convert';

import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/data/props.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../data/networks_model.dart';

class DataController extends GetxController {
  var phoneNumber = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final listDropdownController = DropdownController();
  RxInt currentVal = 0.obs;
  RxBool isValid = false.obs;
  List<CoolDropdownItem<DropIcon>> pokemonDropdownItems = [];
  Rx<Networks> allNetwork = Networks().obs;
  RxList<String> data = ["GOTV", "DSTv", "Startimes"].obs;
  RxString selectedVal = "GOTV".obs;

  @override
  void onReady() {
    getDataValues();
    super.onReady();
  }

  Future<void> getDataValues() async {
    try {
      var feedNetwork =
          await rootBundle.loadString("assets/json/networks.json");
      allNetwork.value = Networks.fromJson(jsonDecode(feedNetwork));
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  List<DropIcon> networks = [
    DropIcon(
      name: "MTN",
      icon: "MTN.svg",
      itemNo: 0,
    ),
    DropIcon(
      name: "Airtel",
      icon: "Airtel.svg",
      itemNo: 1,
    ),
    DropIcon(
      name: "Glo",
      icon: "Glo.svg",
      itemNo: 2,
    ),
    DropIcon(
      name: "9mobile",
      icon: "9mobile.svg",
      itemNo: 3,
    ),
  ];
  changeInput(String val) {
    makeChecks();
    if (val.length >= 3) {
      val = val.replaceAll("-", "");
      if (MtnNet.contains(val)) {
        currentVal.value = 0;
      } else if (AirtelNet.contains(val)) {
        currentVal.value = 1;
      } else if (GloNet.contains(val)) {
        currentVal.value = 2;
      } else if (EtiNet.contains(val)) {
        currentVal.value = 3;
      }
    }
  }

  makeChecks() {
    if (formKey.currentState!.validate()) {
      isValid.value = true;
    } else {
      isValid.value = false;
    }
  }

  @override
  void onInit() {
    for (var i = 0; i < networks.length; i++) {
      pokemonDropdownItems.add(
        CoolDropdownItem<DropIcon>(
          label: networks[i].name,
          icon: SvgPicture.asset(
            "assets/svg/${networks[i].icon}",
            width: 15,
            height: 15,
          ),
          value: networks[i],
        ),
      );
    }
    super.onInit();
  }

  onDropdownTap(int val) {
    listDropdownController.close();
    currentVal.value = val;
  }
}
