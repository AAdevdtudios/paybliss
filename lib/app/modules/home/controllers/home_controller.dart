import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/modules/home/views/cards_view.dart';
import 'package:paybliss/app/modules/home/views/main_home_view.dart';
import 'package:paybliss/app/modules/home/views/profile_view.dart';
import 'package:paybliss/app/modules/home/views/services_view.dart';

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
  RxInt currentTab = 0.obs;
  PageStorageBucket pageStorageBucket = PageStorageBucket();

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
      altIcon: Icons.wallet,
    ),
    NavigationBarItemClass(
      name: "Card",
      icons: Icons.credit_card,
      altIcon: Icons.credit_card_sharp,
    ),
    NavigationBarItemClass(
      name: "Profile",
      icons: Icons.account_box_outlined,
      altIcon: Icons.account_box,
    ),
  ];
}
