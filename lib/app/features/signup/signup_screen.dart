import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/change_notifies.dart';
import 'package:food_nija_application/app/common_wigets/custom_button.dart';
import 'package:food_nija_application/app/common_wigets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
                Translations.of(context).text('Sign up free'),
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
                        hintText: Translations.of(context).text('person'),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: getHeight(20)),
                      TextInputWidget(
                        hintText: Translations.of(context).text('Email'),
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: getHeight(20)),
                      TextInputWidget(
                        hintText: Translations.of(context).text('Password'),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: AppColors.primaryColor,
                        ),
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
                      icon: Provider.of<UserProvider>(context, listen: true)
                              .keepLogin
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.circle_outlined,
                              color: Colors.green,
                            ),
                      onPressed: () {
                        context.read<UserProvider>().keepLogin =
                            !context.read<UserProvider>().keepLogin;
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
                      icon: Provider.of<UserProvider>(context, listen: true)
                              .emailMe
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.circle_outlined,
                              color: Colors.green,
                            ),
                      onPressed: () {
                        context.read<UserProvider>().emailMe =
                            !context.read<UserProvider>().emailMe;
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
              SizedBox(height: getHeight(50)),
              CustomButton(
                title: Translations.of(context).text('Creat account'),
                onPressed: () {},
                height: getHeight(55),
                witdh: getWidth(160),
                backgroundColor: AppColors.primaryColor,
                fontSize: getFont(20),
                textColor: AppColors.textButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
