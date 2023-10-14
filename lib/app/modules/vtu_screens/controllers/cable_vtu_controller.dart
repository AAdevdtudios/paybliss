import 'package:get/get.dart';

class CableVtuController extends GetxController {
  RxString selectedValue = "GOTV".obs;
  RxList<String> cables = ["GOTV", "DSTv", "Startimes"].obs;
  RxBool isValid = false.obs;
}
