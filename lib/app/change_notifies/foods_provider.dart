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

  List<Food> searchQuery(String searchText) {
    List<Food> _searchList = _foodsList
        .where(
          (element) => element.name.toLowerCase().contains(
                searchText.toLowerCase(),
              ),
        )
        .toList();
    return _searchList;
  }

  List<Food> searchQueryFoods(List<Food> foodsList, String searchText) {
    List<Food> _searchList = foodsList
        .where(
          (element) => element.name.toLowerCase().contains(
                searchText.toLowerCase(),
              ),
        )
        .toList();
    return _searchList;
  }

  List<Food> searchFoodByResId(String resId) {
    List<Food> _searchList =
        _foodsList.where((element) => element.resId == resId).toList();
    return _searchList;
  }
}
