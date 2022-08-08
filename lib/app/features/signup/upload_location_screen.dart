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
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class UploadLocation extends StatefulWidget {
  const UploadLocation({Key? key}) : super(key: key);

  @override
  State<UploadLocation> createState() => _UploadLocationState();
}

class _UploadLocationState extends State<UploadLocation> {
  bool onTapRegister = false;
  bool _isLoading = false;
  String location = 'Your Location';
  String Address = 'search';

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
                      Translations.of(context).text('Set Location'),
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
                          height: getHeight(147),
                          width: getWidth(335),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white24,
                                blurRadius: 2.0,
                                spreadRadius: 10.0,
                                offset: Offset(
                                  1.0,
                                  0.0,
                                ), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 11,
                                  ),
                                  SizedBox(
                                    width: getWidth(33),
                                    height: getWidth(33),
                                    child: Image.asset(
                                        'assets/images/PinLogo.png'),
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Text(
                                    '${Address}',
                                    style: TextStyle(
                                      fontSize: getFont(15),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 33,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      Position position =
                                          await _getGeoLocationPosition();
                                      location =
                                          'Lat: ${position.latitude} , Long: ${position.longitude}';
                                      GetAddressFromLatLong(position);
                                    },
                                    child: Container(
                                      height: 57,
                                      width: getWidth(322),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                        color: AppColors.locationColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          Translations.of(context)
                                              .text('Set Location'),
                                          style: TextStyle(
                                              fontSize: getFont(15),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(338)),
                    Center(
                      child: CustomButton(
                        title: Translations.of(context).text('Next'),
                        onPressed: () async {
                          _updateLocation(address: Address);
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

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality},  ${place.country}';
    setState(() {});
  }

  void _updateLocation({
    required String address,
  }) async {
    FocusScope.of(context).unfocus();
    final User? user = authInstance.currentUser;
    final _uid = user!.uid;

    if (location != 'Your Location') {
      setState(() {
        _isLoading = true;
      });
      try {
        FirebaseFirestore.instance.collection('users').doc(_uid).update({
          'address': address,
        });
        await Fluttertoast.showToast(
          msg: "our information has been updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
        Navigator.pushNamed(context, RouteManager.signupSuccessful);
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
