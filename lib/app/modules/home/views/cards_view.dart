import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/home/controllers/cards_controller.dart';
import 'package:u_credit_card/u_credit_card.dart';

class CardsView extends GetView {
  const CardsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CardsController());
    var theme = Theme.of(context);
    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cards",
                style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 40.sp,
                ),
              ),
              Text(
                'Paybliss virtual card for your online services',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: double.infinity,
                height: 70.h,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffE4E4E4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: List.generate(
                    2,
                    (index) => Expanded(
                      child: TextButton(
                        onPressed: () => controller.changeView(index),
                        style: TextButton.styleFrom(
                          backgroundColor: controller.tab.value == index
                              ? Theme.of(context).primaryColor
                              : null,
                          foregroundColor: Colors.black,
                          textStyle: Theme.of(context).textTheme.labelMedium,
                        ),
                        child: Text(
                          index == 0 ? "NGN" : "USD",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: CreditCardUi(
                      doesSupportNfc: false,
                      scale: 1.45.r,
                      cardProviderLogoPosition: CardProviderLogoPosition.left,
                      backgroundDecorationImage: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/card-image.jpg",
                        ),
                      ),
                      cardProviderLogo:
                          Image.asset("assets/icons/logo_img.png"),
                      cardHolderFullName: 'John Doe',
                      cardNumber: '1234567812345678',
                      validThru: '10/24',
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextButton.icon(
                    onPressed: () => {},
                    style: TextButton.styleFrom(
                      iconColor: Colors.amber,
                    ),
                    icon: Text(
                      "Show card details",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    label: const Icon(
                      Icons.copy_outlined,
                      size: 20,
                    ),
                  ),
                  Center(
                    child: Text(
                      controller.tab.value == 0 ? "₦2,000" : "\$300",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 50.sp,
                          ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => {},
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          child: Text(
                            "Withdraw",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Top-Up"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  // Center(
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     child: ElevatedButton.icon(
                  //       onPressed: () => {},
                  //       icon: const Text("Card History"),
                  //       label: const Icon(
                  //         Icons.arrow_right_sharp,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
