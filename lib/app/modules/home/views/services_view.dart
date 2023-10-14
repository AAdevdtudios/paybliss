import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/home/controllers/service_controller.dart';

class ServicesView extends GetView {
  const ServicesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ServiceController());
    var theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Services",
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: 40.sp,
              ),
            ),
            Text(
              'What bills would you like to pay with Blissbill',
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
              ),
              children: List.generate(
                controller.services.length,
                (index) => InkWell(
                  onTap: () => Get.to(
                    controller.services[index].path,
                    transition: Transition.rightToLeft,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                    ),
                    child: GridTile(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.amber[100],
                            radius: 30.r,
                            child: Icon(
                              controller.services[index].icon,
                              size: 40.r,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.services[index].name,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ).animate(interval: 400.ms).fade().slideX(duration: 200.ms),
            ),
          ],
        ),
      ),
    );
  }
}
