import 'package:food_nija_application/data/models/food.dart';

class Cart {
  final String userId;
  final String foodId;
  int quantity;
  final Food food;
  Cart({
    required this.userId,
    required this.foodId,
    this.quantity = 0,
    required this.food,
  });
}
List<Cart> listCart = [];