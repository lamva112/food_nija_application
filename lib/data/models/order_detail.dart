import 'package:food_nija_application/data/models/food.dart';
enum StatusType {arriving , completed}

class OrderDetails{
  final String orderId;
  final int quantity;
  final String foodId;
  final Food food;
  final StatusType status;
  const OrderDetails({
    required this.orderId,
    required this.quantity,
    required this.foodId,
    required this.food,
    required this.status,
});
}