import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paybliss/app/modules/SingleViews/views/card_creation_view.dart';

class EmptyCardView extends GetView {
  const EmptyCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset('assets/images/create_card.png'),
            Text(
              "Create Virtual Card",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Get virtual dollar card pay for Apple Music, Sportify, Youtube Music etc for \$5",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300.w,
              child: ElevatedButton(
                onPressed: () => Get.to(const CardCreationView()),

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Create Card",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
