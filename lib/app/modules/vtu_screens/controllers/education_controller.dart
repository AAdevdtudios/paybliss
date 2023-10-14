import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EducationController extends GetxController {
  RxString pinService = "WAEC".obs;
  RxList<String> services = ["WAEC", "NECO"].obs;
  TextEditingController amount = TextEditingController(text: "3900");
}
