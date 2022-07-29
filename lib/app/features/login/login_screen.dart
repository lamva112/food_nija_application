import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_wigets/custom_button.dart';
import 'package:food_nija_application/app/common_wigets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/login/widget/login_with_item.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool onTapLogin = false;

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundLoginColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: getHeight(325),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_app.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                  heightFactor: getHeight(1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo_app.png',
                        fit: BoxFit.cover,
                        width: getWidth(175),
                        height: getHeight(140),
                      ),
                      Text(
                        'FoodNinja',
                        style: TextStyle(
                          fontSize: getFont(40),
                          fontFamily: 'Viga',
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        'Deliever Favorite Food',
                        style: TextStyle(
                          fontSize: getFont(16),
                          fontFamily: 'Viga',
                          color: AppColors.textColor,
                        ),
                      )
                    ],
                  )),
            ],
          ),
          Text(
            Translations.of(context).text('Login To Your Screen'),
            style: TextStyle(
              fontSize: getFont(25),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getHeight(37)),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: Align(
              widthFactor: getHeight(35),
              alignment: Alignment.centerRight,
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
                  )),
            ),
          ),
          Center(
            child: Text(
              Translations.of(context).text('or'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getFont(15),
              ),
            ),
          ),
          SizedBox(height: getHeight(25),),
          Row(
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
          SizedBox(
            height: getHeight(50),
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
          SizedBox(height: getHeight(10)),
          onTapLogin ? const CircularProgressIndicator()
          : CustomButton(
            title: Translations.of(context).text('Login'),
            onPressed: () async {
              setState(() {
                onTapLogin = !onTapLogin;
              });
              await authService.signInAnonymous();
              setState(() {
                onTapLogin = !onTapLogin;
              });
            },
            height: getHeight(55),
            witdh: getWidth(160),
            backgroundColor: AppColors.primaryColor,
            fontSize: getFont(20),
            textColor: AppColors.textButtonColor,
          ),
        ],
      ),
    );
  }
}
