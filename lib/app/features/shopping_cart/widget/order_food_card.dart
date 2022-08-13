import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:food_nija_application/data/models/order_detail.dart';

class OrderFoodCard extends StatefulWidget {
  final Function(BuildContext)? onPressed;
  final OrderDetails orderDetails;
  final Food food;

  const OrderFoodCard(
      {Key? key,
      required this.orderDetails,
      this.onPressed,
      required this.food})
      : super(key: key);

  @override
  State<OrderFoodCard> createState() => _OrderFoodCardState();
}

class _OrderFoodCardState extends State<OrderFoodCard> {
  late int count = widget.orderDetails.quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      elevation: 3,
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.onPressed,
              backgroundColor: AppColors.priceTextColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              spacing: 2,
              borderRadius: BorderRadius.circular(22),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getHeight(10)),
          child: ListTile(
            leading: Image.asset(
              widget.food.imageURL,
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
            trailing: SizedBox(
              width: getWidth(110),
              child: Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        count--;
                      });
                    },
                    color: AppColors.primaryColor.withOpacity(0.1),
                    padding: EdgeInsets.all(getWidth(10)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    height: getWidth(15),
                    minWidth: getWidth(15),
                    child: Icon(Icons.remove,
                        color: AppColors.primaryColor, size: getWidth(15)),
                  ),
                  SizedBox(width: getWidth(4.5)),
                  Text(
                    count.toString(),
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: getFont(16),
                    ),
                  ),
                  SizedBox(width: getWidth(4.5)),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.all(getWidth(10)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    height: getWidth(15),
                    minWidth: getWidth(15),
                    child: Icon(Icons.add,
                        color: AppColors.itemChildColor, size: getWidth(15)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
