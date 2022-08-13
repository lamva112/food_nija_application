import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/my_cart.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLoginColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundItemColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 1,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.textColor,
          labelStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 18.0),
          tabs: [
            Tab(
              text: Translations.of(context).text('My Cart'),
            ),
            Tab(
              text: Translations.of(context).text('My Orders'),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MyCart(),
          Center(
            child: Text('ahhi'),
          ),
        ],
      ),
    );
  }
}
