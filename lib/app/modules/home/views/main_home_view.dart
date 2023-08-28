import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/data/const_data.dart';

import '../controllers/home_controller.dart';
import '../controllers/main_home_controller.dart';

class MainHomeView extends GetView {
  const MainHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainHomeController());
    var homeController = Get.put(HomeController());
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back, 👋',
                            style: TextStylesItem().mediumText.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Text(
                            'John Doe',
                            style: TextStylesItem().largeText.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.orange[100],
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "₦ 2,000",
                    style: TextStylesItem().largeText.copyWith(
                          fontSize: 60.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
              Positioned(
                bottom: -30,
                left: 70.r,
                right: 70.r,
                child: SizedBox(
                  height: 60.h,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xffF4E4CB,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Fund Wallet",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: controller.services
                    .map(
                      (e) => Expanded(
                        child: InkWell(
                          onTap: () => e.name == "More"
                              ? homeController.currentTab.value = 1
                              : Get.to(e.path),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color(0xffF8B858).withAlpha(26),
                                radius: 30.r,
                                child: Icon(
                                  e.icon,
                                  color: Colors.orange,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                e.name,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last transaction",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: Text(
                      "more",
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
