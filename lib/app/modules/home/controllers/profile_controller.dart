import 'package:get/get.dart';
import 'package:paybliss/app/modules/onboarding/views/onboarding_view.dart';
import 'package:paybliss/main.dart';

class ProfileController extends GetxController {
  logout() {
    box.erase();
    Get.offAll(const OnboardingView());
  }
}
