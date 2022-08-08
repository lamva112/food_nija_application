class Restaurant {
  String image;
  String resName;
  int time;

  Restaurant({
    required this.image,
    required this.resName,
    required this.time,
  });
}

List<Restaurant> listRestaurant = [
  Restaurant(image: 'assets/images/image_res_1.png', resName: 'Vegan Resto', time: 12),
  Restaurant(image: 'assets/images/image_res_1.png', resName: 'Vegan Resto', time: 12),
  Restaurant(image: 'assets/images/image_res_1.png', resName: 'Vegan Resto', time: 12),
  Restaurant(image: 'assets/images/image_res_1.png', resName: 'Vegan Resto', time: 12),
  Restaurant(image: 'assets/images/image_res_1.png', resName: 'Vegan Resto', time: 12),
];