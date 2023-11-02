import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:paybliss/app/modules/AccountTransfer/controllers/account_transfer_controller.dart';

class TransferPinView extends GetView {
  const TransferPinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AccountTransferController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransferPinView'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? SizedBox(
                child: Center(
                  child: LoadingBouncingLine.circle(
                    borderColor: Theme.of(context).primaryColor,
                    borderSize: 3.0,
                    size: 50.0,
                    backgroundColor: Theme.of(context).primaryColor,
                    duration: const Duration(milliseconds: 500),
                  ),
                ),
              )
            : ListView(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => AnimatedContainer(
                          width: 60.w,
                          height: 60.h,
                          duration: const Duration(milliseconds: 100),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Opacity(
                            opacity: 1,
                            child: Center(
                              child: Text(
                                controller.values[index],
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 600.h,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.7 / 0.6,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 12,
                      itemBuilder: (context, index) => index == 9
                          ? TextButton(
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.fingerprint,
                              ),
                            )
                          : TextButton(
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                              ),
                              onPressed: index == 11
                                  ? () => controller.removeLast()
                                  : () => controller.onTapFunction(index),
                              child: index == 11
                                  ? Icon(
                                      Icons.backspace,
                                      color: Theme.of(context).iconTheme.color,
                                    )
                                  : Text(
                                      index == 10 ? '0' : '${1 + index}',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                            ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
