import 'package:techtaste/model/dish.dart';

class Restaurant {
  String id;
  String name;
  String description;
  String imagePath;
  double stars;
  int distance;
  List<String> categories;
  List<Dish> dishes;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.stars,
    required this.distance,
    required this.categories,
    required this.dishes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'stars': stars,
      'distance': distance,
      'categories': categories,
      'dishes': dishes.map((dish) => dish.toMap()).toList(),
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      imagePath: map['imagePath'],
      stars: map['stars'],
      distance: map['distance'],
      categories: List<String>.from(map['categories']),
      dishes: List<Dish>.from(map['dishes'].map((dish) => Dish.fromMap(dish))),
    );
  }

  @override
  String toString() {
    return 'Restaurant{id: $id, name: $name, description: $description, imagePath: $imagePath, stars: $stars, distance: $distance, categories: $categories}';
  }
}
