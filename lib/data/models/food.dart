class Food {
  String id;
  String image;
  String name;
  String description;
  int price;
  Food({required this.id,required this.image, required this.name, required this.description, required this.price});
}

List<Food> listFood = [
  Food(id: '1', image: 'assets/images/image_popular_1.png', name: 'Rainbow Sandwich Sugarless', description: 'Noddle Home', price: 15),
  Food(id: '2',image: 'assets/images/image_popular_2.png', name: 'Green Noddle', description: 'Noddle Home', price: 15),
  Food(id: '3',image: 'assets/images/image_popular_1.png', name: 'Rainbow Sandwich Sugarless', description: 'Noddle Home', price: 15),
  Food(id: '4',image: 'assets/images/image_popular_2.png', name: 'Green Noddle', description: 'Noddle Home', price: 15),
  Food(id: '5',image: 'assets/images/image_popular_1.png', name: 'Rainbow Sandwich Sugarless', description: 'Noddle Home', price: 15),
];