import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';

class TextInputWidget extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  const TextInputWidget({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: prefixIcon != null
            ? EdgeInsets.symmetric(vertical: getHeight(15))
            : EdgeInsets.symmetric(
                vertical: getHeight(15), horizontal: getWidth(20)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: AppColors.textFormFieldColor,
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 0.0, color: AppColors.textFormFieldColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 0.0, color: AppColors.textFormFieldColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
