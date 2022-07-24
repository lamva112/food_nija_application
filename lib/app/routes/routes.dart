import 'package:flutter/material.dart';
import 'package:food_nija_application/app/features/onboarding/onboarding.dart';
import 'package:food_nija_application/app/features/signup/info_signup_screen.dart';
import 'package:food_nija_application/app/features/signup/payment_screent.dart';
import 'package:food_nija_application/app/features/signup/signup_screen.dart';
import 'package:food_nija_application/app/features/signup/upload_photo_profile.dart';
import 'package:food_nija_application/app/features/signup/upload_photo_way.dart';
import 'package:image_picker/image_picker.dart';
import '../features/home_screen.dart';
import '../features/login/login_screen.dart';

class RouteManager {
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';
  static const String onBoarding = '/onBoarding';
  static const String signupScreen = '/signupScreen';
  static const String infoSignupScreen = '/infoSignupScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String uploadPhotoWay = '/uploadPhotoWayScreen';
  static const String uploadPhotoProfile = '/uploadPhotoProfileScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(child: LoginScreen()),
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
      case infoSignupScreen:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(child: InfoSignup()),
        );
      case paymentScreen:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(child: PaymentScreen()),
        );
      case uploadPhotoWay:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(child: UploadPhotoWay()),
        );
      case uploadPhotoProfile:
        XFile? image = args as XFile?;
        return MaterialPageRoute(
          builder: (_) => SafeArea(child: UploadPhotoProfile(imageFile: image,)),
        );
      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
