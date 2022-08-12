import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';

class TextInputWidget extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? validatorText;
  final TextEditingController? textEditingController;
  final bool obscureText;
  final Function()? onTapSuffixIcon;
  final Color? fillColor;
  const TextInputWidget({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validatorText,
    this.textEditingController,
    this.obscureText = false,
    this.onTapSuffixIcon,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String text;
    CustomSize().init(context);
    return TextFormField(
      obscureText: obscureText,
      initialValue: null,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: fillColor?.withOpacity(0.6),
          fontWeight: FontWeight.w400,
        ),
        contentPadding: prefixIcon != null
            ? EdgeInsets.symmetric(vertical: getHeight(15))
            : EdgeInsets.symmetric(
                vertical: getHeight(15), horizontal: getWidth(20)),
        prefixIcon: prefixIcon,
        suffixIcon: onTapSuffixIcon == null
            ? suffixIcon
            : GestureDetector(
                onTap: onTapSuffixIcon,
                child: suffixIcon,
              ),
        fillColor: fillColor ?? AppColors.textFormFieldColor,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 0.0, color: AppColors.textFormFieldColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 0.0, color: AppColors.textFormFieldColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.0, color: Colors.redAccent),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.0, color: Colors.redAccent),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onChanged: (value) => text = value,
      validator: (value) => (value?.isEmpty ?? true) ? validatorText : null,
    );
  }
}
