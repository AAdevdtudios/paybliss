import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/modules/Tier/views/tier_view.dart';
import 'package:paybliss/app/modules/home/controllers/profile_controller.dart';
import 'package:paybliss/app/modules/home/views/account_security_view.dart';
import 'package:paybliss/app/modules/home/views/help_view.dart';
import 'package:paybliss/app/modules/home/views/refer_view.dart';
import 'package:paybliss/main.dart';

import 'edit_profile_view.dart';

class ProfileView extends GetView {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Get.put(ProfileController());
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            CircleAvatar(
              backgroundColor: theme.primaryColor,
              radius: 40.r,
              child: const Icon(
                Bootstrap.person_fill,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "${box.read("firstname")} ${box.read("lastname")}".capitalize ??
                  "",
              style: theme.textTheme.bodyLarge!,
            ),
          ].animate().fadeIn(),
        ),
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () => Get.to(const EditProfileView()),
              leading: const Icon(
                Bootstrap.person_fill,
              ),
              trailing: const Icon(
                Bootstrap.chevron_right,
              ),
              title: const Text(
                "Edit Profile",
              ),
              subtitle: const Text(
                "Change password and update profile",
              ),
            ),
            ListTile(
              onTap: () => Get.to(const ReferView()),
              leading: const Icon(
                Bootstrap.gift,
              ),
              trailing: const Icon(
                Bootstrap.chevron_right,
              ),
              title: const Text(
                "Refer & Earn",
              ),
              subtitle: const Text(
                "Invite your friends and get a bonus",
              ),
            ),
            ListTile(
              onTap: () => Get.to(const HelpView()),
              leading: const Icon(
                Bootstrap.chat_dots,
              ),
              trailing: const Icon(
                Bootstrap.chevron_right,
              ),
              title: const Text(
                "Help Center",
              ),
              subtitle: const Text(
                "Have an issue? Speak to a team",
              ),
            ),
            ListTile(
              onTap: () => Get.to(const TierView()),
              leading: const Icon(
                Iconsax.ranking,
              ),
              trailing: const Icon(
                Bootstrap.chevron_right,
              ),
              title: const Text(
                "Upgrade Kyc",
              ),
              subtitle: const Text(
                "Upgrade your tier",
              ),
            ),
            // ListTile(
            //   onTap: () {},
            //   leading: const Icon(
            //     Bootstrap.stars,
            //   ),
            //   trailing: const Icon(
            //     Bootstrap.chevron_right,
            //   ),
            //   title: const Text(
            //     "Beneficiaries",
            //   ),
            // ),
            ListTile(
              onTap: () => Get.to(const AccountSecurityView()),
              leading: const Icon(
                Bootstrap.safe,
              ),
              trailing: const Icon(
                Bootstrap.chevron_right,
              ),
              title: const Text(
                "Account Security",
              ),
            ),
            ListTile(
              onTap: () => controller.logout(),
              leading: const Icon(
                Bootstrap.door_open,
              ),
              trailing: const Icon(
                Bootstrap.chevron_right,
              ),
              title: const Text(
                "Logout",
              ),
            ),
            ListTile(
              onTap: () => {},
              leading: const Icon(
                Bootstrap.basket,
              ),
              trailing: const Icon(
                Bootstrap.chevron_right,
              ),
              title: const Text(
                "Delete Account",
              ),
            ),
          ].animate(interval: 400.ms).fade().slideY(duration: 200.ms),
        ),
      ],
    );
  }
}
