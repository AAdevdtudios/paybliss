import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class OnboardItems {
  final String image;
  final String title;
  final String sub;

  OnboardItems({
    required this.image,
    required this.title,
    required this.sub,
  });
}

class OnboardingController extends GetxController {
  @override
  void onInit() {
    AwesomeNotifications().isNotificationAllowed().then((value) {
      if (!value) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.onInit();
  }

  List<OnboardItems> onboardItems = [
    OnboardItems(
      image: 'assets/images/bills.png',
      title: 'Never miss a payment',
      sub:
          'Pay your electricity, internet, and other utility bills quickly and easy',
    ),
    OnboardItems(
      image: 'assets/images/create_card.png',
      title: 'Create virtual card',
      sub:
          'Create a virtual dollar card and pay for international items and products',
    ),
    OnboardItems(
      image: 'assets/images/crypto.png',
      title: 'Get Crypto',
      sub: 'With Blissbill you can fund your crypto wallet',
    ),
    OnboardItems(
      image: 'assets/images/ticket.png',
      title: 'Book Online',
      sub:
          'With Blissbill you can book flight ticket locally or internationally',
    ),
  ];
}
