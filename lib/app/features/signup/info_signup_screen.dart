import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_wigets/button_back.dart';
import 'package:food_nija_application/app/common_wigets/custom_button.dart';
import 'package:food_nija_application/app/common_wigets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/models/user.dart';

class InfoSignup extends StatelessWidget {
  final User user;
  InfoSignup({Key? key, required this.user}) : super(key: key);

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              padding: EdgeInsets.symmetric(horizontal: getWidth(20), vertical: getHeight(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ButtonBack(),
                  SizedBox(height: getHeight(20)),
                  Text(
                    Translations.of(context).text('Fill information'),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextInputWidget(
                          hintText: Translations.of(context).text('Last name'),
                          textEditingController: _lastName,
                          validatorText: Translations.of(context).text('LastName Validator'),
                        ),
                        SizedBox(height: getHeight(20)),
                        TextInputWidget(
                          textEditingController: _firstName,
                          hintText: Translations.of(context).text('First name'),
                          validatorText: Translations.of(context).text('FirstName Validator'),
                        ),
                        SizedBox(height: getHeight(20)),
                        TextInputWidget(
                          textEditingController: _phoneNumber,
                          hintText: Translations.of(context).text('Mobile number'),
                          validatorText: Translations.of(context).text('PhoneNumber Validator'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(260)),
                  Center(
                    child: CustomButton(
                      title: Translations.of(context).text('Next'),
                      onPressed: () {
                        if(_formKey.currentState?.validate() ?? false){
                          user.lastName = _lastName.text;
                          user.firstName = _firstName.text;
                          user.phoneNumber = _phoneNumber.text;
                          Navigator.pushNamed(context, RouteManager.paymentScreen, arguments: user);
                        } else {
                          _formKey.currentState?.validate();
                        }
                      },
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
