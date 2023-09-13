import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
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
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(11),
        child: controller.isLoading.value
            ? const Center(
                child: Text("Loading"),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            child: Icon(
                              Bootstrap.person_fill,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Welcome \n",
                              children: [
                                TextSpan(
                                  text:
                                      "${controller.response.value.data!.firstName}"
                                          .capitalizeFirst,
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () => controller.logOut(),
                        style: TextButton.styleFrom(
                          foregroundColor: theme.primaryColor,
                        ),
                        child: const Text("Log-out"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: theme.primaryColor,
                    ),
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: 215.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Available balance",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                IconButton(
                                  iconSize: 17.sp,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Bootstrap.eye_fill,
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            ),
                            TextButton.icon(
                              onPressed: () => {},
                              icon: Text(
                                "Transaction History",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                ),
                              ),
                              label: Icon(
                                Bootstrap.chevron_right,
                                size: 17.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "NGN",
                                style: GoogleFonts.poppins(
                                  fontSize: 17.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "${controller.response.value.data!.pin}",
                              ),
                            ],
                          ),
                          style: GoogleFonts.poppins(
                            fontSize: 50.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: Text(
                                "Add Money",
                                style: TextStylesItem().mediumText.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              label: const Icon(Bootstrap.arrow_down_left,
                                  color: Colors.white),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: Text(
                                "Transfer",
                                style: TextStylesItem().mediumText.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              label: const Icon(
                                Bootstrap.arrow_up_right,
                                color: Colors.white,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: Text(
                                "Bills",
                                style: TextStylesItem().mediumText.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              label: const Icon(
                                Bootstrap.wallet2,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
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
                          fontSize: 17.sp,
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
                  ),
                ],
              ),
      ),
    );
  }
}
