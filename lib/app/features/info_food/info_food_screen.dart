import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_wigets/rating_bar_custom.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';

class InfoFoodScreen extends StatefulWidget {
  const InfoFoodScreen({Key? key}) : super(key: key);

  @override
  State<InfoFoodScreen> createState() => _InfoFoodScreenState();
}

class _InfoFoodScreenState extends State<InfoFoodScreen> {
  Color? bgColor = AppColors.backgroundColor;
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
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
                onPressed: () {},
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
                            'assets/images/bg_info_food.png',
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
              padding: EdgeInsets.only(left: getWidth(30)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: getWidth(220),
                        child: Text(
                          'Rainbow Sandwich Sugarless',
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
                  SizedBox(height: getHeight(10)),
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
                      )
                    ],
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
