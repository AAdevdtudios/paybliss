import 'dart:convert';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/data/ApiServices.dart';
import 'package:paybliss/app/data/Models/UserResponse.dart';
import 'package:paybliss/app/modules/home/controllers/service_controller.dart';
import 'package:paybliss/app/modules/onboarding/views/onboarding_view.dart';
import 'package:paybliss/main.dart';

import '../../vtu_screens/views/airtime_vtu_view.dart';
import '../../vtu_screens/views/cable_vtu_view.dart';
import '../../vtu_screens/views/data_vtu_view.dart';
import '../../vtu_screens/views/electricity_vtu_view.dart';

class MainHomeController extends GetxController {
  var response = UserResponse().obs;
  RxBool isLoading = true.obs;
  RxBool showAmount = false.obs;
  RxBool showInfo = false.obs;
  List<ServicesItem> services = [
    ServicesItem(
      name: "Airtime",
      icon: Bootstrap.phone,
      path: const AirtimeVtuView(),
    ),
    ServicesItem(
      name: "Data",
      icon: Bootstrap.bar_chart_fill,
      path: const DataVtuView(),
    ),
    ServicesItem(
      name: "Cable Tv",
      icon: Bootstrap.tv_fill,
      path: const CableVtuView(),
    ),
    ServicesItem(
      name: "More",
      icon: IonIcons.ellipsis_horizontal_circle_sharp,
      path: const ElectricityVtuView(),
    ),
  ];
  @override
  void onInit() async {
    if (!(box.read("customerId") == null)) {
      showInfo.value = true;
    }
    showInfo.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print("Hello world");
  }

  Future getAccount() async {
    return await ApiServices().getAccount();
  }

  logOut() {
    box.erase();
    Get.offAll(const OnboardingView());
  }
}
