import 'package:get/get.dart';

import 'package:paybliss/app/modules/home/controllers/booking_controller.dart';
import 'package:paybliss/app/modules/home/controllers/cards_controller.dart';
import 'package:paybliss/app/modules/home/controllers/main_home_controller.dart';
import 'package:paybliss/app/modules/home/controllers/profile_controller.dart';
import 'package:paybliss/app/modules/home/controllers/service_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingController>(
      () => BookingController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ServiceController>(
      () => ServiceController(),
    );
    Get.lazyPut<CardsController>(
      () => CardsController(),
    );
    Get.lazyPut<MainHomeController>(
      () => MainHomeController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
