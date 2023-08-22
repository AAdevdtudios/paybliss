import 'package:get/get.dart';
import 'package:paybliss/app/modules/pin/views/confirm_pin_view.dart';
import 'package:paybliss/main.dart';

class PinController extends GetxController {
  RxList<String> values = ["", "", "", ""].obs;
  RxInt currentTab = 0.obs;
  RxString value = "".obs;

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

  confirmPin() {
    if (currentTab.value >= 3) {
      currentTab.value += 1;
      box.remove('confirm_pin');
      box.writeIfNull(
        'confirm_pin',
        value.value,
      );
      Get.to(const ConfirmPinView());
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
