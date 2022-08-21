import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_widgets/custom_button.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';

class SendMailResetPassword extends StatelessWidget {
  const SendMailResetPassword({Key? key}) : super(key: key);

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
                  Icon(
                    Icons.mail,
                    size: getHeight(100),
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(height: getHeight(15)),
                  Center(
                    child: Text(
                      Translations.of(context)
                          .text('Send Email Reset'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getFont(22),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(40)),
                  CustomButton(
                    title: Translations.of(context).text('Next'),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteManager.loginScreen, (route) => false);
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
