import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    var controller = Get.put(SplashScreenController());
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: AnimatedPositioned(
            duration: const Duration(seconds: 3),
            child: Image.asset(
              "assets/icons/logo_img.png",
            ),
          ),
        ),
      ),
    );
  }
}
