import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/models/food.dart';

class FoodProcessCard extends StatefulWidget {
  final Food food;
  final String titleTrailing;
  final Color color;
  final bool? completed;

  const FoodProcessCard({Key? key,
    required this.food,
    required this.titleTrailing,
    required this.color,
    this.completed,
  })
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
      child: Stack(
        children: [
          Visibility(
            visible:widget.completed ?? false,
            child: Positioned(
              bottom: 5,
              right: 15,
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteManager.reviewScreen);
                },
                child: Text(
                  Translations.of(context).text('Review'),
                  style: TextStyle(
                      fontSize: getFont(14),
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w200,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
          ),
          Padding(
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
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(7), vertical: getHeight(7)),
                height: getHeight(30),
                decoration: BoxDecoration(
                  color: widget.color,
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
        ],
      ),
    );
  }
}
