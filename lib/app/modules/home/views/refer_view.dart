import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ReferView extends GetView {
  const ReferView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReferView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/refer.png",
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Invite friends and earn",
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "The referral program is temporally unavailable please check back later.",
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            // Text("${box.read("referralCode") ?? ""}")
          ],
        ),
      ),
    );
  }
}
