import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardItems {
  final String image;
  final double position;
  final String description;
  final String sub;

  OnboardItems({
    required this.image,
    required this.position,
    required this.description,
    required this.sub,
  });
}

class OnboardingController extends GetxController {
  RxInt currentView = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  changeVal(val) {
    currentView.value = val;
  }

  List<OnboardItems> onboardItems = [
    OnboardItems(
        image: 'assets/images/slide1.png',
        position: -10,
        description: 'Convert between currencies at ',
        sub: 'best exchange rates'),
    OnboardItems(
        image: 'assets/images/slide-2.png',
        position: -10,
        description: 'Create a virtual dollar card and make ',
        sub: 'global payment'),
    OnboardItems(
        image: 'assets/images/slide-3.png',
        position: -10,
        description: 'Pay your international subscription with ',
        sub: 'virtual card'),
    OnboardItems(
        image: 'assets/images/slide-4.png',
        position: -10,
        description: 'Never miss a bill payment again with ',
        sub: 'Paybliss'),
  ].obs;
}
