import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_widgets/custom_button.dart';
import 'package:food_nija_application/app/common_widgets/rating_bar_custom.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/core/values/strings.dart';
import 'package:food_nija_application/app/features/info_food/widget/review_food.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:food_nija_application/data/models/order.dart';
import 'package:food_nija_application/data/models/order_detail.dart';
import 'package:food_nija_application/data/models/review.dart';

class InfoFoodScreen extends StatefulWidget {
  final Food food;
  const InfoFoodScreen({Key? key, required this.food}) : super(key: key);

  @override
  State<InfoFoodScreen> createState() => _InfoFoodScreenState();
}

class _InfoFoodScreenState extends State<InfoFoodScreen> {
  Color? bgColor = AppColors.backgroundColor;
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
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
                icon: const Icon(
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
                            widget.food.image,
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
                      SizedBox(
                        width: getWidth(220),
                        child: Text(
                          widget.food.name,
                          style: TextStyle(
                            fontSize: getFont(27),
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
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
                  SizedBox(height: getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const RatingBar.readOnly(
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            halfFilledIcon: Icons.star_half,
                            filledColor: AppColors.primaryColor,
                            initialRating: 3.5,
                            isHalfAllowed: true,
                            size: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: getWidth(10)),
                            child: Text(
                              '3.5',
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
                          const Icon(
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
                    test,
                    style: TextStyle(
                      fontSize: getFont(15),
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
                      return ReviewFood(review: listReview[index]);
                    },
                    separatorBuilder: (_, int i) =>
                        SizedBox(height: getHeight(10)),
                    itemCount: listReview.length,
                  ),
                  SizedBox(height: getHeight(80)),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: CustomButton(
        title: Translations.of(context).text('Add To Cart'),
        onPressed: () {
          order.listOrderDetails?.add(OrderDetails(
              id: '1',
              image: widget.food.image,
              name: widget.food.name,
              description: widget.food.description,
              quantity: 1,
              price: widget.food.price));
          Navigator.pop(context);
        },
        height: getHeight(55),
        width: getWidth(340),
        backgroundColor: AppColors.primaryColor,
        fontSize: getFont(20),
        textColor: AppColors.textButtonColor,
      ),
    );
  }
}
