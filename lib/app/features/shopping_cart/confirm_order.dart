import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_widgets/button_back.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

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
                  const ButtonBack(),
                  SizedBox(height: getHeight(20)),
                  Text(
                    Translations.of(context).text('Confirm Order'),
                    style: TextStyle(
                      fontSize: getFont(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: getHeight(410),
                    padding: EdgeInsets.symmetric(vertical: getHeight(10)),
                    child: Column(
                      children: [
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth(10),
                                vertical: getHeight(15)),
                            height: getHeight(100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Translations.of(context)
                                          .text('Deliver To'),
                                      style: TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w200,
                                        fontSize: getFont(18),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        Translations.of(context).text('Edit'),
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                          fontSize: getFont(14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: getHeight(10)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/PinLogo.png'),
                                    SizedBox(width: getWidth(15)),
                                    Text(
                                      '4517 Washington Ave. Manchester,\nKentucky 39495',
                                      style: TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: getFont(16),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth(10),
                                vertical: getHeight(15)),
                            height: getHeight(100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Translations.of(context)
                                          .text('Payment method'),
                                      style: TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w200,
                                        fontSize: getFont(18),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        Translations.of(context).text('Edit'),
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                          fontSize: getFont(14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: getHeight(15)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/paypal.png',
                                      width: getWidth(90),
                                      height: getHeight(25),
                                    ),
                                    SizedBox(width: getWidth(15)),
                                    Text(
                                      '2121 6352 8465 ****',
                                      style: TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: getFont(16),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
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
                          onTap: () {
                            Navigator.pushNamed(context, RouteManager.orderSuccessful);
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
