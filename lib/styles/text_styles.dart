
// text style
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final TextStyle kHeading5 =
GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
final TextStyle kHeading6 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
final TextStyle kSubtitle = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle kBodyText = GoogleFonts.poppins(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

// text theme
final kTextTheme = TextTheme(
  headlineMedium: kHeading5,
  headlineSmall: kHeading6,
  labelMedium: kSubtitle,
  bodyMedium: kBodyText,
);

final kDrawerTheme = DrawerThemeData(
  backgroundColor: Colors.grey.shade700,
);

const kColorScheme = ColorScheme(
  primary: kMikadoYellow,
  secondary: kPrussianBlue,
  secondaryContainer: kPrussianBlue,
  surface: kRichBlack,
  error: Colors.red,
  onPrimary: kRichBlack,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);
