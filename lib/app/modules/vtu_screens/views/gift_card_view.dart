import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import 'giftcard_pay_view.dart';

class GiftCardView extends GetView {
  const GiftCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Giftcard'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                padding: const EdgeInsets.all(
                  10,
                ),
                child: Flag(Flags.united_states_of_america),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Bootstrap.search,
                    ),
                    hintText: "Search Giftcard",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () => Get.to(GiftcardPayView()),
            leading: Image.asset(
              "assets/images/spectranet.png",
              width: 30,
              height: 30,
            ),
            title: Text(
              "PUBG Mobile 1500 + 300 UC US",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
