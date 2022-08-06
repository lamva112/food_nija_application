import 'package:flutter/material.dart';
import 'package:food_nija_application/app/features/homescreen/all_food_screen.dart';
import 'package:food_nija_application/app/features/homescreen/all_restaurant_screen.dart';
import 'package:food_nija_application/app/features/homescreen/widget/filter_screen.dart';
import 'package:food_nija_application/app/features/signup/info_signup_screen.dart';
import 'package:food_nija_application/app/features/signup/payment_screent.dart';
import 'package:food_nija_application/app/features/signup/signup_screen.dart';
import 'package:food_nija_application/app/features/signup/signup_succesfull.dart';
import 'package:food_nija_application/app/features/signup/upload_photo_profile.dart';
import 'package:food_nija_application/app/features/signup/upload_photo_way.dart';
import 'package:food_nija_application/app/routes/parameters_routes.dart';
import 'package:food_nija_application/data/models/user.dart';
import 'package:page_transition/page_transition.dart';
import '../features/login/login_screen.dart';

class RouteManager {
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signupScreen';
  static const String infoSignupScreen = '/infoSignupScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String uploadPhotoWay = '/uploadPhotoWayScreen';
  static const String uploadPhotoProfile = '/uploadPhotoProfileScreen';
  static const String signupSuccessful = '/signupSuccessful';
  static const String homeAllRestaurantScreen = '/homeAllRestaurantScreen';
  static const String homeAllFoodScreen = '/homeAllFoodScreen';
  static const String filterScreen = '/filterScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case loginScreen:
        return PageTransition(
          child: const SafeArea(child: LoginScreen()),
          type: PageTransitionType.fade,
        );
      case signupScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: SignupScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case infoSignupScreen:
        User user = args as User;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: InfoSignup(
            user: user,
          ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case paymentScreen:
        User user = args as User;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: PaymentScreen(
                    user: user,
                  ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case uploadPhotoWay:
        User user = args as User;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: UploadPhotoWay(
                    user: user,
                  ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case uploadPhotoProfile:
        UploadPhotoScreen obj = args as UploadPhotoScreen;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: UploadPhotoProfile(
                    imageFile: obj.image,
                    user: obj.user,
                  ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case signupSuccessful:
        return PageTransition(
          child: const SafeArea(
              child: SafeArea(
                  child: SignupSuccessful())),
          type: PageTransitionType.size,
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.center,
        );
      case homeAllRestaurantScreen:
        return PageTransition(
          child: const SafeArea(
              child: SafeArea(
                  child: HomeAllRestaurantScreen())),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
        );
      case filterScreen:
        Function(bool, String) onSelected = args as Function(bool, String);
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: FilterScreen(onSelected: onSelected,))),
          type: PageTransitionType.scale,
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.center,
        );
      case homeAllFoodScreen:
        return PageTransition(
          child: const SafeArea(
              child: SafeArea(
                  child: HomeAllFoodScreen())),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
        );
      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
