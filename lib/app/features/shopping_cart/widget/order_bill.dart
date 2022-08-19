import 'package:food_nija_application/app/change_notifies/cart_provider.dart';
import 'package:food_nija_application/app/change_notifies/foods_provider.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:provider/provider.dart';

class OrderBill extends StatelessWidget {
  final Function()? onTap;
  const OrderBill({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<FoodsProvider>(context);

    double total = 0.0;
    double deliveryFee = 20;
    double discount = 25;
    double bill = 0.0;
    cartProvider.getCartItems.forEach((key, value) {
      final getCurrProduct = productProvider.findProdById(value.productId);
      total += getCurrProduct.price * value.quantity;
      bill += getCurrProduct.price * value.quantity + deliveryFee - discount;
    });
    return Container(
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
            padding: EdgeInsets.symmetric(horizontal: getWidth(30)),
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
                    '${total.toStringAsFixed(2)}\$',
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
                    Translations.of(context).text('Delivery Charge'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getFont(18),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${deliveryFee} \$',
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
                    '${discount} \$',
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
                    '${bill} \$',
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
            onTap: onTap,
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
    );
  }
}
