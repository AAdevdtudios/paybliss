import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/data/const_data.dart';

import '../controllers/main_home_controller.dart';

class MainHomeView extends GetView {
  const MainHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainHomeController());
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available balance',
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 17.sp,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '₦ 100K',
              style: theme.textTheme.labelLarge!.copyWith(
                fontSize: 50.sp,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.remove_red_eye,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => {},
                icon: Icon(
                  Icons.arrow_downward,
                  color: theme.textTheme.bodyMedium!.color,
                ),
                label: Text(
                  'Deposit',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton.icon(
                onPressed: () => {},
                icon: Icon(
                  Icons.arrow_upward,
                  color: theme.textTheme.bodyMedium!.color,
                ),
                label: Text(
                  'Withdraw',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffFFFCF5),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 3,
            vertical: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Icon(
                  Icons.error,
                  color: Colors.red[300],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify your identity",
                    style: TextStylesItem().largeText.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  SizedBox(
                    width: 300.w,
                    child: Text(
                      "In order to comply with local regulation, we need to know more about you",
                      maxLines: 2,
                      style: TextStylesItem().mediumText.copyWith(
                            color: Colors.black26,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Text(
                      'Click here to get started',
                      style: TextStylesItem().mediumText.copyWith(
                            color: Colors.red[300],
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Text(
              "Top Services",
              style: theme.textTheme.bodyLarge,
            ),
            const Icon(
              Icons.arrow_right_alt,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: controller.slides
                .map((e) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFCF5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                e.name,
                                style: TextStylesItem().largeText.copyWith(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                    ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(
                                Icons.hotel_class_outlined,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 230.w,
                            height: 100.h,
                            child: Text(
                              e.description,
                              maxLines: 3,
                              style: TextStylesItem().mediumText.copyWith(
                                    fontSize: 17.sp,
                                    color: Colors.black45,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Text(
              "Last Transaction",
              style: theme.textTheme.bodyLarge,
            ),
            const Icon(
              Icons.arrow_right_alt,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
