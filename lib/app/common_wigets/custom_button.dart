import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final double? height;
  final double? witdh;
  final Color? backgroundColor;
  final Color? textColor;
  final String title;
  final double? fontSize;
  const CustomButton({
    Key? key,
    this.onPressed,
    this.height,
    this.witdh,
    this.backgroundColor,
    required this.title,
    this.fontSize,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height,
      minWidth: witdh,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
