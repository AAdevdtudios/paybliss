import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:paybliss/main.dart';

class EditProfileController extends GetxController {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    firstname.text = box.read("firstname");
    lastname.text = box.read("lastname");
    email.text = box.read("email");
  }
}
