import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';

class ButtonImage extends StatelessWidget {
  final Color borderColor;
  final Widget child;
  final Function()? onTap;
  const ButtonImage({Key? key,required this.borderColor, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.textFormFieldColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor),
        ),
        child: child,
      ),
    );
  }
}
