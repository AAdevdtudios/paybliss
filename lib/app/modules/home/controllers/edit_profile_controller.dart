import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/data/ApiServices.dart';
import 'package:paybliss/main.dart';

class EditProfileController extends GetxController {
  var formState = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  RxBool isValid = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    firstname.text = box.read("firstname");
    lastname.text = box.read("lastname");
    email.text = box.read("email");
  }

  makeChecks() {
    if (formState.currentState!.validate()) {
      isValid.value = true;
    } else {
      isValid.value = false;
    }
  }

  updateUser() async {
    Map<String, dynamic> user = {
      "firstname": firstname.text,
      "lastname": lastname.text,
      "email": email.text,
    };
    isLoading.value = true;
    print("Running");
    await ApiServices().updateUser(user);
    isLoading.value = false;
  }
}
