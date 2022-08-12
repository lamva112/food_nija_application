import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: getWidth(45),
        height: getWidth(45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.bgButtonBack,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.iconButtonBack,
          ),
        ),
      ),
    );
  }
}
