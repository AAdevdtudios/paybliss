import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/data/const_data.dart';
import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();

  runApp(
    ScreenUtilInit(
      designSize: const Size(412, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Paybliss",
          themeMode: box.read('theme') == null
              ? ThemeMode.system
              : box.read('theme') == 'dark'
                  ? ThemeMode.dark
                  : ThemeMode.light,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            textTheme: TextTheme(
              bodySmall:
                  TextStylesItem().smallText.copyWith(color: Colors.black),
              bodyMedium:
                  TextStylesItem().mediumText.copyWith(color: Colors.black),
              bodyLarge:
                  TextStylesItem().largeText.copyWith(color: Colors.black),
              titleSmall:
                  TextStylesItem().mediumText.copyWith(color: Colors.black),
              titleLarge:
                  TextStylesItem().largeText.copyWith(color: Colors.black),
              labelLarge: TextStylesItem().largeText.copyWith(
                    color: const Color(0xffF8B858),
                    fontSize: 25.sp,
                  ),
              labelSmall:
                  TextStylesItem().smallText.copyWith(color: Colors.white24),
              labelMedium: TextStylesItem().largeText.copyWith(
                    color: const Color(0xffF8B858),
                    fontSize: 17.sp,
                  ),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0x60000000),
            textTheme: TextTheme(
              bodySmall:
                  TextStylesItem().smallText.copyWith(color: Colors.white),
              bodyMedium:
                  TextStylesItem().mediumText.copyWith(color: Colors.white),
              bodyLarge:
                  TextStylesItem().largeText.copyWith(color: Colors.white),
              titleSmall:
                  TextStylesItem().mediumText.copyWith(color: Colors.white),
              titleLarge:
                  TextStylesItem().largeText.copyWith(color: Colors.white),
              labelLarge: TextStylesItem().largeText.copyWith(
                    color: const Color(0xffF8B858),
                    fontSize: 25.sp,
                  ),
              labelSmall:
                  TextStylesItem().smallText.copyWith(color: Colors.white24),
              labelMedium: TextStylesItem().largeText.copyWith(
                    color: const Color(0xffF8B858),
                    fontSize: 17.sp,
                  ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute:
              box.read('jwt') == null ? AppPages.ONBOARDING : AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
