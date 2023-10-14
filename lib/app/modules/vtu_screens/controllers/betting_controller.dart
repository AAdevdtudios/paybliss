import 'package:get/get.dart';

class BettingController extends GetxController {
  RxString betService = "Bet9ja".obs;
  RxList<String> betServices = ["Bet9ja", "BetClub"].obs;
  List<BettingItems> items = [];
}

class BettingItems {
  final String id;
  final String title;

  BettingItems({required this.id, required this.title});
}
