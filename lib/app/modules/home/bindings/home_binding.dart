import 'package:get/get.dart';
import 'package:paybliss/app/modules/VirtualCard/controllers/cards_controller.dart';
import 'package:paybliss/app/modules/home/controllers/account_security_controller.dart';
import 'package:paybliss/app/modules/home/controllers/booking_controller.dart';
import 'package:paybliss/app/modules/home/controllers/edit_profile_controller.dart';
import 'package:paybliss/app/modules/home/controllers/help_controller.dart';
import 'package:paybliss/app/modules/home/controllers/main_home_controller.dart';
import 'package:paybliss/app/modules/home/controllers/otp_pin_reset_controller.dart';
import 'package:paybliss/app/modules/home/controllers/profile_controller.dart';
import 'package:paybliss/app/modules/home/controllers/reset_password_controller.dart';
import 'package:paybliss/app/modules/home/controllers/service_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpPinResetController>(
      () => OtpPinResetController(),
    );
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
    );
    Get.lazyPut<AccountSecurityController>(
      () => AccountSecurityController(),
    );
    Get.lazyPut<HelpController>(
      () => HelpController(),
    );
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
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
