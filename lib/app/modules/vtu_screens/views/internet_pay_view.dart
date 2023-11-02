import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InternetPayView extends GetView {
  const InternetPayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Service'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        children: [
          ListTile(
            leading: Image.asset(
              "assets/images/spectranet.png",
              width: 30,
              height: 30,
            ),
            title: const Text(
              "Spectranet",
            ),
          ),
          const Divider(
            color: Colors.black26,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Account ID",
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: "Enter Your Account ID",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Select Data bundle",
          ),
          TextField(
            readOnly: true,
            onTap: () => Get.bottomSheet(
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            decoration: const InputDecoration(
              hintText: "Data bundles",
              focusedBorder: InputBorder.none,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Amount",
          ),
          const TextField(
            enabled: false,
            decoration: InputDecoration(
              hintText: "2,300",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
