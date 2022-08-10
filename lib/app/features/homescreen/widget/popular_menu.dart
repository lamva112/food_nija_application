import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/food.dart';

class PopularMenu extends StatelessWidget {
  final Food food;
  const PopularMenu({Key? key, required this.food}) : super(key: key);

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(getWidth(10)),
            child: Image.asset(
              food.image,
              width: getWidth(65),
              height: getWidth(65),
            ),
          ),
          SizedBox(width: getHeight(15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: getWidth(140),
                child: Text(
                  food.name,
                  style: TextStyle(
                    fontSize: getFont(18),
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: getHeight(5)),
              Text(
                food.description,
                style: TextStyle(
                  fontSize: getFont(15),
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
          SizedBox(width: getWidth(30)),
          Text(
            '\$${food.price}',
            style: TextStyle(
              color: AppColors.priceTextColor,
              fontWeight: FontWeight.bold,
              fontSize: getFont(25),
            ),
          ),
        ],
      ),
    );
  }
}
