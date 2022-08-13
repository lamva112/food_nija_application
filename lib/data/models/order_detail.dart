import 'package:food_nija_application/data/models/food.dart';

class OrderDetails{
  final int quantity;
  final String foodId;
  final Food food;
  const OrderDetails({
    required this.quantity,
    required this.foodId,
    required this.food,
});
}