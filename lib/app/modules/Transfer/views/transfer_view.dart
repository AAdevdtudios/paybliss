import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/modules/AccountTransfer/views/account_transfer_view.dart';
import 'package:paybliss/app/modules/TagTransfer/views/tag_transfer_view.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
  const TransferView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () => Get.to(const AccountTransferView()),
            leading: const Icon(
              FontAwesome.money_bill_transfer,
            ),
            trailing: const Icon(
              Bootstrap.chevron_right,
            ),
            title: const Text(
              "Send to Account",
            ),
            subtitle: const Text(
              "Transfer money to bank account",
            ),
          ),
          ListTile(
            onTap: () => Get.to(const TagTransferView()),
            leading: const Icon(
              FontAwesome.user_tag,
            ),
            trailing: const Icon(
              Bootstrap.chevron_right,
            ),
            title: const Text(
              "Send to User tag",
            ),
            subtitle: const Text(
              "Blissbill to Blissbill money transfer",
            ),
          ),
        ],
      ),
    );
  }
}
