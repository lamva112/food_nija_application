import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/restaurant.dart';

class NearestRestaurant extends StatefulWidget {
  final snap;
  const NearestRestaurant({Key? key, required this.snap}) : super(key: key);

  @override
  State<NearestRestaurant> createState() => _NearestRestaurantState();
}

class _NearestRestaurantState extends State<NearestRestaurant> {
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
          SizedBox(height: getHeight(18)),
          Image.network(
            widget.snap['imageUrl'].toString(),
            width: getWidth(90),
            height: getHeight(75),
          ),
          SizedBox(height: getHeight(15)),
          Text(
            widget.snap['resName'].toString(),
            style: TextStyle(
              fontSize: getFont(18),
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getHeight(5)),
          Text(
            widget.snap['time'].toString() + " Mins",
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
