import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_widgets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/loading_widget.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/homescreen/widget/nearest_restaurant.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/models/restaurant.dart';

class HomeAllRestaurantScreen extends StatefulWidget {
  const HomeAllRestaurantScreen({Key? key}) : super(key: key);

  @override
  State<HomeAllRestaurantScreen> createState() =>
      _HomeAllRestaurantScreenState();
}

class _HomeAllRestaurantScreenState extends State<HomeAllRestaurantScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isSearching = false;
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        ),
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
                      Container(
                        width: getWidth(270),
                        height: getHeight(50),
                        decoration: BoxDecoration(
                          color: AppColors.bgButtonBack,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: Translations.of(context)
                                  .text('What do you want to order?'),
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: AppColors.iconButtonBack,
                              ),
                              fillColor: Colors.transparent,
                              border: InputBorder.none,
                            ),
                            onFieldSubmitted: (String _) {
                              setState(() {
                                isSearching = true;
                              });
                              print(_);
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteManager.filterScreen,
                          );
                        },
                        child: Container(
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
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getHeight(15)),
                  Text(
                    Translations.of(context).text('Popular Restaurant'),
                    style: TextStyle(
                      fontSize: getFont(18),
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  isSearching
                      ? FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('restaurants')
                              .where(
                                'resName',
                                isGreaterThanOrEqualTo: searchController.text,
                              )
                              .get(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: getHeight(20),
                              crossAxisSpacing: getWidth(20),
                              shrinkWrap: true,
                              children: List.generate(
                                (snapshot.data! as dynamic).docs.length,
                                (index) => NearestRestaurant(
                                  snap: (snapshot.data! as dynamic).docs[index],
                                ),
                              ),
                            );
                          },
                        )
                      : StreamBuilder(
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
                            return GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: getHeight(20),
                              crossAxisSpacing: getWidth(20),
                              shrinkWrap: true,
                              children: List.generate(
                                snapshot.data!.docs.length,
                                (index) => NearestRestaurant(
                                  snap: snapshot.data!.docs[index].data(),
                                ),
                              ),
                            );
                          },
                        ),
                  SizedBox(height: getHeight(80)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
