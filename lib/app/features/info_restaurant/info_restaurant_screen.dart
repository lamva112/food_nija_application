import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/foods_provider.dart';
import 'package:food_nija_application/app/common_widgets/rating_bar_custom.dart';
import 'package:food_nija_application/app/common_widgets/review_res_widget.dart';
import 'package:food_nija_application/app/common_widgets/review_widget.dart';
import 'package:food_nija_application/app/core/utils/loading_widget.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/info_restaurant/widget/popular_menu.dart';
import 'package:food_nija_application/app/features/info_restaurant/widget/post_review_restaurans_screen.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:food_nija_application/data/models/review.dart';
import 'package:provider/provider.dart';

class InfoRestaurantScreen extends StatefulWidget {
  final snap;
  const InfoRestaurantScreen({Key? key, required this.snap}) : super(key: key);

  @override
  State<InfoRestaurantScreen> createState() => _InfoRestaurantScreenState();
}

class _InfoRestaurantScreenState extends State<InfoRestaurantScreen> {
  Color? bgColor = AppColors.backgroundColor;
  bool isFavourite = false;
  double total = 0;
  List<double> ratingList = [];
  double everage_rating = 0;
  @override
  void initState() {
    getRating(widget.snap["id"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final foodsProviders = Provider.of<FoodsProvider>(context);
    List<Food> allProducts =
        foodsProviders.searchFoodByResId(widget.snap['id']);
    ratingList.forEach((num e) {
      total += e;
    });
    ratingList.length == 0
        ? everage_rating = 0
        : everage_rating = total / ratingList.length;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: getHeight(300),
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
                            widget.snap['imageUrl'],
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
              )),
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
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(15), vertical: getHeight(10)),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                          child: Text(
                            Translations.of(context).text('Popular'),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                              fontSize: getFont(15),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                          // listInterestFood.add(InterestFood(foodId: widget.food.id));
                        },
                        color: const Color(0xffFBE8E3),
                        padding: EdgeInsets.all(getWidth(10)),
                        shape: const CircleBorder(),
                        elevation: 0,
                        child: isFavourite
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              )
                            : const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  SizedBox(height: getHeight(10)),
                  Text(
                    widget.snap['resName'],
                    style: TextStyle(
                      fontSize: getFont(27),
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: AppColors.primaryColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: getWidth(5)),
                            child: Text(
                              widget.snap['km'] + 'Km',
                              style: TextStyle(
                                fontSize: getFont(18),
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: getWidth(15)),
                      Row(
                        children: [
                          RatingBar.readOnly(
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            halfFilledIcon: Icons.star_half,
                            filledColor: AppColors.primaryColor,
                            initialRating: 0.5,
                            isHalfAllowed: true,
                            size: 20,
                            maxRating: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: getWidth(10)),
                            child: Text(
                              "${everage_rating.toStringAsPrecision(3)} Rating",
                              style: TextStyle(
                                fontSize: getFont(18),
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: getHeight(20)),
                  Text(
                    widget.snap['des'],
                    style: TextStyle(
                      fontSize: getFont(15),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: getHeight(15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Translations.of(context).text('Popular Menu'),
                        style: TextStyle(
                          fontSize: getFont(20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print(allProducts.length);
                        },
                        child: Text(
                          Translations.of(context).text('View more'),
                          style: TextStyle(
                            color: AppColors.priceTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: getFont(16),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getHeight(15)),
                  SizedBox(
                    height: getHeight(185),
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: getHeight(5)),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            //Ấn vô chuyển sang info food
                          },
                          child: ChangeNotifierProvider.value(
                            value: allProducts[index],
                            child: PopularMenuRestaurant(),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(width: getWidth(15)),
                      itemCount: allProducts.length,
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
                              builder: (_) => PostReviewRestaurantScreen(
                                resId: widget.snap['id'],
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
                        .collection('restaurants')
                        .doc(widget.snap['id'])
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
                          return ReviewResWidget(
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
    );
  }

  Future getRating(String foodId) async {
    ratingList = [];
    await FirebaseFirestore.instance
        .collection('restaurants')
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
}
