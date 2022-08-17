import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/foods_provider.dart';
import 'package:food_nija_application/app/change_notifies/wishlist_provider.dart';
import 'package:food_nija_application/app/core/utils/firebase_consts.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';

import 'package:provider/provider.dart';

import '../../../core/utils/global_methods.dart';

class HeartBTN extends StatefulWidget {
  const HeartBTN({Key? key, required this.productId, this.isInWishlist = false})
      : super(key: key);
  final String productId;
  final bool? isInWishlist;

  @override
  State<HeartBTN> createState() => _HeartBTNState();
}

class _HeartBTNState extends State<HeartBTN> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<FoodsProvider>(context);
    final getCurrProduct = productProvider.findProdById(widget.productId);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return MaterialButton(
      onPressed: () async {
        setState(() {
          loading = true;
        });
        try {
          final User? user = authInstance.currentUser;

          if (user == null) {
            GlobalMethods.errorDialog(
                subtitle: 'No user found, Please login first',
                context: context);
            return;
          }
          if (widget.isInWishlist == false && widget.isInWishlist != null) {
            await GlobalMethods.addToWishlist(
                productId: widget.productId, context: context);
          } else {
            await wishlistProvider.removeOneItem(
                wishlistId:
                    wishlistProvider.getWishlistItems[getCurrProduct.id]!.id,
                productId: widget.productId);
          }
          await wishlistProvider.fetchWishlist();
          setState(() {
            loading = false;
          });
        } catch (error) {
          GlobalMethods.errorDialog(subtitle: '$error', context: context);
        } finally {
          setState(() {
            loading = false;
          });
        }
        // print('user id is ${user.uid}');
        // wishlistProvider.addRemoveProductToWishlist(productId: productId);
      },
      color: const Color(0xffFBE8E3),
      padding: EdgeInsets.all(getWidth(10)),
      shape: const CircleBorder(),
      elevation: 0,
      child: loading
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 15, width: 15, child: CircularProgressIndicator()),
            )
          : Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFBE8E3),
              ),
              child: widget.isInWishlist != null && widget.isInWishlist == true
                  ? Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    )
                  : Icon(Icons.favorite_border),
            ),
    );
  }
}
