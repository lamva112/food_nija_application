import 'package:flutter/material.dart';
import 'package:food_nija_application/app/common_widgets/food_process.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/data/models/order.dart';
import 'package:food_nija_application/data/models/order_detail.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<OrderDetails> listOrderFood = [];
    for (var obj in listOrder) {
      listOrderFood.addAll(obj.listOrderDetails!);
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(20), vertical: getHeight(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: getHeight(10)),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext _, int index) {
                  return FoodProcessCard(
                    food: listOrderFood[index].food,
                    titleTrailing:
                        listOrderFood[index].status == StatusType.arriving
                            ? Translations.of(context).text('Arriving')
                            : Translations.of(context).text('Completed'),
                  );
                },
                itemCount: listOrderFood.length,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            SizedBox(height: getHeight(60)),
          ],
        ),
      ),
    );
  }
}
