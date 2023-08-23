import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paybliss/app/data/const_data.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    var controller = Get.put(HomeController());
    var theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xffF8B858),
          currentIndex: controller.currentTab.value,
          selectedIconTheme: const IconThemeData(
            size: 25,
          ),
          unselectedIconTheme: const IconThemeData(
            size: 30,
          ),
          selectedLabelStyle: TextStylesItem().largeText.copyWith(
                fontSize: 17.sp,
              ),
          onTap: (val) => controller.currentTab.value = val,
          items: List.generate(
            controller.navBarItems.length,
            (index) => BottomNavigationBarItem(
              activeIcon: Icon(
                controller.navBarItems[index].altIcon,
              ),
              icon: Icon(
                controller.navBarItems[index].icons,
              ),
              label: controller.currentTab.value == index
                  ? controller.navBarItems[index].name
                  : "",
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 25.r,
            vertical: 20.r,
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey Elijah 👋',
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      'What bills would you like to pay with Paybliss',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.qr_code_2),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => PageStorage(
                bucket: controller.pageStorageBucket,
                child: controller.screens[controller.currentTab.value],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
