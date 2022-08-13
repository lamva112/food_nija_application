import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/data/models/food.dart';

class FoodsProvider with ChangeNotifier {
  static final List<Food> _foodsList = [];
  List<Food> get getfoods {
    return _foodsList;
  }

  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance
        .collection('foods')
        .get()
        .then((QuerySnapshot productSnapshot) {
      productSnapshot.docs.forEach((element) {
        _foodsList.insert(
          0,
          Food(
            id: element.get('id') ?? '',
            resId: element.get('resId') ?? '',
            name: element.get('foodName') ?? '',
            resName: element.get('resName') ?? '',
            imageURL: element.get('imageUrl') ?? '',
            cat: element.get('cat') ?? '',
            price: double.parse(
              element.get('price') ?? 0,
            ),
            description: element.get('des') ?? '',
          ),
        );
      });
    });
    notifyListeners();
  }

  Food findProdById(String productId) {
    return _foodsList.firstWhere((element) => element.id == productId);
  }

  // List<Food> findByCategory(String categoryName) {
  //   List<Food> _categoryList = _foodsList
  //       .where((element) => element.productCategoryName
  //           .toLowerCase()
  //           .contains(categoryName.toLowerCase()))
  //       .toList();
  //   return _categoryList;
  // }

  // List<ProductModel> searchQuery(String searchText) {
  //   List<ProductModel> _searchList = _productsList
  //       .where(
  //         (element) => element.title.toLowerCase().contains(
  //               searchText.toLowerCase(),
  //             ),
  //       )
  //       .toList();
  //   return _searchList;
  // }

}
