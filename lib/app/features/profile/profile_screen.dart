import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/user_provider.dart';
import 'package:food_nija_application/app/common_widgets/food_process.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/food.dart';
import 'package:food_nija_application/data/models/interest_food.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color? bgColor = AppColors.backgroundColor;

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: getHeight(400),
              pinned: true,
              forceElevated: true,
              backgroundColor: bgColor,
              elevation: 0.0,
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
                            userProvider.getUser.photoUrl,
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
                  Container(
                    height: getHeight(35),
                    width: getWidth(115),
                    margin: EdgeInsets.only(bottom: getHeight(20)),
                    decoration: BoxDecoration(
                      color: AppColors.priceTextColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Member Gold',
                        style: TextStyle(
                          color: AppColors.priceTextColor,
                          fontSize: getFont(14),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userProvider.getUser.firstName +
                            ' ' +
                            userProvider.getUser.lastName,
                        style: TextStyle(
                          fontSize: getFont(27),
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.drive_file_rename_outline,
                        color: AppColors.primaryColor,
                        size: getWidth(30),
                      ),
                    ],
                  ),
                  SizedBox(height: getHeight(5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userProvider.getUser.userEmail,
                        style: TextStyle(
                          fontSize: getFont(17),
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.grey,
                          size: getWidth(30),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getHeight(35)),
                  Card(
                    shadowColor: Colors.grey.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getHeight(10), horizontal: getWidth(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/image_voucher.png',
                            fit: BoxFit.cover,
                            width: getWidth(50),
                            height: getHeight(45),
                          ),
                          SizedBox(width: getWidth(20)),
                          Text(
                            'You Have 3 Voucher',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                              fontSize: getFont(18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  Text(
                    Translations.of(context).text('Favorite'),
                    style: TextStyle(
                      fontSize: getFont(18),
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      String id = listInterestFood[index].foodId;
                      return FoodProcessCard(
                        food: listFood.firstWhere((obj) => obj.id == id),
                        titleTrailing:
                            Translations.of(context).text('Buy Again'),
                        color: AppColors.primaryColor,
                      );
                    },
                    itemCount: listInterestFood.length,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  SizedBox(height: getHeight(90)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
