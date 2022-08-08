class Review {
  final String imagePerson;
  final String name;
  final DateTime createAt;
  final String description;
  final double rating;

  Review({
    required this.imagePerson,
    required this.name,
    required this.createAt,
    required this.description,
    required this.rating,
  });
}

List<Review> listReview = [
  Review(
      imagePerson: 'assets/images/image_person_1.png',
      name: 'Dianne Russell',
      createAt: DateTime.parse('2022-08-08 20:18:04Z'),
      rating: 5,
      description:'This Is great, So delicious! You Must Here, With Your family . . '),
  Review(
      imagePerson: 'assets/images/image_person_2.png',
      name: 'Dianne Russell',
      createAt: DateTime.parse('2022-08-07 20:18:04Z'),
      rating: 4,
      description:'This Is great, So delicious! You Must Here, With Your family . . '),
  Review(
      imagePerson: 'assets/images/image_person_1.png',
      name: 'Dianne Russell',
      createAt: DateTime.parse('2022-08-08 20:18:04Z'),
      rating: 3.5,
      description:'This Is great, So delicious! You Must Here, With Your family . . '),
  Review(
      imagePerson: 'assets/images/image_person_2.png',
      name: 'Dianne Russell',
      createAt: DateTime.parse('2022-08-07 20:18:04Z'),
      rating: 5,
      description:'This Is great, So delicious! You Must Here, With Your family . . '),
  Review(
      imagePerson: 'assets/images/image_person_2.png',
      name: 'Dianne Russell',
      createAt: DateTime.parse('2022-08-09 20:18:04Z'),
      rating: 3,
      description:'This Is great, So delicious! You Must Here, With Your family . . '),
];
