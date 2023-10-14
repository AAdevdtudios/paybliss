import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paybliss/app/modules/home/controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookingController());
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      BackButton(),
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        children: List.generate(
                          2,
                          (index) => Container(
                            margin: const EdgeInsets.only(
                              right: 15,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: controller.index.value == index
                                    ? Colors.white
                                    : theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () => controller.index.value = index,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  controller.bookStyle[index],
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: TextField(
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.sp,
                      ),
                      decoration: InputDecoration(
                        hintText: "Take off",
                        fillColor: Colors.white,
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
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: TextField(
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.sp,
                      ),
                      decoration: InputDecoration(
                        hintText: "Landing",
                        fillColor: Colors.white,
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
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: TextField(
                            controller: controller.datePicked,
                            onTap: () async => controller.showDate(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp,
                            ),
                            decoration: InputDecoration(
                              hintText: "Date",
                              fillColor: Colors.white,
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
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: TextField(
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Adults",
                              fillColor: Colors.white,
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Search"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
