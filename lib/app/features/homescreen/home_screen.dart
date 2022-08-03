import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_wigets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/homescreen/widget/nearest_restaurant.dart';
import 'package:food_nija_application/app/features/homescreen/widget/popular_menu.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:food_nija_application/data/models/restaurant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundLoginColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: getHeight(325),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_app_short.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getHeight(20), horizontal: getWidth(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: getHeight(30)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Translations.of(context).text('Find Favorite Food'),
                        style: TextStyle(
                          fontSize: getFont(30),
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                      Container(
                        width: getWidth(45),
                        height: getHeight(45),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.backgroundColor,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 0,
                              ),
                            ]),
                        child: const Icon(
                          Icons.notifications,
                          color: AppColors.selectedNavBarColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: getWidth(270),
                        child: TextInputWidget(
                          hintText: Translations.of(context)
                              .text('What do you want to order?'),
                          prefixIcon: const Icon(
                            Icons.search_outlined,
                            color: AppColors.iconButtonBack,
                          ),
                          fillColor: AppColors.bgButtonBack,
                        ),
                      ),
                      Container(
                        width: getWidth(50),
                        height: getHeight(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.bgButtonBack,
                        ),
                        child: const Icon(
                          Icons.toc,
                          color: AppColors.iconButtonBack,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getHeight(20)),
                  Image.asset('assets/images/advertising.png'),
                  SizedBox(height: getHeight(10)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Translations.of(context).text('Nearest Restaurant'),
                        style: TextStyle(
                          fontSize: getFont(18),
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          Translations.of(context).text('View more'),
                          style: TextStyle(
                            fontSize: getFont(15),
                            fontWeight: FontWeight.w400,
                            color: AppColors.iconButtonBack,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getHeight(185),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return NearestRestaurant(restaurant: listRestaurant[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(width: getWidth(23)),
                      itemCount: listRestaurant.length,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Translations.of(context).text('Popular Menu'),
                        style: TextStyle(
                          fontSize: getFont(18),
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          Translations.of(context).text('View more'),
                          style: TextStyle(
                            fontSize: getFont(15),
                            fontWeight: FontWeight.w400,
                            color: AppColors.iconButtonBack,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return PopularMenu(food: listFood[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: getHeight(20)),
                    itemCount: listFood.length,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
