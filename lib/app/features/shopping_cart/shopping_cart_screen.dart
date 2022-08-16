import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/cart_provider.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_bill.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_food_card.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:food_nija_application/data/models/order.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemsList =
        cartProvider.getCartItems.values.toList().reversed.toList();
    return Scaffold(
      backgroundColor: AppColors.backgroundLoginColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg_app_short.png',
              height: getHeight(200),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(20), vertical: getHeight(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getHeight(20)),
                  Text(
                    Translations.of(context).text('Order details'),
                    style: TextStyle(
                      fontSize: getFont(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: getHeight(410),
                    padding: EdgeInsets.symmetric(vertical: getHeight(10)),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext _, int index) {
                        return ChangeNotifierProvider.value(
                          value: cartItemsList[index],
                          child: OrderFoodCard(
                            q: cartItemsList[index].quantity,
                          ),
                        );
                      },
                      itemCount: cartItemsList.length,
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  const OrderBill(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
