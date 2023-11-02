import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paybliss/app/modules/home/controllers/booking_controller.dart';
import 'package:textfield_search/textfield_search.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Flight",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          SizedBox(
            height: 10.h,
          ),
          const Text(
            "From",
          ),
          const SizedBox(
            height: 5,
          ),
          TextFieldSearch(
            controller: controller.fromSearch,
            label: "Take Off",
            future: () => controller.getSearch(),
            textStyle: const TextStyle(
              color: Colors.black,
            ),
            getSelectedValue: (item) {
              print(item);
            },
            decoration: InputDecoration(
              hintText: "Take off",
              suffixIcon: const Icon(
                Icons.flight,
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
            scrollbarDecoration: ScrollbarDecoration(
              controller: ScrollController(),
              theme: ScrollbarThemeData(
                radius: const Radius.circular(30.0),
                thickness: MaterialStateProperty.all(20.0),
                trackColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Text(
            "TO",
          ),
          const SizedBox(
            height: 5,
          ),
          TextFieldSearch(
            controller: controller.toSearch,
            label: "Landing",
            future: () => controller.toFetch(),
            textStyle: const TextStyle(
              color: Colors.black,
            ),
            getSelectedValue: (item) {
              print(item);
            },
            decoration: InputDecoration(
              hintText: "Take off",
              suffixIcon: const Icon(
                Icons.flight_land,
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
            scrollbarDecoration: ScrollbarDecoration(
              controller: ScrollController(),
              theme: ScrollbarThemeData(
                radius: const Radius.circular(30.0),
                thickness: MaterialStateProperty.all(20.0),
                trackColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Leaving Date",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: controller.datePicked,
                      onTap: () async => controller.showDate(),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.sp,
                      ),
                      decoration: InputDecoration(
                        hintText: "Leaving Date",
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
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Adult",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.sp,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Adults",
                        prefixIcon: const Icon(
                          Icons.person,
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
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.getSearch(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Search"),
            ),
          ),
        ],
      ),
    );
  }
}
