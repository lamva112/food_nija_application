import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/review.dart';
import 'package:intl/intl.dart';

class ReviewFood extends StatefulWidget {
  final snap;

  const ReviewFood({
    Key? key,
    this.snap,
  }) : super(key: key);

  @override
  State<ReviewFood> createState() => _ReviewFoodState();
}

class _ReviewFoodState extends State<ReviewFood> {
  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    CustomSize().init(context);
    return Card(
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(10), vertical: getHeight(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                widget.snap['profilePic'],
                fit: BoxFit.cover,
                width: getWidth(65),
                height: getWidth(65),
              ),
            ),
            SizedBox(width: getWidth(20)),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.snap['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFont(18),
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      widget.snap['dateRV'],
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: getFont(15),
                        color: AppColors.textColor,
                      ),
                    ),
                    SizedBox(height: getHeight(15)),
                    SizedBox(
                      width: getWidth(215),
                      child: Text(
                        widget.snap['review'],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: getFont(16),
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
                    height: getHeight(35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.primaryColor,
                          size: getWidth(27),
                        ),
                        Text(
                          widget.snap['rating'].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                            fontSize: getFont(22),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
