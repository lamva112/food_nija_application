import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_nija_application/app/change_notifies/user_provider.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/botttom_navigation%20bar/my_bottom_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FecthDataScreen extends StatefulWidget {
  FecthDataScreen({Key? key}) : super(key: key);

  @override
  State<FecthDataScreen> createState() => _FecthDataScreenState();
}

class _FecthDataScreenState extends State<FecthDataScreen> {
  @override
  void initState() {
    addData();
    Future.delayed(const Duration(microseconds: 1000000), () async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MyBottomBar(),
        ),
      );
    });
    super.initState();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            SizedBox(height: getHeight(140)),
            Container(
              alignment: Alignment.topCenter,
              child: Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_kzfpndct.json',
              ),
            ),
            SizedBox(
              height: getHeight(15),
            ),
            SpinKitThreeBounce(
              color: Colors.greenAccent,
              size: 70.0,
            ),
          ],
        ),
      ),
    );
  }
}
