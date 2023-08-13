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
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0x60000000),
            textTheme: TextTheme(
              titleSmall: TextStylesItem().boldText.copyWith(
                    color: Colors.white,
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
