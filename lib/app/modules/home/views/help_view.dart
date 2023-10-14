import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/modules/home/controllers/help_controller.dart';

class HelpView extends GetView {
  const HelpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HelpController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HelpView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () async => controller.launchWhatsapp(),
            leading: const Icon(
              Bootstrap.whatsapp,
            ),
            trailing: const Icon(
              Bootstrap.chevron_right,
            ),
            title: const Text(
              "Chat on Whatsapp",
            ),
            subtitle: const Text(
              "Chat with us on Whatsapp",
            ),
          ),
        ],
      ),
    );
  }
}
