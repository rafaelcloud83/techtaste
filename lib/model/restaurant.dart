class Restaurant {
  String id;
  String name;
  String description;
  String imagePath;
  double stars;
  int distance;
  List<String> categories;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.stars,
    required this.distance,
    required this.categories,
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
    );
  }

  @override
  String toString() {
    return 'Restaurant{id: $id, name: $name, description: $description, imagePath: $imagePath, stars: $stars, distance: $distance, categories: $categories}';
  }
}
