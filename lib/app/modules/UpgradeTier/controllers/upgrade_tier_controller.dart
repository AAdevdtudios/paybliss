import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:paybliss/app/data/ApiServices.dart';
import 'package:paybliss/app/modules/UpgradeTier/views/tier_one_view.dart';
import 'package:paybliss/app/modules/UpgradeTier/views/tier_three_view.dart';
import 'package:paybliss/app/modules/UpgradeTier/views/tier_two_view.dart';
import 'package:paybliss/main.dart';

class UpgradeTierController extends GetxController {
  var formState = GlobalKey<FormState>();
  var selectedDate = "Date of Birth".obs;
  List<String> gender = ["Male", "Female"];
  TextEditingController datePicked = TextEditingController();
  var placeOfBirth = TextEditingController();
  var selectedGender = "Male".obs;
  var country = TextEditingController();
  var street = TextEditingController();
  var city = TextEditingController();
  var state = TextEditingController();
  var postalCode = TextEditingController();
  File? selectedImage;
  var imageSelects = "".obs;

  String tier = box.read("tier");
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  List<Widget> screens = [
    const TierOneView(),
    const TierTwoView(),
    const TierThreeView(),
  ].obs;

  int tireNumber() {
    int val = 0;
    switch (tier) {
      case "Tier0":
        val = 0;
        break;
      case "Tier01":
        val = 1;
        break;
      case "Tier02":
        val = 2;
        break;
      default:
        val = 0;
        break;
    }
    return val;
  }

  showDate() async {
    DateTime? datePicker = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (datePicker != null && datePicker != selectedDate.value) {
      datePicked.text = DateFormat("dd-MM-yyyy").format(datePicker).toString();
    }
  }

  pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    if (selectedImage != null) {
      imageToBase64(selectedImage!.path);
    }
  }

  imageToBase64(String imagePath) async {
    // path of image
    File imageFile = File(imagePath);

    // Read bytes from the file object
    Uint8List bytes = await imageFile.readAsBytes();

    // base64 encode the bytes
    String base64String = base64.encode(bytes);
    imageSelects.value = base64String;
  }

  updateTireOne() async {
    if (formState.currentState!.validate() && imageSelects.value != "") {
      Map<String, String> data = {
        "place_of_birth": placeOfBirth.text,
        "dob": datePicked.text,
        "gender": selectedGender.value,
        "country": country.text,
        "street": street.text,
        "city": city.text,
        "state": state.text,
        "postal_code": postalCode.text,
        "image": imageSelects.string,
      };
      var res = await ApiServices().upgradeTier1(data);
      if (res == false) {
        Get.snackbar(
          "Error",
          "Unable to upgrade ${box.read("firstname")}, please confirm your details and try again",
        );
      }
      box.write("tier", "Tier1");
      Get.back();
    }
  }
}
