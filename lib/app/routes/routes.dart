import 'package:flutter/material.dart';
import 'package:food_nija_application/app/features/onboarding/onboarding.dart';
import '../features/home_screen.dart';
import '../features/login_screen.dart';

class RouteManager {
  static const String loginPage = '/loginPage';
  static const String homePage = '/homePage';
  static const String onBoarding = '/onBoarding';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        );
      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
