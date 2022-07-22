import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_wigets/button_back.dart';
import 'package:food_nija_application/app/common_wigets/button_image.dart';
import 'package:food_nija_application/app/common_wigets/custom_button.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _index = -1;

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
                  const ButtonBack(),
                  SizedBox(height: getHeight(20)),
                  Text(
                    Translations.of(context).text('Payment method'),
                    style: TextStyle(
                      fontSize: getFont(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  Text(
                    Translations.of(context).text('Data security'),
                    style: TextStyle(
                      fontSize: getFont(15),
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  ListView.separated(
                    itemBuilder: (context, index) {
                      return ButtonImage(
                        borderColor: _index == index
                            ? Colors.redAccent
                            : Colors.transparent,
                        child: Center(
                          child: SizedBox(
                              width: getWidth(65),
                              height: getWidth(65),
                              child: Image.asset(listPaymentImages[index])),
                        ),
                        onTap: () => setState(() {
                          _index = index;
                        }),
                      );
                    },
                    itemCount: listPaymentImages.length,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: getHeight(20)),
                  ),
                  SizedBox(height: getHeight(220)),
                  Center(
                    child: CustomButton(
                      title: Translations.of(context).text('Next'),
                      onPressed: () {},
                      height: getHeight(55),
                      witdh: getWidth(160),
                      backgroundColor: AppColors.primaryColor,
                      fontSize: getFont(20),
                      textColor: AppColors.textButtonColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> listPaymentImages = [
  'assets/images/paypal.png',
  'assets/images/visa.png',
  'assets/images/payoneer.png',
];
