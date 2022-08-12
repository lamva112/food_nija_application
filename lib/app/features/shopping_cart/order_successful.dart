import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_widgets/custom_button.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/homescreen/home_screen.dart';
class OrderSuccessful extends StatelessWidget {
  const OrderSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLoginColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg_app.png',
              height: getHeight(350),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: getHeight(200)),
                  const Image(
                    image: AssetImage('assets/images/success.png'),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: getHeight(35)),
                  Text(
                    Translations.of(context).text('Order Successful'),
                    style: TextStyle(
                        fontSize: getFont(35),
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(height: getHeight(15)),
                  Text(
                    Translations.of(context).text('Thanks Order'),
                    style: TextStyle(
                      fontSize: getFont(22),
                      fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: getHeight(220)),
                  CustomButton(
                    title: Translations.of(context).text('Next'),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext _ ) => const HomeScreen() ), (route) => false);
                    },
                    height: getHeight(55),
                    width: getWidth(160),
                    backgroundColor: AppColors.primaryColor,
                    fontSize: getFont(20),
                    textColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
