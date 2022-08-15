import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/food.dart';

class FoodProcessCard extends StatefulWidget {
  final Food food;
  final String titleTrailing;

  const FoodProcessCard({Key? key, required this.food, required this.titleTrailing})
      : super(key: key);

  @override
  State<FoodProcessCard> createState() => _FoodProcessCardState();
}

class _FoodProcessCardState extends State<FoodProcessCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: getHeight(10)),
        child: ListTile(
          leading: Image.asset(
            widget.food.image,
            width: getWidth(65),
            height: getWidth(65),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.food.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: getFont(16),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.food.description,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: getFont(15),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          subtitle: Text(
            '\$ ${widget.food.price}',
            style: TextStyle(
              fontSize: getFont(17),
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.symmetric(horizontal: getWidth(7), vertical: getHeight(7)),
            height: getHeight(30),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              widget.titleTrailing,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: getFont(14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
