import 'package:get/get.dart';

import '../../main.dart';
import '../modules/AccountTransfer/bindings/account_transfer_binding.dart';
import '../modules/AccountTransfer/views/account_transfer_view.dart';
import '../modules/Notifications/bindings/notifications_binding.dart';
import '../modules/Notifications/views/notifications_view.dart';
import '../modules/Permission/bindings/permission_binding.dart';
import '../modules/Permission/views/permission_view.dart';
import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/TagTransfer/bindings/tag_transfer_binding.dart';
import '../modules/TagTransfer/views/tag_transfer_view.dart';
import '../modules/Tier/bindings/tier_binding.dart';
import '../modules/Tier/views/tier_view.dart';
import '../modules/TransactionHistory/bindings/transaction_history_binding.dart';
import '../modules/TransactionHistory/views/transaction_history_view.dart';
import '../modules/Transfer/bindings/transfer_binding.dart';
import '../modules/Transfer/views/transfer_view.dart';
import '../modules/UpgradeTier/bindings/upgrade_tier_binding.dart';
import '../modules/UpgradeTier/views/upgrade_tier_view.dart';
import '../modules/VirtualCard/bindings/virtual_card_binding.dart';
import '../modules/VirtualCard/views/virtual_card_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/pin/bindings/pin_binding.dart';
import '../modules/pin/views/new_pin_view.dart';
import '../modules/pin/views/pin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/vtu_screens/bindings/vtu_screens_binding.dart';
import '../modules/vtu_screens/views/vtu_screens_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;
  static const ONBOARDING = Routes.ONBOARDING;
  static const PINCODE = Routes.PIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      children: [
        GetPage(
          name: _Paths.FORGOT_PASSWORD,
          page: () => const ForgotPasswordView(),
          binding: ForgotPasswordBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PIN,
      page: () => box.read('pin_code') == 0 || box.read('pin_code') == "0"
          ? const NewPinView()
          : const PinView(),
      binding: PinBinding(),
    ),
    GetPage(
      name: _Paths.VTU_SCREENS,
      page: () => const VtuScreensView(),
      binding: VtuScreensBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION_HISTORY,
      page: () => const TransactionHistoryView(),
      binding: TransactionHistoryBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER,
      page: () => const TransferView(),
      binding: TransferBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_TRANSFER,
      page: () => const AccountTransferView(),
      binding: AccountTransferBinding(),
    ),
    GetPage(
      name: _Paths.TAG_TRANSFER,
      page: () => const TagTransferView(),
      binding: TagTransferBinding(),
    ),
    GetPage(
      name: _Paths.VIRTUAL_CARD,
      page: () => const VirtualCardView(),
      binding: VirtualCardBinding(),
    ),
    GetPage(
      name: _Paths.PERMISSION,
      page: () => const PermissionView(),
      binding: PermissionBinding(),
    ),
    GetPage(
      name: _Paths.TIER,
      page: () => const TierView(),
      binding: TierBinding(),
    ),
    GetPage(
      name: _Paths.UPGRADE_TIER,
      page: () => const UpgradeTierView(),
      binding: UpgradeTierBinding(),
    ),
  ];
}
