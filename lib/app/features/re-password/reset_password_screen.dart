import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_widgets/button_back.dart';
import 'package:food_nija_application/app/common_widgets/custom_button.dart';
import 'package:food_nija_application/app/common_widgets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/firebase_consts.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreen();
}

class _ResetPasswordScreen extends State<ResetPasswordScreen> {
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool onTapSend = false;

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
                    Translations.of(context).text('Forgot password'),
                    style: TextStyle(
                      fontSize: getFont(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  Text(
                    Translations.of(context).text('Enter Email Reset'),
                    style: TextStyle(
                      fontSize: getFont(15),
                    ),
                  ),
                  SizedBox(height: getHeight(40)),
                  Form(
                    key: _formKey,
                    child: TextInputWidget(
                      hintText:
                      Translations.of(context).text('Email'),
                      textEditingController: _email,
                      validatorText: Translations.of(context)
                          .text('Email Validator'),
                    ),
                  ),
                  SizedBox(height: getHeight(50)),
                  Center(
                    child: onTapSend
                        ? const CircularProgressIndicator()
                        : CustomButton(
                      title: Translations.of(context).text('Submit'),
                      onPressed: () {
                        _updateUserInformation(email: _email.text.trim());
                      },
                      height: getHeight(55),
                      width: getWidth(160),
                      backgroundColor: AppColors.primaryColor,
                      fontSize: getFont(20),
                      textColor: Colors.white,
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

  void _updateUserInformation(
      {required String email}) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        onTapSend = true;
      });
    }
    await authInstance.sendPasswordResetEmail(email: email);
    Navigator.pushNamed(context, RouteManager.sendEmailResetScreen);
  }
}
