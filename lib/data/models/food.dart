import 'package:flutter/material.dart';

class Food with ChangeNotifier {
  String id;
  String resId;
  String imageURL;
  String name;
  String resName;
  String description;
  double price;
  String cat;
  Food(
      {required this.id,
      required this.imageURL,
      required this.name,
      required this.description,
      required this.price,
      required this.resId,
      required this.resName,
      required this.cat});
}

List<Food> listFood = [
  // Food(
  //     id: '1',
  //     image: 'assets/images/image_popular_1.png',
  //     name: 'Rainbow Sandwich Sugarless',
  //     description: 'Noddle Home',
  //     price: 15),
  // Food(
  //     id: '2',
  //     image: 'assets/images/image_popular_2.png',
  //     name: 'Green Noddle',
  //     description: 'Noddle Home',
  //     price: 15),
  // Food(
  //     id: '3',
  //     image: 'assets/images/image_popular_1.png',
  //     name: 'Rainbow Sandwich Sugarless',
  //     description: 'Noddle Home',
  //     price: 15),
  // Food(
  //     id: '4',
  //     image: 'assets/images/image_popular_2.png',
  //     name: 'Green Noddle',
  //     description: 'Noddle Home',
  //     price: 15),
  // Food(
  //     id: '5',
  //     image: 'assets/images/image_popular_1.png',
  //     name: 'Rainbow Sandwich Sugarless',
  //     description: 'Noddle Home',
  //     price: 15),
];
