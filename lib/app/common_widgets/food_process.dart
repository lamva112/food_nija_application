import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/cart_provider.dart';
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
  final snap;
  const FoodProcessCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

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
          leading: Image.network(
            widget.snap['imageUrl'],
            width: getWidth(65),
            height: getWidth(65),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.snap['Name'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: getFont(16),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.snap['resName'],
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
            '\$${widget.snap['price']}',
            style: TextStyle(
              fontSize: getFont(17),
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: InkWell(
            onTap: () async {
              // if (_isInCart) {
              //   await Fluttertoast.showToast(
              //     msg: "Item has been added to your cart",
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.CENTER,
              //   );
              // } else {
              //   await GlobalMethods.addToCart(
              //       productId: getCurrProduct.id,
              //       quantity: 1,
              //       context: context);
              //   await cartProvider.fetchCart();
              // }
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(7), vertical: getHeight(7)),
              height: getHeight(30),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                widget.snap['status'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: getFont(14),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//FoodProcessCard