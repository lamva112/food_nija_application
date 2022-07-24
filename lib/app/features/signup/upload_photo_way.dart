import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_wigets/button_back.dart';
import 'package:food_nija_application/app/common_wigets/button_image.dart';
import 'package:food_nija_application/app/common_wigets/custom_button.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoWay extends StatefulWidget {
  const UploadPhotoWay({Key? key}) : super(key: key);

  @override
  State<UploadPhotoWay> createState() => _UploadPhotoWayState();
}

class _UploadPhotoWayState extends State<UploadPhotoWay> {
  int _index = -1;
  XFile? imageFile;

  void imageSelector(BuildContext context, int index) async {
    XFile? pickedFile;
    switch (index) {
      case 0:
        {
            pickedFile = await ImagePicker().pickImage(
            source: ImageSource.gallery,
          );
          if (!mounted) return;
          Navigator.of(context).pushNamed(RouteManager.uploadPhotoProfile, arguments: pickedFile);
        }
        break;
      case 1:
        {
            pickedFile = await ImagePicker().pickImage(
            source: ImageSource.camera,
          );
          if (!mounted) return;
          Navigator.of(context).pushNamed(RouteManager.uploadPhotoProfile, arguments: pickedFile);
        }
        break;
      default:
        Navigator.of(context).pushNamed(RouteManager.uploadPhotoProfile, arguments: pickedFile);
    }
  }

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
                  ListView.separated(
                    itemBuilder: (context, index) {
                      return ButtonImage(
                        borderColor: _index == index
                            ? Colors.redAccent
                            : Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: getHeight(20)),
                            SizedBox(
                              width: getWidth(65),
                              height: getWidth(65),
                              child: Image.asset(listPhotoWayImages[index]),
                            ),
                            SizedBox(height: getHeight(10)),
                            Text(
                              Translations.of(context).text('From gallery'),
                              style: TextStyle(
                                  fontSize: getFont(14),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: getHeight(20)),
                          ],
                        ),
                        onTap: () => setState(() {
                          _index = index;
                        }),
                      );
                    },
                    itemCount: listPhotoWayImages.length,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: getHeight(20)),
                  ),
                  SizedBox(height: getHeight(220)),
                  Center(
                    child: CustomButton(
                      title: Translations.of(context).text('Next'),
                      onPressed: () {
                        imageSelector(context, _index);
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

List<String> listPhotoWayImages = [
  'assets/images/gallery.png',
  'assets/images/take_photo.png',
];
