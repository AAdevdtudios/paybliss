import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/modules/home/controllers/home_controller.dart';
import 'package:paybliss/app/modules/home/controllers/profile_controller.dart';

class ProfileView extends GetView {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var homeController = Get.put(HomeController());
    var controller = Get.put(ProfileController());
    return Column(
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
          "${homeController.response.value.data!.firstName} ${homeController.response.value.data!.lastName}",
          style: theme.textTheme.displayLarge!.copyWith(
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Edit Profile",
          ),
        ),
        const SizedBox(
          height: 20,
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
      ],
    );
  }
}
