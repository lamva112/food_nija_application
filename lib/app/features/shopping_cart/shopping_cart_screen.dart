import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_bill.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/models/order.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
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
                        return OrderFoodCard(
                          orderDetails: order.listOrderDetails![index],
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
          ],
        ),
      ),
    );
  }
}
