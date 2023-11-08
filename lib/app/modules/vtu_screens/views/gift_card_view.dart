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
          vertical: 10,
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
          SizedBox(
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 3,
              ),
              shrinkWrap: true,
              children: List.generate(
                30,
                (index) => GestureDetector(
                  onTap: () => Get.to(const GiftcardPayView()),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          color: Colors.green,
                        ),
                        const Text("PUBG Mobile 1500 + 300 UC US")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
