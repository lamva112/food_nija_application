import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';

class OrderBill extends StatelessWidget {
  const OrderBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
