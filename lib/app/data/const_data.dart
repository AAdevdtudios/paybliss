import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';

MaskInputFormatter phone = MaskInputFormatter(mask: '####-###-####');

class TextStylesItem {
  TextStyle smallText = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w200,
  );
  TextStyle mediumText = GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );
  TextStyle largeText = GoogleFonts.poppins(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
  );
}

class ThemeModeData {
  ThemeData darkMode = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: const Color(0xfff8b858),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    highlightColor: Colors.white70,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xfff8b858),
      selectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
      unselectedItemColor: Colors.black38,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 23.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white70,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xfff8b858),
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.poppins(
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white12,
      focusColor: Colors.orange,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.orange,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white12,
        ),
      ),
      filled: true,
      hintStyle: GoogleFonts.poppins(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      bodySmall: TextStylesItem().smallText.copyWith(color: Colors.white),
      bodyMedium: TextStylesItem().mediumText.copyWith(color: Colors.white),
      bodyLarge: TextStylesItem().largeText.copyWith(color: Colors.white),
      titleSmall: TextStylesItem().mediumText.copyWith(color: Colors.white),
      titleMedium: TextStylesItem().mediumText.copyWith(color: Colors.white),
      titleLarge: TextStylesItem().largeText.copyWith(color: Colors.white),
      labelLarge: TextStylesItem().largeText.copyWith(
            color: const Color(0xffF8B858),
            fontSize: 25.sp,
          ),
      labelSmall: TextStylesItem().smallText.copyWith(color: Colors.white24),
      labelMedium: TextStylesItem().largeText.copyWith(
            color: const Color(0xffF8B858),
            fontSize: 13.sp,
          ),
    ),
  );
  ThemeData lightMode = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xfff8b858),
    highlightColor: Colors.black54,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xfff8b858),
      selectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
      unselectedItemColor: Colors.black38,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xfff8b858),
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.poppins(
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0x09000000),
      focusColor: Colors.orange,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.orange,
        ),
      ),
      border: InputBorder.none,
      filled: true,
      hintStyle: GoogleFonts.poppins(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      bodySmall: TextStylesItem().smallText.copyWith(color: Colors.black38),
      bodyMedium: TextStylesItem().mediumText.copyWith(color: Colors.black38),
      bodyLarge: TextStylesItem().largeText.copyWith(color: Colors.black),
      titleSmall: TextStylesItem().mediumText.copyWith(color: Colors.black),
      titleMedium: TextStylesItem().mediumText.copyWith(color: Colors.black),
      titleLarge: TextStylesItem().largeText.copyWith(color: Colors.black),
      labelLarge: TextStylesItem().largeText.copyWith(
            color: const Color(0xffF8B858),
            fontSize: 25.sp,
          ),
      labelSmall: TextStylesItem().smallText.copyWith(color: Colors.white24),
      labelMedium: TextStylesItem().largeText.copyWith(
            color: const Color(0xffF8B858),
            fontSize: 13.sp,
          ),
    ),
  );
}
