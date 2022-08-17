import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_widgets/custom_button.dart';
import 'package:food_nija_application/app/common_widgets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/firebase_consts.dart';
import 'package:food_nija_application/app/core/utils/global_methods.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/loading_screen.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/models/user.dart' as model;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late User user;

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool statusLogin = false;
  bool speciallyNotification = false;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundLoginColor,
      body: LoadingManager(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          child: Column(
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
                Translations.of(context).text('Sign up free'),
                style: TextStyle(
                  fontSize: getFont(25),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getHeight(45)),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: Column(
                    children: [
                      TextInputWidget(
                        textEditingController: _name,
                        hintText: Translations.of(context).text('person'),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.primaryColor,
                        ),
                        validatorText:
                            Translations.of(context).text('Alias Validator'),
                      ),
                      SizedBox(height: getHeight(20)),
                      TextInputWidget(
                        textEditingController: _email,
                        hintText: Translations.of(context).text('Email'),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: AppColors.primaryColor,
                        ),
                        validatorText:
                            Translations.of(context).text('Email Validator'),
                      ),
                      SizedBox(height: getHeight(20)),
                      TextInputWidget(
                        textEditingController: _password,
                        hintText: Translations.of(context).text('Password'),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColors.primaryColor,
                        ),
                        validatorText:
                            Translations.of(context).text('Password Validator'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getWidth(8), vertical: getHeight(15)),
                height: getHeight(22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: statusLogin
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.circle_outlined,
                              color: Colors.green,
                            ),
                      onPressed: () {
                        setState(() {
                          statusLogin = !statusLogin;
                        });
                      },
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(0),
                    ),
                    Text(
                      Translations.of(context).text('Keep login'),
                      style: TextStyle(
                        fontSize: getFont(18),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: getWidth(8)),
                height: getHeight(22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: speciallyNotification
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.circle_outlined,
                              color: Colors.green,
                            ),
                      onPressed: () {
                        setState(() {
                          speciallyNotification = !speciallyNotification;
                        });
                      },
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(0),
                    ),
                    Text(
                      Translations.of(context).text('Email me something'),
                      style: TextStyle(
                        fontSize: getFont(18),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHeight(30)),
              CustomButton(
                title: Translations.of(context).text('Create account'),
                onPressed: () {
                  _submitFormOnRegister();
                },
                height: getHeight(55),
                width: getWidth(160),
                backgroundColor: AppColors.primaryColor,
                fontSize: getFont(20),
                textColor: Colors.white,
              ),
              SizedBox(height: getHeight(48)),
            ],
          ),
        ),
      ),
    );
  }

  void _submitFormOnRegister() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await authInstance.createUserWithEmailAndPassword(
            email: _email.text.toLowerCase().trim(),
            password: _password.text.trim());
        final User? user = authInstance.currentUser;
        final _uid = user!.uid;

        model.Users _user = model.Users(
          uid: _uid,
          username: _name.text,
          alias: '',
          firstName: '',
          lastName: '',
          statusLogin: statusLogin,
          speciallyNotification: speciallyNotification,
          phoneNumber: '',
          paymentType: '',
          photoUrl: '',
          address: '',
          userEmail: _email.text.toLowerCase().trim(),
          userCart: [],
          userWish: [],
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(_uid)
            .set(_user.toJson());
        Navigator.pushNamed(context, RouteManager.infoSignupScreen);
      } on FirebaseException catch (error) {
        GlobalMethods.errorDialog(
            subtitle: '${error.message}', context: context);
        setState(() {
          _isLoading = false;
        });
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
