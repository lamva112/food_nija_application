import 'package:flutter/material.dart';
import 'package:food_nija_application/app/features/home_popular_screen/popular_screen.dart';
import 'package:food_nija_application/app/features/signup/info_signup_screen.dart';
import 'package:food_nija_application/app/features/signup/payment_screent.dart';
import 'package:food_nija_application/app/features/signup/signup_screen.dart';
import 'package:food_nija_application/app/features/signup/signup_succesfull.dart';
import 'package:food_nija_application/app/features/signup/upload_photo_profile.dart';
import 'package:food_nija_application/app/features/signup/upload_photo_way.dart';
import 'package:food_nija_application/app/routes/parameters_routes.dart';
import 'package:food_nija_application/data/models/user.dart';
import '../features/login/login_screen.dart';

class RouteManager {
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signupScreen';
  static const String infoSignupScreen = '/infoSignupScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String uploadPhotoWay = '/uploadPhotoWayScreen';
  static const String uploadPhotoProfile = '/uploadPhotoProfileScreen';
  static const String signupSuccessful = '/signupSuccessful';
  static const String homePopularScreen = '/homePopularScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(child: LoginScreen()),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(child: SignupScreen()),
        );
      case infoSignupScreen:
        User user = args as User;
        return MaterialPageRoute(
          builder: (context) => SafeArea(child: InfoSignup(user: user,)),
        );
      case paymentScreen:
        User user = args as User;
        return MaterialPageRoute(
          builder: (context) => SafeArea(child: PaymentScreen(user: user,)),
        );
      case uploadPhotoWay:
        User user = args as User;
        return MaterialPageRoute(
          builder: (context) => SafeArea(child: UploadPhotoWay(user: user,)),
        );
      case uploadPhotoProfile:
        UploadPhotoScreen obj = args as UploadPhotoScreen;
        return MaterialPageRoute(
          builder: (_) => SafeArea(child: UploadPhotoProfile(imageFile: obj.image, user: obj.user,)),
        );
      case signupSuccessful:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(child: SignupSuccessful()),
        );
      case homePopularScreen:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(child: HomePopularScreen()),
        );
      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
