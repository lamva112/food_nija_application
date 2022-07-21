import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color.fromARGB(255, 99, 199, 131);
  static const secondaryColor = Color.fromRGBO(179, 178, 178, 1.0);
  static const backgroundColor = Color(0xffffffff);
  static const backgroundLoginColor = Color(0xFFF4F4F4);
  static const textButtonColor = Color(0xffffffff);
  static const textColor = Colors.black;
  static const textFormFieldColor = Colors.white;
  static const backgroundImage = 'assets/images/bg_login_white.png';

  //==========================================================================//
  //LIGHT THEME
  ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: "PoppinsRegular",
      bodyColor: textColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
    hintColor: secondaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme:
    const InputDecorationTheme(fillColor: Colors.white, filled: true),
  );

  //==========================================================================//
  //DARK THEME
  ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: "PoppinsRegular",
      bodyColor: textColor,
    ),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
    hintColor: secondaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme:
    const InputDecorationTheme(fillColor: Color(0xff292a2a), filled: true),
  );
}
