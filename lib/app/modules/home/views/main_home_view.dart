import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/data/const_data.dart';
import 'package:paybliss/app/modules/Notifications/views/notifications_view.dart';
import 'package:paybliss/app/modules/Tier/views/tier_view.dart';
import 'package:paybliss/app/modules/TransactionHistory/views/transaction_history_view.dart';
import 'package:paybliss/app/modules/Transfer/views/transfer_view.dart';
import 'package:paybliss/main.dart';
import 'package:share_plus/share_plus.dart';

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
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: theme.primaryColor,
                      child: const Icon(
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
                            text: "${box.read("firstname")}".capitalizeFirst,
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
                IconButton(
                  onPressed: () => Get.to(const NotificationsView()),
                  icon: const Icon(
                    Bootstrap.bell,
                  ),
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
              height: 230.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.showInfo.value
                      ? SizedBox(
                          width: double.infinity,
                          height: 120.h,
                          child: ElevatedButton(
                            onPressed: () => {},
                            child: const Text("Input your BVN"),
                          ),
                        )
                      : Row(
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
                                  onPressed: () => controller.showAmount.value =
                                      !controller.showAmount.value,
                                  icon: const Icon(
                                    Bootstrap.eye_fill,
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            ),
                            TextButton.icon(
                              onPressed: () =>
                                  Get.to(const TransactionHistoryView()),
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
                          text: "NGN ",
                          style: GoogleFonts.poppins(
                            fontSize: 17.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: controller.showAmount.value
                              ? "****"
                              : box.read("amount") ?? "0",
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
                        onPressed: () => Get.defaultDialog(
                          title: "Account Details",
                          actions: [
                            ElevatedButton(
                              onPressed: () async => await Share.share(
                                  "BlissBill account, make bank transfer to the account as shown: \n Bank name: Sterling bank \n Account Number: ${box.read("accountNumber")} \n Bank Beneficiary: ${box.read('accountName')}"),
                              child: const Text("Share"),
                            ),
                          ],
                          middleText:
                              "To add money to your BlissBill account, make bank transfer to the account as shown: \n Bank name: Sterling bank \n Account Number: ${box.read("accountNumber")} \n Bank Beneficiary: ${box.read('accountName')}",
                        ),
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
                        onPressed: () => Get.to(const TransferView()),
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
                        onPressed: () => homeController.currentTab.value = 1,
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
              height: 20.h,
            ),
            box.read("tier") == "Tier0"
                ? Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upgrade tier",
                          style: Get.theme.textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Complete your Kyc to get more service offers",
                              style: Get.theme.textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Get.to(const TierView()),
                              child: Text(
                                "Verify KYC",
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              height: 10.h,
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
                  onPressed: () => Get.to(const TransactionHistoryView()),
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
