import 'package:get/get.dart';
import 'package:paybliss/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:paybliss/app/modules/pin/views/new_pin_view.dart';
import 'package:paybliss/app/modules/pin/views/pin_view.dart';
import 'package:paybliss/main.dart';
import 'package:video_player/video_player.dart';

class SplashScreenController extends GetxController {
  late VideoPlayerController videoPlayerController;
  RxBool isCalled = false.obs;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await _moveToNextScreen();
  }

  _moveToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    if (box.read('jwt') == null) {
      Get.offAll(OnboardingBinding());
    } else if (box.read('pin_code') == 0 || box.read('pin_code') == "0") {
      Get.offAll(const NewPinView());
    } else {
      Get.offAll(const PinView());
    }
  }
}
