import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/dimensions.dart';
import 'app_colors.dart';

//"Montserrat_Arabic"
ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    headlineSmall:
        GoogleFonts.urbanist(color: Colors.black, fontSize: Sizer.size12),
    headlineMedium:
        GoogleFonts.urbanist(color: Colors.black, fontSize: Sizer.size14),
    headlineLarge:
        GoogleFonts.urbanist(color: Colors.black, fontSize: Sizer.size16),
    displaySmall:
        GoogleFonts.urbanist(color: Colors.black, fontSize: Sizer.size18),
    displayMedium:
        GoogleFonts.urbanist(color: Colors.black, fontSize: Sizer.size20),
    titleLarge:
        GoogleFonts.urbanist(color: Colors.black, fontSize: Sizer.size24),
    titleMedium: GoogleFonts.lato(
      color: AppColors.white,
    ),
    titleSmall: GoogleFonts.lato(
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
