class TypeFood {
  String name;
  bool isChecked;
  TypeFood({
    required this.name,
    this.isChecked = false,
});
}

List<TypeFood> listTypeFood = [
  TypeFood(name: 'Cake'),
  TypeFood(name: 'Soup'),
  TypeFood(name: 'Main Course'),
  TypeFood(name: 'Appetizer'),
  TypeFood(name: 'Dessert'),
];