import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_nija_application/app/common_widgets/button_back.dart';
import 'package:food_nija_application/app/common_widgets/custom_button.dart';
import 'package:food_nija_application/app/common_widgets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/global_methods.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/loading_screen.dart';
import 'package:food_nija_application/app/routes/routes.dart';

import '../../core/utils/firebase_consts.dart';

class InfoSignup extends StatefulWidget {
  const InfoSignup({Key? key}) : super(key: key);

  @override
  State<InfoSignup> createState() => _InfoSignupState();
}

class _InfoSignupState extends State<InfoSignup> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundLoginColor,
      body: LoadingManager(
        isLoading: _isLoading,
        child: SingleChildScrollView(
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
                            hintText:
                                Translations.of(context).text('Last name'),
                            textEditingController: _lastName,
                            validatorText: Translations.of(context)
                                .text('LastName Validator'),
                          ),
                          SizedBox(height: getHeight(20)),
                          TextInputWidget(
                            textEditingController: _firstName,
                            hintText:
                                Translations.of(context).text('First name'),
                            validatorText: Translations.of(context)
                                .text('FirstName Validator'),
                          ),
                          SizedBox(height: getHeight(20)),
                          TextInputWidget(
                            textEditingController: _phoneNumber,
                            hintText:
                                Translations.of(context).text('Mobile number'),
                            validatorText: Translations.of(context)
                                .text('PhoneNumber Validator'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getHeight(260)),
                    Center(
                      child: CustomButton(
                        title: Translations.of(context).text('Next'),
                        onPressed: () {
                          _updateUserInfomation(
                            firstName: _firstName.text,
                            lastName: _lastName.text,
                            phoneNumber: _phoneNumber.text,
                          );
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
      ),
    );
  }

  void _updateUserInfomation(
      {required String firstName,
      required String lastName,
      required String phoneNumber}) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    final User? user = authInstance.currentUser;
    final _uid = user!.uid;

    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        FirebaseFirestore.instance.collection('users').doc(_uid).update({
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
        });
        await Fluttertoast.showToast(
          msg: "our information has been updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
        Navigator.pushNamed(context, RouteManager.paymentScreen);
      } catch (error) {
        GlobalMethods.errorDialog(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
