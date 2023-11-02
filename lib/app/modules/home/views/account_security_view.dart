import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/modules/home/views/otp_pin_reset_view.dart';
import 'package:paybliss/app/modules/home/views/reset_password_view.dart';

class AccountSecurityView extends GetView {
  const AccountSecurityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Security'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () => Get.to(const ResetPasswordView()),
            leading: const Icon(
              Bootstrap.person_lock,
            ),
            trailing: const Icon(
              Bootstrap.chevron_right,
            ),
            title: const Text(
              "Reset Password",
            ),
            subtitle: const Text(
              "Update your password",
            ),
          ),
          ListTile(
            onTap: () => Get.to(const OtpPinResetView()),
            leading: const Icon(
              Bootstrap.lock,
            ),
            trailing: const Icon(
              Bootstrap.chevron_right,
            ),
            title: const Text(
              "Reset Pin",
            ),
            subtitle: const Text(
              "Update your security pin",
            ),
          ),
        ],
      ),
    );
  }
}
