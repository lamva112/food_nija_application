import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_nija_application/app/common_widgets/button_back.dart';
import 'package:food_nija_application/app/common_widgets/button_image.dart';
import 'package:food_nija_application/app/common_widgets/custom_button.dart';
import 'package:food_nija_application/app/core/utils/firebase_consts.dart';
import 'package:food_nija_application/app/core/utils/global_methods.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/loading_screen.dart';
import 'package:food_nija_application/app/routes/routes.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _index = -1;
  String card = "";
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
                      Translations.of(context).text('Payment method'),
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
                          child: Center(
                            child: SizedBox(
                                width: getWidth(65),
                                height: getWidth(65),
                                child: Image.asset(listPaymentImages[index])),
                          ),
                          onTap: () => setState(() {
                            _index = index;
                            card = checkPayment(index);
                          }),
                        );
                      },
                      itemCount: listPaymentImages.length,
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: getHeight(20)),
                    ),
                    SizedBox(height: getHeight(220)),
                    Center(
                      child: CustomButton(
                        title: Translations.of(context).text('Next'),
                        onPressed: () {
                          _updateUserInformation(card: card);
                        },
                        height: getHeight(55),
                        width: getWidth(160),
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

  String checkPayment(int num) {
    String card = '';
    if (num == 0) {
      card = "PayPal";
    } else if (num == 1) {
      card = "Visa";
    } else {
      card = "Payoneer";
    }
    return card;
  }

  void _updateUserInformation({
    required String card,
  }) async {
    FocusScope.of(context).unfocus();
    final User? user = authInstance.currentUser;
    final _uid = user!.uid;

    if (_index >= 0 && _index <= 2) {
      setState(() {
        _isLoading = true;
      });
      try {
        FirebaseFirestore.instance.collection('users').doc(_uid).update({
          'paymentType': card,
        });
        await Fluttertoast.showToast(
          msg: "our information has been updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
        Navigator.pushNamed(context, RouteManager.uploadPhotoWay);
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

List<String> listPaymentImages = [
  'assets/images/paypal.png',
  'assets/images/visa.png',
  'assets/images/payoneer.png',
];
