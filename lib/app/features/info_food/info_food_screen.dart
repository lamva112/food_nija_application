import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_nija_application/app/change_notifies/cart_provider.dart';
import 'package:food_nija_application/app/change_notifies/foods_provider.dart';
import 'package:food_nija_application/app/change_notifies/user_provider.dart';
import 'package:food_nija_application/app/change_notifies/wishlist_provider.dart';
import 'package:food_nija_application/app/common_widgets/custom_button.dart';
import 'package:food_nija_application/app/common_widgets/rating_bar_custom.dart';
import 'package:food_nija_application/app/common_widgets/review_widget.dart';
import 'package:food_nija_application/app/core/utils/global_methods.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/core/values/strings.dart';
import 'package:food_nija_application/app/features/info_food/post_cmt_screen.dart';
import 'package:food_nija_application/app/features/info_food/widget/heart_btn.dart';
import 'package:food_nija_application/data/models/review.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class InfoFoodScreen extends StatefulWidget {
  final String foodId;
  const InfoFoodScreen({
    Key? key,
    required this.foodId,
  }) : super(key: key);

  @override
  State<InfoFoodScreen> createState() => _InfoFoodScreenState();
}

class _InfoFoodScreenState extends State<InfoFoodScreen> {
  Color? bgColor = AppColors.backgroundColor;
  bool isFavourite = false;
  double total = 0;
  List<double> ratingList = [];
  double everage_rating = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DateTime date = DateTime.now();
  @override
  void initState() {
    getRating(widget.foodId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final foodsProvider = Provider.of<FoodsProvider>(context);
    final getCurrFoods = foodsProvider.findProdById(widget.foodId);
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    bool? _isInCart = cartProvider.getCartItems.containsKey(widget.foodId);
    bool? _isInWishlist =
        wishlistProvider.getWishlistItems.containsKey(widget.foodId);
    ratingList.forEach((num e) {
      total += e;
    });
    ratingList.length == 0
        ? everage_rating = 0
        : everage_rating = total / ratingList.length;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: getHeight(400),
            pinned: true,
            forceElevated: true,
            backgroundColor: bgColor,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.itemChildColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double top = constraints.biggest.height;
                Future.delayed(
                    Duration.zero,
                    () => {
                          if (top <= 80.0)
                            {
                              setState(() {
                                bgColor = null;
                              })
                            }
                        });
                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  background: Container(
                    color: Colors.white,
                    child: Stack(
                      fit: StackFit.expand, // expand stack
                      children: [
                        Image.network(
                          getCurrFoods.imageURL,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: -1,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 30,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: getWidth(25), right: getWidth(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: getWidth(220),
                        child: Text(
                          getCurrFoods.name,
                          style: TextStyle(
                            fontSize: getFont(27),
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      HeartBTN(
                        productId: widget.foodId,
                        isInWishlist: _isInWishlist,
                      ),
                    ],
                  ),
                  SizedBox(height: getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          RatingBar.readOnly(
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            halfFilledIcon: Icons.star_half,
                            filledColor: AppColors.primaryColor,
                            initialRating: everage_rating,
                            isHalfAllowed: true,
                            size: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: getWidth(10)),
                            child: Text(
                              "${everage_rating.toStringAsPrecision(3)}",
                              style: TextStyle(
                                fontSize: getFont(18),
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: AppColors.primaryColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: getWidth(5)),
                            child: Text(
                              '1000 Orders',
                              style: TextStyle(
                                fontSize: getFont(18),
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: getHeight(20)),
                  Text(
                    getCurrFoods.description,
                    style: TextStyle(
                      fontSize: getFont(15),
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  Row(
                    children: [
                      Text(
                        Translations.of(context).text('Reviews'),
                        style: TextStyle(
                          fontSize: getFont(20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PostCmtScreen(
                                foodId: widget.foodId,
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.add_comment,
                          color: AppColors.primaryColor,
                          size: getWidth(20),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getHeight(15)),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('foods')
                        .doc(widget.foodId)
                        .collection('reviews')
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ReviewWidget(
                            snap: snapshot.data!.docs[index].data(),
                          );
                        },
                        separatorBuilder: (_, int i) =>
                            SizedBox(height: getHeight(10)),
                        itemCount: snapshot.data!.docs.length,
                      );
                    },
                  ),
                  SizedBox(height: getHeight(80)),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: CustomButton(
        title: _isInCart ? 'In cart' : 'Add to cart',
        onPressed: () async {
          if (_isInCart) {
            await Fluttertoast.showToast(
              msg: "Item has been added to your cart",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
            );
          } else {
            await GlobalMethods.addToCart(
                productId: widget.foodId, quantity: 1, context: context);
            await cartProvider.fetchCart();
            _Addnotification(
                userId: userProvider.getUser.uid,
                foodPic: getCurrFoods.imageURL,
                foodName: getCurrFoods.name);
            Navigator.pop(context);
          }
        },
        height: getHeight(55),
        width: getWidth(340),
        backgroundColor: AppColors.primaryColor,
        fontSize: getFont(20),
        textColor: Colors.white,
      ),
    );
  }

  Future getRating(String foodId) async {
    ratingList = [];
    await FirebaseFirestore.instance
        .collection('foods')
        .doc(foodId)
        .collection('reviews')
        .get()
        .then((QuerySnapshot productSnapshot) {
      productSnapshot.docs.forEach((element) {
        ratingList.add(element.get('rating'));
      });
    });
    setState(() {});
  }

  Future<void> _Addnotification({
    required String userId,
    required String foodPic,
    required String foodName,
  }) async {
    try {
      String NotificationId = const Uuid().v1();
      _firestore
          .collection('users')
          .doc(userId)
          .collection('noti')
          .doc(NotificationId)
          .set({
        'profilePic': foodPic,
        'userId': userId,
        'title': "${foodName} has been add to cart",
        "time": FieldValue.serverTimestamp(),
        "lasttime": DateFormat('hh:mm a').format(DateTime.now()),
        'date': DateFormat('yMMMMd').format(date),
      });
    } catch (error) {
      GlobalMethods.errorDialog(subtitle: '$error', context: context);
    } finally {}
  }
}
