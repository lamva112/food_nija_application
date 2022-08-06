import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_nija_application/app/common_wigets/button_back.dart';
import 'package:food_nija_application/app/common_wigets/custom_button.dart';
import 'package:food_nija_application/app/core/utils/firebase_consts.dart';
import 'package:food_nija_application/app/core/utils/global_methods.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/loading_screen.dart';
import 'package:food_nija_application/app/features/signup/upload_location_screen.dart';

import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/models/user.dart';
import 'package:food_nija_application/data/services/auth_service.dart';
import 'package:food_nija_application/data/services/storage_methods.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadPhotoProfile extends StatefulWidget {
  final Uint8List imageFile;

  const UploadPhotoProfile({Key? key, required this.imageFile})
      : super(key: key);

  @override
  State<UploadPhotoProfile> createState() => _UploadPhotoProfileState();
}

class _UploadPhotoProfileState extends State<UploadPhotoProfile> {
  bool onTapRegister = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    final authService = Provider.of<AuthService>(context);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: getHeight(260),
                          width: getWidth(250),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(widget.imageFile),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(220)),
                    Center(
                      child: CustomButton(
                        title: Translations.of(context).text('Next'),
                        onPressed: () async {
                          _updateUserImage(imageFile: widget.imageFile);
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
      ),
    );
  }

  void _updateUserImage({
    required Uint8List imageFile,
  }) async {
    FocusScope.of(context).unfocus();
    final User? user = authInstance.currentUser;
    final _uid = user!.uid;
    setState(() {
      _isLoading = true;
    });
    try {
      String photoUrl = await StorageMethods()
          .uploadImageToStorage('profilePics', imageFile, false);
      FirebaseFirestore.instance.collection('users').doc(_uid).update({
        'photoUrl': photoUrl,
      });
      await Fluttertoast.showToast(
        msg: "our information has been updated",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => UploadLocation(),
        ),
      );
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
