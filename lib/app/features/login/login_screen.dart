import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_wigets/custom_button.dart';
import 'package:food_nija_application/app/common_wigets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/login/widget/login_with_item.dart';
import 'package:food_nija_application/app/routes/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundLoginColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppColors.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: getHeight(290)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Translations.of(context).text('Login To Your Screen'),
                style: TextStyle(
                  fontSize: getFont(25),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getHeight(45)),
              Form(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: Column(
                    children: [
                      TextInputWidget(
                        hintText: Translations.of(context).text('Email'),
                        prefixIcon: const Icon(Icons.mail),
                      ),
                      SizedBox(height: getHeight(20)),
                      TextInputWidget(
                        hintText: Translations.of(context).text('Password'),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(60),
                child: Center(
                  child: Text(
                    Translations.of(context).text('or'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getFont(15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoginItem(
                      title: 'Facebook',
                      image: 'assets/images/facebook.png',
                      width: getWidth(140),
                      height: getHeight(55),
                      color: AppColors.textFormFieldColor,
                      iconRadius: getWidth(15),
                    ),
                    LoginItem(
                      title: 'Google',
                      image: 'assets/images/google.png',
                      width: getWidth(140),
                      height: getHeight(55),
                      color: AppColors.textFormFieldColor,
                      iconRadius: getWidth(15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(60),
                child: Center(
                  child: Text(
                    Translations.of(context).text('Forgot password'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getFont(15),
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getHeight(15)),
              CustomButton(
                title: Translations.of(context).text('Login'),
                onPressed: () {},
                height: getHeight(55),
                witdh: getWidth(160),
                backgroundColor: AppColors.primaryColor,
                fontSize: getFont(20),
                textColor: AppColors.textButtonColor,
              ),
              SizedBox(
                height: getHeight(50),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteManager.signupScreen);
                    },
                  child: Text(
                    Translations.of(context).text('Sign up'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getFont(15),
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
