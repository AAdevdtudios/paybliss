import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/modules/vtu_screens/views/internet_pay_view.dart';

class InternetView extends GetView {
  const InternetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Services'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Bootstrap.search,
              ),
              hintText: "Search for Network",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () => Get.to(const InternetPayView()),
            leading: Image.asset(
              "assets/images/spectranet.png",
              width: 30,
              height: 30,
            ),
            title: Text(
              "Spectranet",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
