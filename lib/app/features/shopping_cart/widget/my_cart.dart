import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_bill.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_food_card.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:food_nija_application/data/models/order.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
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
                  var orderFood = order.listOrderDetails![index];
                  return OrderFoodCard(
                    orderDetails: orderFood,
                    food: listFood.firstWhere((obj) => obj.id == orderFood.foodId),
                    onPressed: (context) {
                      setState(() {
                        order.listOrderDetails
                            ?.remove(order.listOrderDetails![index]);
                      });
                    },
                  );
                },
                itemCount: order.listOrderDetails?.length,
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
