import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_wigets/button_back.dart';
import 'package:food_nija_application/app/common_wigets/custom_button.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/models/user.dart';
import 'package:food_nija_application/data/services/auth_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadPhotoProfile extends StatefulWidget {
  final XFile? imageFile;
  final User user;

  const UploadPhotoProfile({Key? key, this.imageFile, required this.user})
      : super(key: key);

  @override
  State<UploadPhotoProfile> createState() => _UploadPhotoProfileState();
}

class _UploadPhotoProfileState extends State<UploadPhotoProfile> {
  bool onTapRegister = false;

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    final authService = Provider.of<AuthService>(context);
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
                    Translations.of(context).text('Upload photo'),
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
                  Container(
                    height: getHeight(260),
                    width: getWidth(250),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: widget.imageFile == null
                            ? const AssetImage('assets/images/bg_app.png')
                            : FileImage(File(widget.imageFile!.path)) as ImageProvider,
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(220)),
                  Center(
                    child: onTapRegister ? const CircularProgressIndicator() : CustomButton(
                      title: Translations.of(context).text('Next'),
                      onPressed: () async {
                        setState(() {
                          onTapRegister = !onTapRegister;
                        });
                        await authService.registerWithEmailAndPassword(
                            email: widget.user.username!, password: widget.user.password!);
                        if(!mounted) return;
                        setState(() {
                          onTapRegister = !onTapRegister;
                        });
                        Navigator.pushNamed(
                            context, RouteManager.signupSuccessful);
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
