import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStylesItem {
  TextStyle smallText = GoogleFonts.inter(
    fontSize: 10.sp,
    fontWeight: FontWeight.w200,
  );
  TextStyle mediumText = GoogleFonts.inter(
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
  );
  TextStyle largeText = GoogleFonts.inter(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
  );
}
