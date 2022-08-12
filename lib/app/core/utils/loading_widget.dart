import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitSpinningLines(
            color: AppColors.selectedNavBarColor,
            size: 50.0,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Loading...',
            style: TextStyle(
              fontFamily: 'SFProText',
              fontSize: 16,
              color: AppColors.selectedNavBarColor,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
