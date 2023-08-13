import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        children: [
          SizedBox(
            height: 700.h,
            width: double.infinity,
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (val) => controller.changeVal(val),
              children: List.generate(
                controller.onboardItems.length,
                (index) => ListView(
                  children: [
                    Obx(
                      () => SizedBox(
                        height: 500.h,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child:
                              Image.asset(controller.onboardItems[index].image),
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: controller.onboardItems[index].description,
                          ),
                          TextSpan(
                            text: controller.onboardItems[index].sub,
                            style: GoogleFonts.inter(
                              color: const Color(0xffF8B858),
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                controller.onboardItems.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: 15,
                  width: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: controller.currentView.value == index
                        ? const Color(0xffF8B858)
                        : const Color(0xff312E2E),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 62,
            child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF8B858),
                foregroundColor: Colors.black,
                textStyle: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Get Started'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Have an account? '),
                TextSpan(
                  text: 'Sign Up',
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffF8B858),
                  ),
                ),
              ],
            ),
            style: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
