import 'package:get/get.dart';

class ElectricityController extends GetxController {
  RxString meterType = "Prepaid".obs;
  RxList<String> meterTypes = ["Prepaid", "Postpaid"].obs;
  RxList<String> service =
      ["ikedc", "ekedc", "eedc", "phedc", "aedc", "ibedc", "kedco", "jed"].obs;
  RxString meterService = "ikedc".obs;
}
