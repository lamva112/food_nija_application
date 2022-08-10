import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_food_card.dart';
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
                  Container(
                    height: getHeight(190),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/image_order_food.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(22),
                      color: const Color.fromARGB(255, 99, 199, 131),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: getHeight(15)),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: getWidth(30)),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Translations.of(context).text('Sub-Total'),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getFont(18),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '120 \$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getFont(18),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: getHeight(5)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Translations.of(context)
                                      .text('Delivery Charge'),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getFont(18),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '20 \$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getFont(18),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: getHeight(5)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Translations.of(context).text('Discount'),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getFont(18),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '150 \$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getFont(18),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: getHeight(20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Translations.of(context).text('Total'),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getFont(20),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '150 \$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getFont(20),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, RouteManager.confirmOrder);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: getHeight(8)),
                            height: getHeight(50),
                            width: getWidth(315),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                Translations.of(context).text('Order'),
                                style: TextStyle(
                                  fontSize: getFont(16),
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
