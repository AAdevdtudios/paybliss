import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:paybliss/app/data/const_data.dart';
import 'package:paybliss/app/modules/vtu_screens/controllers/data_controller.dart';

class DataVtuView extends GetView {
  const DataVtuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Data'),
        centerTitle: true,
      ),
      body: Obx(
        () => Form(
          key: controller.formKey,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            children: [
              const Text(
                "Phone number:",
              ),
              SizedBox(
                height: 20.h,
              ),
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
                height: 20.h,
              ),
              const Text("Data bundle:"),
              SizedBox(
                height: 10.h,
              ),
              DropdownButtonFormField(
                value: controller.selectedVal.value,
                alignment: Alignment.bottomCenter,
                hint: const Text("Select bundle"),
                onChanged: (newValue) =>
                    controller.selectedVal.value = newValue as String,
                items: List.generate(
                  controller.data.length,
                  (index) => DropdownMenuItem(
                    value: controller.data[index],
                    child: Text(
                      controller.data[index],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 70.h,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Validate",
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
