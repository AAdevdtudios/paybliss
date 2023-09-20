import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/modules/home/controllers/profile_controller.dart';

class ProfileView extends GetView {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Get.put(ProfileController());
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        CircleAvatar(
          backgroundColor: theme.primaryColor,
          radius: 40.r,
          child: const Icon(
            Bootstrap.person_fill,
          ),
        ),
        const Text(
          "Full name",
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Edit Profile",
          ),
        ),
        ListTile(
          onTap: () {},
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
          onTap: () {},
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
          onTap: () {},
          leading: const Icon(
            Bootstrap.coin,
          ),
          trailing: const Icon(
            Bootstrap.chevron_right,
          ),
          title: const Text(
            "Rate & fees",
          ),
          subtitle: const Text(
            "See exchange rates & fees",
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Bootstrap.stars,
          ),
          trailing: const Icon(
            Bootstrap.chevron_right,
          ),
          title: const Text(
            "Beneficiaries",
          ),
        ),
        ListTile(
          onTap: () {},
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
          onTap: () {},
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
          onTap: () => controller.logout(),
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
      ],
    );
  }
}
