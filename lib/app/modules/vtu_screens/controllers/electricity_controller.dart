import 'package:get/get.dart';

class ElectricityController extends GetxController {
  RxString meterType = "Prepaid".obs;
  RxList<String> meterTypes = ["Prepaid", "Postpaid"].obs;
}
