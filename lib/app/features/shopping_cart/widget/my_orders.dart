import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_bill.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_food_card.dart';
import 'package:food_nija_application/data/models/cart.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(20), vertical: getHeight(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: getHeight(410),
              padding: EdgeInsets.symmetric(vertical: getHeight(10)),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext _, int index) {
                  var orderFood = listCart[index];
                  return OrderFoodCard(
                    cart: orderFood,
                    onPressed: (context) {},
                  );
                },
                itemCount: listCart.length,
              ),
            ),
            SizedBox(height: getHeight(20)),
            const OrderBill(),
          ],
        ),
      ),
    );
  }
}
