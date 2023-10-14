import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/modules/home/views/booking_view.dart';
import 'package:paybliss/app/modules/vtu_screens/views/airtime_vtu_view.dart';
import 'package:paybliss/app/modules/vtu_screens/views/betting_view.dart';
import 'package:paybliss/app/modules/vtu_screens/views/cable_vtu_view.dart';
import 'package:paybliss/app/modules/vtu_screens/views/data_vtu_view.dart';
import 'package:paybliss/app/modules/vtu_screens/views/education_vtu_view.dart';
import 'package:paybliss/app/modules/vtu_screens/views/electricity_vtu_view.dart';

class ServicesItem {
  final String name;
  final IconData icon;
  final Widget path;

  ServicesItem({required this.name, required this.icon, required this.path});
}

class ServiceController extends GetxController {
  List<ServicesItem> services = [
    ServicesItem(
      name: "Airtime",
      icon: Bootstrap.phone,
      path: const AirtimeVtuView(),
    ),
    ServicesItem(
      name: "Data",
      icon: Bootstrap.bar_chart_fill,
      path: const DataVtuView(),
    ),
    ServicesItem(
      name: "Cable Tv",
      icon: Bootstrap.tv_fill,
      path: const CableVtuView(),
    ),
    ServicesItem(
      name: "Electricity",
      icon: Bootstrap.lightning_charge_fill,
      path: const ElectricityVtuView(),
    ),
    ServicesItem(
      name: "Education",
      icon: Bootstrap.book_half,
      path: const EducationVtuView(),
    ),
    ServicesItem(
      name: "Betting",
      icon: FontAwesome.dice,
      path: const BettingView(),
    ),
    ServicesItem(
      name: "Booking",
      icon: Bootstrap.airplane,
      path: const BookingView(),
    ),
  ];
}
