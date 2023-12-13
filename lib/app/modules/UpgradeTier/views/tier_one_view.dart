import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/modules/UpgradeTier/controllers/upgrade_tier_controller.dart';

class TierOneView extends GetView {
  const TierOneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UpgradeTierController());
    return Obx(
      () => Form(
        key: controller.formState,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.datePicked,
              onTap: () async => controller.showDate(),
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 20.sp,
              ),
              validator: (value) =>
                  GetUtils.isDateTime(value!) ? "Cant be empty" : null,
              decoration: InputDecoration(
                hintText: "Date of birth",
                prefixIcon: const Icon(
                  Icons.date_range,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () => controller.selectedGender.value =
                        controller.gender[index],
                    style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: controller.selectedGender.value ==
                              controller.gender[index]
                          ? Theme.of(context).primaryColor
                          : Colors.white54,
                    ),
                    child: Text(
                      controller.gender[index],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.placeOfBirth,
              keyboardType: TextInputType.emailAddress,
              // onChanged: (val) => controller.makeChecks(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17.sp,
                  ),
              decoration: const InputDecoration(
                hintText: 'Place of Birth',
                prefixIcon: Icon(Iconsax.home),
              ),
              validator: (value) =>
                  GetUtils.isLengthLessThan(value, 2) ? "Cant be empty" : null,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.country,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17.sp,
                  ),
              decoration: const InputDecoration(
                hintText: 'Country',
                prefixIcon: Icon(Iconsax.home),
              ),
              validator: (value) =>
                  GetUtils.isLengthLessThan(value, 2) ? "Cant be empty" : null,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.street,
              keyboardType: TextInputType.streetAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17.sp,
                  ),
              decoration: const InputDecoration(
                hintText: 'Street',
                prefixIcon: Icon(Iconsax.home),
              ),
              validator: (value) =>
                  GetUtils.isLengthLessThan(value, 2) ? "Cant be empty" : null,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.city,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17.sp,
                  ),
              decoration: const InputDecoration(
                hintText: 'City',
                prefixIcon: Icon(Iconsax.civic_cvc),
              ),
              validator: (value) =>
                  GetUtils.isLengthLessThan(value, 2) ? "Cant be empty" : null,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.state,
              keyboardType: TextInputType.streetAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17.sp,
                  ),
              decoration: const InputDecoration(
                hintText: 'State',
                prefixIcon: Icon(Iconsax.location),
              ),
              validator: (value) =>
                  GetUtils.isLengthLessThan(value, 2) ? "Cant be empty" : null,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.postalCode,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17.sp,
                  ),
              decoration: const InputDecoration(
                hintText: 'Postal Code',
                prefixIcon: Icon(Iconsax.home),
              ),
              validator: (value) =>
                  GetUtils.isLengthLessThan(value, 2) ? "Cant be empty" : null,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async => await controller.pickImage(),
              child: DottedBorder(
                color: Colors.black,
                strokeWidth: 1,
                radius: const Radius.circular(10),
                child: SizedBox(
                  height: 150.h,
                  width: double.infinity,
                  child: Center(
                    child: controller.selectedImage == null
                        ? const Text("Upload Image")
                        : Image.file(controller.selectedImage!),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => controller.updateTireOne(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Upgrade",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
