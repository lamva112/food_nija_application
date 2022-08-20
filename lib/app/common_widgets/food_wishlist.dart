import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_nija_application/app/change_notifies/cart_provider.dart';
import 'package:food_nija_application/app/change_notifies/foods_provider.dart';
import 'package:food_nija_application/app/change_notifies/wishlist_provider.dart';
import 'package:food_nija_application/app/core/utils/global_methods.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/wishlist_model.dart';
import 'package:provider/provider.dart';

class WishListCard extends StatefulWidget {
  const WishListCard({
    Key? key,
  }) : super(key: key);

  @override
  State<WishListCard> createState() => _WishListCardState();
}

class _WishListCardState extends State<WishListCard> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<FoodsProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistModel = Provider.of<WishlistModel>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final getCurrProduct =
        productProvider.findProdById(wishlistModel.productId);
    bool? _isInCart = cartProvider.getCartItems.containsKey(getCurrProduct.id);
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
          trailing: InkWell(
            onTap: () async {
              if (_isInCart) {
                await Fluttertoast.showToast(
                  msg: "Item has been added to your cart",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              } else {
                await GlobalMethods.addToCart(
                    productId: getCurrProduct.id,
                    quantity: 1,
                    context: context);
                await cartProvider.fetchCart();
              }
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
                'Buy Again',
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
