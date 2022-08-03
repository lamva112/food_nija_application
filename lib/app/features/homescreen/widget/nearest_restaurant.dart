import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/restaurant.dart';

class NearestRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  const NearestRestaurant({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Container(
      width: getWidth(150),
      margin: const EdgeInsets.all(1.7),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: getHeight(25)),
          Image.asset(
            restaurant.image,
            width: getWidth(90),
            height: getHeight(75),
          ),
          SizedBox(height: getHeight(15)),
          Text(
            restaurant.resName,
            style: TextStyle(
              fontSize: getFont(18),
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getHeight(5)),
          Text(
            '${restaurant.time} Mins',
            style: TextStyle(
              fontSize: getFont(15),
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
