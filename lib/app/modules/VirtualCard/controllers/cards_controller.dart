import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CardsController extends GetxController {
  RxInt tab = 0.obs;
  var pageController = PageController(initialPage: 0);

  changeView(int val) {
    tab.value = val;
    pageController.jumpToPage(tab.value);
  }
}
