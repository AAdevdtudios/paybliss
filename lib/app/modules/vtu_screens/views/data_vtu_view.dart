import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

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
              ListTile(
                title: const Text("Select Bundle"),
                subtitle: Text(
                  controller.selectedPart.value == null
                      ? ""
                      : controller.selectedPart.value!.name,
                ),
                trailing: Text(
                  controller.selectedPart.value == null
                      ? ""
                      : controller.selectedPart.value!.amount.toString(),
                ),
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      height: 500.h,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: FutureBuilder(
                        future: controller.getDataValues(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Center(
                              child: LoadingBouncingLine.circle(
                                borderColor: Theme.of(context).primaryColor,
                                borderSize: 3.0,
                                size: 50.0,
                                backgroundColor: Theme.of(context).primaryColor,
                                duration: const Duration(milliseconds: 500),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              itemBuilder: (context, i) => ListTile(
                                title: Text(
                                  snapshot.data[i].name,
                                  style: TextStylesItem().mediumText.copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                trailing: Text(
                                  "NGN ${snapshot.data[i].amount.toString()}",
                                  style: TextStylesItem().mediumText.copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                onTap: () {
                                  controller.selectedPart.value =
                                      snapshot.data[i];
                                  Get.back();
                                },
                              ),
                              itemCount: snapshot.data.length,
                            );
                          }
                        },
                      ),
                    ),
                  );
                },
                leading: const Icon(
                  FontAwesome.globe,
                ),
                tileColor: Colors.white24,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
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
