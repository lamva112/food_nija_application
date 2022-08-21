import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/foods_provider.dart';
import 'package:food_nija_application/app/common_widgets/rating_bar_custom.dart';
import 'package:food_nija_application/app/common_widgets/review_widget.dart';
import 'package:food_nija_application/app/core/utils/loading_widget.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/info_restaurant/widget/popular_menu.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:food_nija_application/data/models/review.dart';
import 'package:provider/provider.dart';

class InfoRestaurantScreen extends StatefulWidget {
  const InfoRestaurantScreen({Key? key}) : super(key: key);

  @override
  State<InfoRestaurantScreen> createState() => _InfoRestaurantScreenState();
}

class _InfoRestaurantScreenState extends State<InfoRestaurantScreen> {
  Color? bgColor = AppColors.backgroundColor;
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    final foodsProviders = Provider.of<FoodsProvider>(context);
    List<Food> allProducts = foodsProviders.getfoods;
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
                          Image.asset(
                            'assets/images/image_res_1.png',
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
                    "Hu tieu",
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
                              '19 Km',
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
                              '3.5 Rating',
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
                    "test",
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
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('restaurants')
                          .orderBy("time", descending: false)
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const LoadingWidget();
                        }
                        return ListView.separated(
                          padding: EdgeInsets.only(bottom: getHeight(5)),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                //Ấn vô chuyển sang info food
                              },
                              child: PopularMenuRestaurant(
                                snap: snapshot.data!.docs[index].data(),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(width: getWidth(15)),
                          itemCount: snapshot.data!.docs.length,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  Text(
                    Translations.of(context).text('Reviews'),
                    style: TextStyle(
                      fontSize: getFont(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      //Đổi lại thành reivew restaurant nha
                      return ReviewWidget(snap: listReview[index]);
                    },
                    separatorBuilder: (_, int i) =>
                        SizedBox(height: getHeight(10)),
                    itemCount: listReview.length,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
