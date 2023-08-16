import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/login/views/login_view.dart';

import '../../signup/views/signup_view.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    const Color kDarkBlueColor = Color(0xFFEE9105);
    return Scaffold(
      body: OnBoardingSlider(
        finishButtonText: 'Create account',
        onFinish: () => Get.to(const SignupView()),
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: kDarkBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        skipTextButton: const Text(
          'Skip',
          style: TextStyle(
            fontSize: 16,
            color: kDarkBlueColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Text(
          'Login',
          style: TextStyle(
            fontSize: 16,
            color: kDarkBlueColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailingFunction: () => Get.to(const LoginView()),
        controllerColor: kDarkBlueColor,
        totalPage: 4,
        headerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        pageBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        background: controller.onboardItems
            .map(
              (e) => Image.asset(
                e.image,
                height: 400,
              ),
            )
            .toList(),
        speed: 1.8,
        pageBodies: controller.onboardItems
            .map((e) => Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 500.h,
                      ),
                      Text(
                        e.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: kDarkBlueColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        e.sub,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
