import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_wigets/custom_button.dart';
import 'package:food_nija_application/app/common_wigets/filter_chip_custom.dart';
import 'package:food_nija_application/app/common_wigets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/type_food.dart';

class FilterScreen extends StatefulWidget {
  final Function(bool, String) onSelected;
  const FilterScreen({Key? key, required this.onSelected}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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
                  SizedBox(
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
                  SizedBox(height: getHeight(15)),
                  Text(
                    Translations.of(context).text('Type'),
                    style: TextStyle(
                      fontSize: getFont(18),
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  Wrap(
                    spacing: getWidth(10),
                    runSpacing: getHeight(20),
                    children: listTypeFood.map((e) {
                      return FilterChipCustom(
                        onSelected: widget.onSelected,
                        title: e.name,
                        bgColor: AppColors.bgButtonBack,
                        textColor: AppColors.iconButtonBack,
                        isChecked: e.isChecked,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: getHeight(15)),
                  Text(
                    Translations.of(context).text('Location'),
                    style: TextStyle(
                      fontSize: getFont(18),
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  Wrap(
                    spacing: getWidth(10),
                    runSpacing: getHeight(20),
                    children: listTypeFood.map((e) {
                      return FilterChipCustom(
                        onSelected: widget.onSelected,
                        title: e.name,
                        bgColor: AppColors.bgButtonBack,
                        textColor: AppColors.iconButtonBack,
                        isChecked: e.isChecked,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: getHeight(15)),
                  Text(
                    Translations.of(context).text('Food'),
                    style: TextStyle(
                      fontSize: getFont(18),
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  Wrap(
                    spacing: getWidth(10),
                    runSpacing: getHeight(20),
                    children: listTypeFood.map((e) {
                      return FilterChipCustom(
                        onSelected: widget.onSelected,
                        title: e.name,
                        bgColor: AppColors.bgButtonBack,
                        textColor: AppColors.iconButtonBack,
                        isChecked: e.isChecked,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: getHeight(80)),
                  CustomButton(
                    title: Translations.of(context).text('Search'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    width: getWidth(500),
                    height: getHeight(57),
                    backgroundColor: AppColors.primaryColor,
                    fontSize: getFont(20),
                    textColor: AppColors.textButtonColor,
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