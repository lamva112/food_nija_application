import 'package:food_nija_application/data/models/order_detail.dart';
enum StatusType {arriving , completed}
class Order{
  final String id;
  final int totalPrice;
  final List<OrderDetails>? listOrderDetails;
  final StatusType status;
  final DateTime? createAt;
  Order({
    this.id = '',
    this.totalPrice = 0,
    List<OrderDetails>? listOrderDetails,
    this.status = StatusType.arriving,
    this.createAt,
  }) : listOrderDetails = listOrderDetails ?? [];
}
List<Order> listOrder = [
  Order(id: '1', totalPrice: 130),
  Order(id: '1', totalPrice: 130, status: StatusType.completed),
];