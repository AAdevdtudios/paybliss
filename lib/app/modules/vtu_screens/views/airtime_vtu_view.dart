import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/data/const_data.dart';
import 'package:paybliss/app/data/props.dart';
import 'package:paybliss/app/modules/vtu_screens/controllers/airtime_controller.dart';

class AirtimeVtuView extends GetView {
  const AirtimeVtuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AirtimeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airtime'),
        centerTitle: true,
      ),
      body: Obx(
        () => Form(
          key: controller.formKey,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              TextFormField(
                controller: controller.phoneNumber,
                keyboardType: TextInputType.number,
                inputFormatters: [phone],
                validator: (val) => val!.isEmpty
                    ? "Can't be empty"
                    : !GetUtils.isLengthEqualTo(val.replaceAll("-", ""), 11)
                        ? "Phone number incomplete"
                        : val.startsWith("0")
                            ? null
                            : "Number badly formatted",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) => controller.changeInput(value),
                decoration: InputDecoration(
                  hintText: "Phone number",
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  suffixIcon: IconButton(
                    onPressed: () => {},
                    icon: const Icon(FontAwesome.square_phone),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CoolDropdown(
                      controller: controller.listDropdownController,
                      dropdownList: controller.pokemonDropdownItems,
                      onChange: (dropdownItem) =>
                          controller.onDropdownTap(dropdownItem.itemNo),
                      resultOptions: ResultOptions(
                        width: 50,
                        render: ResultRender.none,
                        icon: SizedBox(
                          width: 25,
                          height: 25,
                          child: controller
                              .pokemonDropdownItems[controller.currentVal.value]
                              .icon,
                        ),
                      ),
                      dropdownTriangleOptions: const DropdownTriangleOptions(
                        align: DropdownTriangleAlign.right,
                      ),
                      dropdownItemOptions: DropdownItemOptions(
                        render: DropdownItemRender.icon,
                        selectedPadding: EdgeInsets.zero,
                        mainAxisAlignment: MainAxisAlignment.center,
                        selectedBoxDecoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.black.withOpacity(0.7),
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              const Text("Quick pick"),
              SizedBox(
                height: 20.h,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: List.generate(
                  6,
                  (index) => InkWell(
                    onTap: () => controller.amount.text = quick_pick[index],
                    radius: 10,
                    child: Container(
                      height: 80.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          quick_pick[index],
                          style: Theme.of(context)
                              .inputDecorationTheme
                              .hintStyle!
                              .copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 30.sp,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              TextFormField(
                controller: controller.amount,
                keyboardType: TextInputType.number,
                onChanged: (value) => controller.makeChecks(),
                validator: (val) => val!.isEmpty
                    ? "Can't be empty"
                    : int.parse(val) >= 50
                        ? null
                        : "Must be grater than 49",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "50-50,000",
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  alignLabelWithHint: true,
                  prefixIcon: const Icon(
                    FontAwesome.naira_sign,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: controller.isValid.value ? () => {} : null,
                        child: const Text("Pay"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
