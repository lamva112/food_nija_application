import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/user_provider.dart';
import 'package:food_nija_application/app/common_widgets/food_process.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/order.dart';
import 'package:food_nija_application/data/models/order_detail.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
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
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('orders')
                    .where("userId", isEqualTo: userProvider.getUser.uid)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext _, int index) {
                      return FoodProcessCard(
                        snap: snapshot.data!.docs[index].data(),
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                    physics: const NeverScrollableScrollPhysics(),
                  );
                },
              ),
            ),
            SizedBox(height: getHeight(60)),
          ],
        ),
      ),
    );
  }
}
