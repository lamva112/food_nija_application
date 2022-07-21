import 'package:flutter/material.dart';
import 'package:food_nija_application/app/features/onboarding/onboarding.dart';
import 'package:food_nija_application/app/features/signup/signup_screen.dart';
import '../features/home_screen.dart';
import '../features/login/login_screen.dart';

class RouteManager {
  static const String loginScreen = '/loginPage';
  static const String homeScreen = '/homePage';
  static const String onBoarding = '/onBoarding';
  static const String signupScreen = '/signupScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(child: SignupScreen()),
        );
      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
