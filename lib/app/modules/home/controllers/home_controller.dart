import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/data/Models/UserResponse.dart';
import 'package:paybliss/app/modules/home/views/cards_view.dart';
import 'package:paybliss/app/modules/home/views/main_home_view.dart';
import 'package:paybliss/app/modules/home/views/profile_view.dart';
import 'package:paybliss/app/modules/home/views/services_view.dart';
import 'package:paybliss/main.dart';

class NavigationBarItemClass {
  final String name;
  final IconData icons;
  final IconData? altIcon;

  NavigationBarItemClass({
    required this.name,
    required this.icons,
    this.altIcon,
  });
}

class HomeController extends GetxController {
  var response = UserResponse().obs;
  RxBool isLoading = true.obs;

  RxInt currentTab = 0.obs;
  PageStorageBucket pageStorageBucket = PageStorageBucket();

  @override
  void onInit() {
    response.value = UserResponse.fromJson(box.read('user'));
    isLoading.value = false;
    super.onInit();
  }

  List<Widget> screens = [
    const MainHomeView(),
    const ServicesView(),
    const CardsView(),
    const ProfileView(),
  ];

  List<NavigationBarItemClass> navBarItems = [
    NavigationBarItemClass(
      name: "Home",
      icons: Icons.home_outlined,
      altIcon: Icons.home,
    ),
    NavigationBarItemClass(
      name: "Services",
      icons: Icons.wallet,
      altIcon: Bootstrap.wallet_fill,
    ),
    NavigationBarItemClass(
      name: "Card",
      icons: Icons.credit_card,
      altIcon: Bootstrap.credit_card_2_back_fill,
    ),
    NavigationBarItemClass(
      name: "Profile",
      icons: Bootstrap.person,
      altIcon: Bootstrap.person_fill,
    ),
  ];
}
