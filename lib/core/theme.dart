import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 10.0;

Color kPrimaryColor = const Color(0xff1A3665);
Color kBlackColor = const Color(0xff1F1449);
Color kWhiteColor = const Color(0xffFFFFFF);
Color kGreyColor = const Color(0xff9698A9);
Color kGreenColor = const Color(0xff0EC3AE);
Color kBackgroundColor = const Color(0xffFAFAFA);

TextStyle blackTextStyle = GoogleFonts.poppins(color: kBlackColor);
TextStyle whiteTextStyle = GoogleFonts.poppins(color: kWhiteColor);
TextStyle greyTextStyle = GoogleFonts.poppins(color: kGreyColor);
TextStyle primaryTextStyle = GoogleFonts.poppins(color: kPrimaryColor);

FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;

ColorScheme kColorScheme = ColorScheme(
  primary: kPrimaryColor,
  primaryContainer: kBlackColor,
  secondary: kGreenColor,
  secondaryContainer: kGreenColor,
  surface: kBlackColor,
  background: kBackgroundColor,
  error: Colors.red,
  onPrimary: kPrimaryColor,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);
