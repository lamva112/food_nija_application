import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/chat/chat_screen.dart';
import 'package:food_nija_application/app/features/homescreen/home_screen.dart';
import 'package:food_nija_application/app/features/profile/profile_screen.dart';
import 'package:food_nija_application/app/features/shopping_cart/shopping_cart_screen.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int index = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const ShoppingCartScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[index],
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: getWidth(30)),
        child: buildBottomNavigation(),
      ),
    );
  }

  Widget buildBottomNavigation() {
    return BottomNavigationBarCustom(
      containerHeight: getHeight(55),
      itemCornerRadius: 15,
      items: <BottomNavigationBarCustomItem>[
        BottomNavigationBarCustomItem(
          title: Translations.of(context).text('Home'),
          icon: const Icon(Icons.home_filled),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
          height: getHeight(56),
        ),
        BottomNavigationBarCustomItem(
          title: Translations.of(context).text('Profile'),
          icon: const Icon(Icons.person),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
          height: getHeight(56),
        ),
        BottomNavigationBarCustomItem(
          title: Translations.of(context).text('Profile'),
          icon: const Icon(Icons.shopping_cart),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
          height: getHeight(56),
        ),
        BottomNavigationBarCustomItem(
          title: Translations.of(context).text('Chat'),
          icon: const Icon(Icons.chat),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
          height: getHeight(56),
        ),
      ],
      onItemSelected: (index) => setState(() {
        this.index = index;
      }),
      selectedIndex: index,
    );
  }
}
