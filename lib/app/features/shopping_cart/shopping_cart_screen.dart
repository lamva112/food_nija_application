import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_widgets/button_back.dart';
import 'package:food_nija_application/app/common_widgets/custom_button.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/shopping_cart/widget/order_food_card.dart';
import 'package:food_nija_application/data/models/order.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
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
                  SizedBox(height: getHeight(20)),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext _, int index) {
                      return OrderFoodCard(
                          orderDetails: order.listOrderDetails![index]);
                    },
                    itemCount: order.listOrderDetails?.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        title: Translations.of(context).text('Next'),
        onPressed: () {},
        height: getHeight(55),
        width: getWidth(160),
        backgroundColor: AppColors.primaryColor,
        fontSize: getFont(20),
        textColor: AppColors.textButtonColor,
      ),
    );
  }
}
