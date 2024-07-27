import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/dimensions.dart';
import 'app_colors.dart';

//"Montserrat_Arabic"
String appFontFamily = "Montserrat-Arabic";
ThemeData lightTheme = ThemeData(
  fontFamily: appFontFamily,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffffffff),
    titleTextStyle: TextStyle(
      fontSize: Sizer.size20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    headlineMedium: GoogleFonts.lato(
      color: Colors.black,
      fontSize: Sizer.size16
    ),
    titleMedium: GoogleFonts.lato(
      color: AppColors.white,
    ),
  ),
  disabledColor: const Color(0xff949088),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    secondary: AppColors.secondaryColor,
    primary: AppColors.primaryColor,
    onPrimary: AppColors.appDisplayColor,
    onSecondary: Colors.black,
    error: Colors.white,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: AppColors.onSurfaceColor,
  ),
);

