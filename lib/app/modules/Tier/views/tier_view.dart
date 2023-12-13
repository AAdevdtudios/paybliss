import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/UpgradeTier/views/upgrade_tier_view.dart';
import 'package:paybliss/main.dart';

import '../controllers/tier_controller.dart';

class TierView extends GetView<TierController> {
  const TierView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TierController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tier'),
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.white,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          right: 30,
          left: 30,
        ),
        child: ElevatedButton(
          onPressed: () => Get.to(const UpgradeTierView()),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(
              double.infinity,
              70.h,
            ),
          ),
          child: const Text("Upgrade Tier"),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "My Level ",
                            children: [
                              TextSpan(
                                text: box.read("tier"),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        LinearProgressIndicator(
                          value: controller.checkTier(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: controller.tireNumber() == index
                            ? const Color(0xFFFFBD5B)
                            : Colors.orange[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.tires[index].name,
                            style: Get.theme.textTheme.bodyLarge!.copyWith(
                              color: controller.tireNumber() == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Daily Transaction Limit",
                            style: Get.theme.textTheme.bodyMedium!.copyWith(
                              color: controller.tireNumber() == index
                                  ? Colors.white
                                  : Colors.black38,
                            ),
                          ),
                          Text(
                            controller.tires[index].minimum,
                            style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: controller.tireNumber() == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            "Maximum Balance",
                            style: Get.theme.textTheme.bodyMedium!.copyWith(
                              color: controller.tireNumber() == index
                                  ? Colors.white
                                  : Colors.black38,
                            ),
                          ),
                          Text(
                            controller.tires[index].maximum,
                            style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: controller.tireNumber() == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.tires[index].access,
                            style: Get.theme.textTheme.bodyMedium!.copyWith(
                              color: controller.tireNumber() == index
                                  ? Colors.white
                                  : Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
