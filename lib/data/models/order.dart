import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/data/models/order_detail.dart';

class OrderModel with ChangeNotifier {
  final String orderId,
      userId,
      productId,
      userName,
      price,
      imageUrl,
      quantity,
      status;
  final Timestamp orderDate;

  OrderModel(
      {required this.orderId,
      required this.userId,
      required this.productId,
      required this.userName,
      required this.price,
      required this.imageUrl,
      required this.quantity,
      required this.orderDate,
      required this.status});
}
