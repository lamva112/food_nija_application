import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/foods_provider.dart';
import 'package:food_nija_application/app/common_widgets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/homescreen/widget/popular_menu.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:provider/provider.dart';

class HomeAllFoodScreen extends StatefulWidget {
  const HomeAllFoodScreen({Key? key}) : super(key: key);

  @override
  State<HomeAllFoodScreen> createState() => _HomeAllFoodScreenState();
}

class _HomeAllFoodScreenState extends State<HomeAllFoodScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  bool isSearching = false;
  @override
  void initState() {
    // final productsProvider = Provider.of<FoodsProvider>(context, listen: false);
    // productsProvider.fetchProducts();
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  List<Food> listProdcutSearch = [];

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    final foodsProvider = Provider.of<FoodsProvider>(context);
    List<Food> allProducts = foodsProvider.getfoods;

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
                        child: Icon(
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
                            controller: _searchTextController,
                            focusNode: _searchTextFocusNode,
                            decoration: InputDecoration(
                              hintText: Translations.of(context)
                                  .text('What do you want to order?'),
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: AppColors.iconButtonBack,
                              ),
                              fillColor: Colors.transparent,
                              border: InputBorder.none,
                              suffix: IconButton(
                                onPressed: () {
                                  _searchTextController.clear();
                                  _searchTextFocusNode.unfocus();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: _searchTextFocusNode.hasFocus
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ),
                            onChanged: (valuee) {
                              setState(() {
                                listProdcutSearch =
                                    foodsProvider.searchQuery(valuee);
                              });
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
                          child: Icon(
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
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: ChangeNotifierProvider.value(
                          value: _searchTextController.text.isNotEmpty
                              ? listProdcutSearch[index]
                              : allProducts[index],
                          child: PopularMenu(),
                        ),
                      );
                    },
                    separatorBuilder: (_, int i) =>
                        SizedBox(height: getHeight(20)),
                    itemCount: _searchTextController.text.isNotEmpty
                        ? listProdcutSearch.length
                        : allProducts.length,
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
