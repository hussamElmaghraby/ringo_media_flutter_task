import 'package:flutter/material.dart';

import '../constants/dimensions.dart';
import 'app_colors.dart';

//"Montserrat_Arabic"
ThemeData lightTheme = ThemeData(
  fontFamily: "Urbanist",
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size12,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size14,
    ),
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size16,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size18,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size20,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size24,
    ),
    titleMedium: TextStyle(
      color: AppColors.appBlackColor,
    ),
    titleSmall: TextStyle(
      color: AppColors.appBlackColor,
    ),
  ),
  disabledColor: const Color(0xff949088),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    secondary: AppColors.appGreyColor,
    primary: AppColors.appBlackColor,
    onPrimary: AppColors.appBlackColor,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.redAccent,
    surface: Colors.white,
    onSurface: AppColors.appGreyColor,
  ),
);
