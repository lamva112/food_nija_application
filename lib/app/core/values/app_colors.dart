import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = Colors.transparent;
  static Color secondaryColor = Colors.transparent;
  static Color backgroundColor = Colors.transparent;
  static Color backgroundItemColor = Colors.transparent;
  static Color backgroundLoginColor = Colors.transparent;
  static Color textColor = Colors.transparent;
  static Color textFormFieldColor = Colors.transparent;
  static Color bgButtonBack = Colors.transparent;
  static Color iconButtonBack = Colors.transparent;
  static Color bgLocationIcon = Colors.transparent;
  static Color priceTextColor = Colors.transparent;
  static Color bgLocationButton = Colors.transparent;
  static Color selectedNavBarColor = Colors.transparent;
  static Color unselectedNavBarColor = Colors.transparent;
  static Color itemChildColor = Colors.transparent;
  static Color locationColor = Colors.transparent;

  void changeColor(bool darkMode) {
    if( darkMode == true ) {
      primaryColor = const Color.fromARGB(255, 99, 199, 131);
      secondaryColor = const Color.fromRGBO(179, 178, 178, 1.0);
      backgroundColor = const Color(0xffffffff);
      backgroundItemColor = Colors.white;
      backgroundLoginColor = const Color(0xFFF4F4F4);
      textColor = Colors.black;
      textFormFieldColor = Colors.white;
      bgButtonBack = const Color(0xffF9A84D).withOpacity(0.15);
      iconButtonBack = const Color(0xffDA6317);
      bgLocationIcon = const Color(0XFFFFE14D);
      priceTextColor = const Color(0xffFEAD1D);
      bgLocationButton = const Color(0XFFF6F6F6);
      selectedNavBarColor = const Color.fromRGBO(28, 185, 134, 1);
      unselectedNavBarColor = const Color.fromRGBO(179, 178, 178, 1.0);
      itemChildColor = Colors.white;
      locationColor = const Color(0xF6F6F6F6);
    }
    else{
      primaryColor = const Color.fromARGB(255, 99, 199, 131);
      secondaryColor = const Color.fromRGBO(179, 178, 178, 1.0);
      backgroundColor = Colors.black;
      backgroundItemColor = const Color(0xfff4f4f4).withOpacity(0.2);
      backgroundLoginColor = Colors.black;
      textColor = Colors.white;
      textFormFieldColor = const Color(0xfff4f4f4).withOpacity(0.2);
      bgButtonBack = const Color(0xfff4f4f4).withOpacity(0.2);
      iconButtonBack = Colors.white;
      bgLocationIcon = const Color(0XFFFFE14D);
      priceTextColor = const Color(0xffFEAD1D);
      bgLocationButton = const Color(0XFFF6F6F6);
      selectedNavBarColor = const Color.fromRGBO(28, 185, 134, 1);
      unselectedNavBarColor = const Color.fromRGBO(179, 178, 178, 1.0);
      itemChildColor = Colors.white;
      locationColor = const Color(0xF6F6F6F6);
    }
  }
  //==========================================================================//
  //LIGHT THEME
  ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: textColor,
        ),
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
    hintColor: secondaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(color: const Color(0xff3B3B3B).withOpacity(0.3))),
  );

  //==========================================================================//
  //DARK THEME
  ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: textColor,
        ),
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
    hintColor: secondaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme:
        const InputDecorationTheme(fillColor: Color(0xff292a2a), filled: true),
  );
}