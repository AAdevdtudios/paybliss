import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class ServicesView extends GetView {
  const ServicesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 15,
      ),
      children: List.generate(
        5,
        (index) => Container(
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
                    Icons.phone,
                    size: 40.r,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Airtime",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
