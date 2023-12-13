import 'package:get/get.dart';
import 'package:paybliss/app/modules/pin/views/confirm_pin_view.dart';
import 'package:paybliss/main.dart';

class PinController extends GetxController {
  RxList<String> values = ["", "", "", ""].obs;
  RxInt currentTab = 0.obs;
  RxString value = "".obs;
  RxBool isLoading = false.obs;

  confirmPin(String val) async {
    box.write("confirm_pin", value.value);
    Get.to(const ConfirmPinView());
  }
}
