import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/features/chat/chat_screen.dart';

import 'package:food_nija_application/app/features/fetch_data_screen.dart';
import 'package:food_nija_application/app/features/homescreen/all_food_screen.dart';
import 'package:food_nija_application/app/features/homescreen/all_restaurant_screen.dart';
import 'package:food_nija_application/app/features/homescreen/widget/filter_screen.dart';
import 'package:food_nija_application/app/features/info_food/info_food_screen.dart';
import 'package:food_nija_application/app/features/profile/profile_screen.dart';
import 'package:food_nija_application/app/features/shopping_cart/confirm_order.dart';
import 'package:food_nija_application/app/features/shopping_cart/order_successful.dart';
import 'package:food_nija_application/app/features/signup/info_signup_screen.dart';
import 'package:food_nija_application/app/features/signup/payment_screent.dart';
import 'package:food_nija_application/app/features/signup/signup_screen.dart';
import 'package:food_nija_application/app/features/signup/signup_succesfull.dart';
import 'package:food_nija_application/app/features/signup/upload_location_screen.dart';
import 'package:food_nija_application/app/features/signup/upload_photo_profile.dart';
import 'package:food_nija_application/app/features/signup/upload_photo_way.dart';
import 'package:food_nija_application/data/models/food.dart';
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
  static const String infoFoodScreen = '/infoFoodScreen';
  static const String fetchDataScreen = '/fetchDataScreen';
  static const String chatScreen = '/chatScreen';
  static const String uploadLocation = '/uploadLocation';
  static const String confirmOrder = '/confirmOrder';
  static const String orderSuccessful = '/orderSuccessful';
  static const String profileScreen = '/profileScreen';

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
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: InfoSignup())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case paymentScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: PaymentScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case uploadPhotoWay:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: UploadPhotoWay())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case uploadPhotoProfile:
        Uint8List obj = args as Uint8List;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: UploadPhotoProfile(
            imageFile: obj,
          ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case signupSuccessful:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: SignupSuccessful())),
          type: PageTransitionType.size,
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.center,
        );
      case homeAllRestaurantScreen:
        return PageTransition(
          child:
              const SafeArea(child: SafeArea(child: HomeAllRestaurantScreen())),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
        );
      case filterScreen:
        Function(bool, String) onSelected = args as Function(bool, String);
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: FilterScreen(
            onSelected: onSelected,
          ))),
          type: PageTransitionType.scale,
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.center,
        );
      case homeAllFoodScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: HomeAllFoodScreen())),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
        );
      case infoFoodScreen:
        String obj = args as String;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: InfoFoodScreen(
            foodId: obj,
          ))),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400),
        );
      case uploadLocation:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: UploadLocation())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case fetchDataScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: FecthDataScreen())),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400),
        );
      case chatScreen:
        return PageTransition(
          child: SafeArea(child: SafeArea(child: ChatScreen())),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400),
        );
      case confirmOrder:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: ConfirmOrder())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case orderSuccessful:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: OrderSuccessful())),
          type: PageTransitionType.scale,
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.center,
        );
      case profileScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: ProfileScreen())),
          type: PageTransitionType.rotate,
          duration: const Duration(milliseconds: 400),
        );
      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
