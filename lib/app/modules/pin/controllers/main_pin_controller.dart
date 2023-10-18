import 'package:get/get.dart';
import 'package:paybliss/app/data/ApiServices.dart';

class MainPinController extends GetxController {
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
      isLoading.value = true;
      currentTab.value += 1;
      await ApiServices().loginPin(int.parse(value.value));
      isLoading.value = false;
      // Future.delayed(
      //   const Duration(
      //     seconds: 7,
      //   ),
      //   () {
      //     if (box.read("pin_code") == value.value) {
      //       Get.offAllNamed(Routes.HOME);
      //       isLoading.value = false;
      //     } else {
      //       Get.snackbar("Error", "Pin code is invalid");
      //       isLoading.value = false;
      //     }
      //   },
      // );
      // print(loginAuth);
      // if (loginAuth == true) {
      //   isLoading.value = false;
      // }
      // isLoading.value = false;
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
