import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';

class PopularMenuRestaurant extends StatefulWidget {
  final snap;
  const PopularMenuRestaurant({Key? key, required this.snap}) : super(key: key);

  @override
  State<PopularMenuRestaurant> createState() => _PopularMenuRestaurant();
}

class _PopularMenuRestaurant extends State<PopularMenuRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
              '12 \$',
              style: TextStyle(
                fontSize: getFont(15),
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
