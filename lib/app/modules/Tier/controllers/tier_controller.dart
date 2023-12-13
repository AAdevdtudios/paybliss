import 'package:get/get.dart';
import 'package:paybliss/main.dart';

class Tier {
  final String name;
  final String description;
  final String minimum;
  final String maximum;
  final String access;

  Tier(
      {required this.name,
      required this.description,
      required this.minimum,
      required this.maximum,
      required this.access});
}

class TierController extends GetxController {
  String tier = box.read("tier");
  List<Tier> tires = [
    Tier(
      name: "Tier 1",
      description: "N 50,000",
      minimum: "N 50,000",
      maximum: "N 300,000",
      access: "Get access to all our services",
    ),
    Tier(
      name: "Tier 2",
      description: "N 50,000",
      minimum: "N 200,000",
      maximum: "N 500,000",
      access: "Get access to Virtual dollar card",
    ),
    Tier(
      name: "Tier 3",
      description: "N 50,000",
      minimum: "N 5,000,000",
      maximum: "Unlimited",
      access: "Connect to merchant account with bliss",
    ),
  ];

  double checkTier() {
    double val = 0;
    switch (tier) {
      case "Tier0":
        val = .2;
        break;
      case "Tier01":
        val = .4;
        break;
      case "Tier02":
        val = .5;
        break;
      default:
        val = 1;
        break;
    }
    return val;
  }

  int tireNumber() {
    int val = 0;
    switch (tier) {
      case "Tier0":
        val = 0;
        break;
      case "Tier01":
        val = 1;
        break;
      case "Tier02":
        val = 2;
        break;
      default:
        val = 0;
        break;
    }
    return val;
  }
}
