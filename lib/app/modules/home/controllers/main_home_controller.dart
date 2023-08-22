import 'package:get/get.dart';

class RowItems {
  final String name;
  final String image;
  final String description;

  RowItems(
      {required this.name, required this.image, required this.description});
}

class MainHomeController extends GetxController {
  List<RowItems> slides = [
    RowItems(
      name: "Betting",
      description:
          "Quick access to deposit money in your preferred betting platform",
      image: "",
    ),
    RowItems(
      name: "Traveling",
      description: "Book for flight ticket at your own comfort",
      image: "",
    ),
    RowItems(
      name: "Hotel",
      description: "Book for Hotels near you and reserve a space",
      image: "",
    ),
  ];
}
