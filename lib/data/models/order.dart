import 'package:food_nija_application/data/models/order_detail.dart';

class Order{
  final int totalPrice;
  final List<OrderDetails>? listOrderDetails;
  Order({
    this.totalPrice = 0,
    List<OrderDetails>? oD,
  }) : listOrderDetails = oD ?? [];
}

Order order = Order();