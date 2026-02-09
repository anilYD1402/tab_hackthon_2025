class Restaurant {
  final int id;
  final String name;
  final String cuisine;
  final double rating;
  final String imageUrl;
  final String location;
  final int deliveryTime;
  final String deliveryFee;

  Restaurant({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.imageUrl,
    required this.location,
    required this.deliveryTime,
    required this.deliveryFee,
  });
}

class DummyRestaurants {
  static List<Restaurant> getRestaurants() {
    return [
      Restaurant(
        id: 1,
        name: 'Pizza Palace',
        cuisine: 'Italian',
        rating: 4.5,
        imageUrl:
            'https://via.placeholder.com/200/FF6B6B/FFFFFF?text=Pizza+Palace',
        location: '123 Main St',
        deliveryTime: 30,
        deliveryFee: '\$2.99',
      ),
      Restaurant(
        id: 2,
        name: 'Burger Haven',
        cuisine: 'American',
        rating: 4.3,
        imageUrl:
            'https://via.placeholder.com/200/4ECDC4/FFFFFF?text=Burger+Haven',
        location: '456 Oak Ave',
        deliveryTime: 25,
        deliveryFee: '\$1.99',
      ),
      Restaurant(
        id: 3,
        name: 'Sushi Supreme',
        cuisine: 'Japanese',
        rating: 4.8,
        imageUrl:
            'https://via.placeholder.com/200/95E1D3/FFFFFF?text=Sushi+Supreme',
        location: '789 Elm Rd',
        deliveryTime: 35,
        deliveryFee: '\$3.99',
      ),
      Restaurant(
        id: 4,
        name: 'Taco Fiesta',
        cuisine: 'Mexican',
        rating: 4.2,
        imageUrl:
            'https://via.placeholder.com/200/F38181/FFFFFF?text=Taco+Fiesta',
        location: '321 Pine St',
        deliveryTime: 20,
        deliveryFee: '\$1.99',
      ),
      Restaurant(
        id: 5,
        name: 'Curry House',
        cuisine: 'Indian',
        rating: 4.6,
        imageUrl:
            'https://via.placeholder.com/200/AA96DA/FFFFFF?text=Curry+House',
        location: '654 Maple Ln',
        deliveryTime: 40,
        deliveryFee: '\$2.99',
      ),
      Restaurant(
        id: 6,
        name: 'Pasta Perfetto',
        cuisine: 'Italian',
        rating: 4.4,
        imageUrl:
            'https://via.placeholder.com/200/FCBAD3/FFFFFF?text=Pasta+Perfetto',
        location: '987 Cedar Dr',
        deliveryTime: 28,
        deliveryFee: '\$2.50',
      ),
      Restaurant(
        id: 7,
        name: 'Chicken Wings Co',
        cuisine: 'American',
        rating: 4.1,
        imageUrl:
            'https://via.placeholder.com/200/A7DE80/FFFFFF?text=Chicken+Wings',
        location: '147 Birch Way',
        deliveryTime: 22,
        deliveryFee: '\$1.50',
      ),
      Restaurant(
        id: 8,
        name: 'Dragon China',
        cuisine: 'Chinese',
        rating: 4.5,
        imageUrl:
            'https://via.placeholder.com/200/FFD93D/FFFFFF?text=Dragon+China',
        location: '258 Spruce St',
        deliveryTime: 32,
        deliveryFee: '\$2.49',
      ),
    ];
  }
}
