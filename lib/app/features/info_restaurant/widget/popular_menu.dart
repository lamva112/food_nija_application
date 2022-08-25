import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:provider/provider.dart';

class PopularMenuRestaurant extends StatefulWidget {
  const PopularMenuRestaurant({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularMenuRestaurant> createState() => _PopularMenuRestaurant();
}

class _PopularMenuRestaurant extends State<PopularMenuRestaurant> {
  @override
  Widget build(BuildContext context) {
    final FoodsModel = Provider.of<Food>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteManager.infoFoodScreen,
          arguments: FoodsModel.id,
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Container(
          width: getWidth(150),
          margin: const EdgeInsets.all(1.7),
          decoration: BoxDecoration(
            color: AppColors.backgroundItemColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(18)),
              Image.network(
                FoodsModel.imageURL,
                width: getWidth(90),
                height: getHeight(75),
              ),
              SizedBox(height: getHeight(15)),
              Text(
                FoodsModel.name,
                style: TextStyle(
                  fontSize: getFont(18),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getHeight(5)),
              Text(
                '${FoodsModel.price} \$',
                style: TextStyle(
                  fontSize: getFont(15),
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
