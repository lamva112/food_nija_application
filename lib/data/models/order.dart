import 'package:food_nija_application/data/models/order_detail.dart';
class Order{
  final String id;
  final int totalPrice;
  List<OrderDetails>? listOrderDetails;
  final DateTime? createAt;
  Order({
    this.id = '',
    this.totalPrice = 0,
    List<OrderDetails>? listOrderDetails,
    this.createAt,
  }) : listOrderDetails = listOrderDetails ?? [];
}
List<Order> listOrder = [
  Order(id: '1', totalPrice: 120),
  Order(id: '2', totalPrice: 150),
];