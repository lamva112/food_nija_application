import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/foods_provider.dart';
import 'package:food_nija_application/app/change_notifies/wishlist_provider.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:food_nija_application/data/models/wishlist_model.dart';
import 'package:provider/provider.dart';

class FoodProcessCard extends StatefulWidget {
  final String titleTrailing;
  final Color color;
  final bool? completed;

  const FoodProcessCard(
      {Key? key,
      required this.titleTrailing,
      required this.color,
      this.completed})
      : super(key: key);

  @override
  State<FoodProcessCard> createState() => _FoodProcessCardState();
}

class _FoodProcessCardState extends State<FoodProcessCard> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<FoodsProvider>(context);
    final wishlistModel = Provider.of<WishlistModel>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final getCurrProduct =
        productProvider.findProdById(wishlistModel.productId);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: getHeight(10)),
        child: ListTile(
          leading: Image.network(
            getCurrProduct.imageURL,
            width: getWidth(65),
            height: getWidth(65),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getCurrProduct.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: getFont(16),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                getCurrProduct.resName,
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
            '\$${getCurrProduct.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: getFont(17),
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: getHeight(10)),
          //   child: ListTile(
          //     leading: Image.asset(
          //       widget.food.image,
          //       width: getWidth(65),
          //       height: getWidth(65),
          //     ),
          //     title: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           widget.food.name,
          //           overflow: TextOverflow.ellipsis,
          //           style: TextStyle(
          //             fontSize: getFont(16),
          //             color: AppColors.textColor,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         Text(
          //           widget.food.description,
          //           overflow: TextOverflow.ellipsis,
          //           style: TextStyle(
          //             fontSize: getFont(15),
          //             color: AppColors.textColor,
          //             fontWeight: FontWeight.w300,
          //           ),
          //         )
          //       ],
          //     ),
          //     subtitle: Text(
          //       '\$ ${widget.food.price}',
          //       style: TextStyle(
          //         fontSize: getFont(17),
          //         color: AppColors.primaryColor,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     trailing: Container(
          //       padding: EdgeInsets.symmetric(
          //           horizontal: getWidth(7), vertical: getHeight(7)),
          //       height: getHeight(30),
          //       decoration: BoxDecoration(
          //         color: widget.color,
          //         borderRadius: BorderRadius.circular(18),
          //       ),
          //       child: Text(
          //         widget.titleTrailing,
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold,
          //           fontSize: getFont(14),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // ],
        ),
      ),
    );
  }
}
