import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:paybliss/app/data/const_data.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    var controller = Get.put(HomeController());
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xfff8b858),
      ),
    );
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
                fontSize: 13.sp,
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
      body: LiquidPullToRefresh(
        backgroundColor: Theme.of(context).primaryColor,
        color: Colors.black,
        showChildOpacityTransition: false,
        onRefresh: () async => await controller.getAccount(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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
