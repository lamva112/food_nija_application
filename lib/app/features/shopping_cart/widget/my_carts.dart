import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_bill.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_food_card.dart';
import 'package:food_nija_application/data/models/cart.dart';
import 'package:food_nija_application/data/models/order.dart';
import 'package:food_nija_application/data/models/order_detail.dart';

class MyCarts extends StatefulWidget {
  const MyCarts({Key? key}) : super(key: key);

  @override
  State<MyCarts> createState() => _MyCartsState();
}

class _MyCartsState extends State<MyCarts> {
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
                    onPressed: (context) {
                      setState(() {
                        listCart.remove(listCart[index]);
                      });
                    },
                  );
                },
                itemCount: listCart.length,
              ),
            ),
            SizedBox(height: getHeight(20)),
            OrderBill(onTap: () {
              List<OrderDetails> orderDetails = [];
              for (var obj in listCart) {
                orderDetails.add(
                  OrderDetails(
                    orderId: '1',
                    quantity: obj.quantity,
                    foodId: obj.foodId,
                    food: obj.food,
                    status: StatusType.completed,
                  ),
                );
              }
              listOrder[0].listOrderDetails?.addAll(orderDetails);
              listOrder[1].listOrderDetails?.addAll(orderDetails);
              setState(() {
                listCart.clear();
              });
            }),
          ],
        ),
      ),
    );
  }
}