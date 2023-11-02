import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/data/APIvtuServices.dart';
import 'package:paybliss/app/data/Models/DataPlan.dart';
import 'package:paybliss/app/data/props.dart';

import '../../../data/networks_model.dart';

class DataController extends GetxController {
  var phoneNumber = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final listDropdownController = DropdownController();
  RxInt currentVal = 0.obs;
  RxBool isValid = false.obs;
  List<CoolDropdownItem<DropIcon>> pokemonDropdownItems = [];
  Rx<Networks> allNetwork = Networks().obs;
  //Set up
  RxString network = "MTN".obs;

  var selectedPart = Rxn<DataPlan>();

  @override
  void onReady() {
    getDataValues();
    super.onReady();
  }

  Future getDataValues() async {
    try {
      Map<String, dynamic> res =
          await VtuService().getDataValues(network.value);

      List<DataPlan> dataPlan = [];
      for (var u in res["data"]) {
        DataPlan plan = DataPlan(
          planCode: u["plan_code"],
          name: u["name"],
          amount: u["amount"],
        );
        dataPlan.add(plan);
      }
      return dataPlan;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  selectedPlan(val) {
    selectedPart.value = val;
    print(selectedPart.value!.amount);
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
        network.value = "MTN";
      } else if (AirtelNet.contains(val)) {
        currentVal.value = 1;
        network.value = "Airtel";
      } else if (GloNet.contains(val)) {
        currentVal.value = 2;
        network.value = "GLO";
      } else if (EtiNet.contains(val)) {
        currentVal.value = 3;
        network.value = "9mobile";
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
