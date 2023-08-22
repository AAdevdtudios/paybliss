import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/home/controllers/cards_controller.dart';

class CardsView extends GetView {
  const CardsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CardsController());
    return Column(
      children: [
        Obx(
          () => CupertinoTabBar(
            backgroundColor: Colors.green,
            onTap: (val) => controller.tab.value = val,
            currentIndex: controller.tab.value,
            items: const [
              BottomNavigationBarItem(
                icon: Text(
                  "NGN",
                ),
              ),
              BottomNavigationBarItem(
                icon: Text(
                  "USD",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
