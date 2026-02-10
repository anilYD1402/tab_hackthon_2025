import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late List<Map<String, dynamic>> favorites;

  @override
  void initState() {
    super.initState();
    favorites = [
      {
        'id': 1,
        'name': 'Pizza Palace',
        'cuisine': 'Italian',
        'rating': 4.8,
        'image': '🍕',
        'location': '123 Main St',
        'deliveryTime': '20-30 min',
        'deliveryFee': '\$2.99',
      },
      {
        'id': 2,
        'name': 'Sushi Supreme',
        'cuisine': 'Japanese',
        'rating': 4.9,
        'image': '🍣',
        'location': '456 Oak Ave',
        'deliveryTime': '25-35 min',
        'deliveryFee': '\$3.99',
      },
      {
        'id': 3,
        'name': 'Curry House',
        'cuisine': 'Indian',
        'rating': 4.7,
        'image': '🍛',
        'location': '789 Spice Ln',
        'deliveryTime': '30-40 min',
        'deliveryFee': '\$2.49',
      },
    ];
  }

  void _removeFavorite(int index) {
    setState(() {
      favorites.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Removed from favorites'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // In real app, would restore the item
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        centerTitle: true,
        elevation: 0,
      ),
      body:
          favorites.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_outline,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No favorites yet',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Add restaurants to your favorites for quick access',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return _buildFavoriteCard(favorites[index], index);
                },
              ),
    );
  }

  Widget _buildFavoriteCard(Map<String, dynamic> favorite, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              favorite['image'],
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              favorite['name'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              favorite['cuisine'],
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  favorite['rating'].toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => _removeFavorite(index),
              child: Icon(Icons.favorite, color: Colors.red, size: 20),
            ),
          ],
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening ${favorite['name']}')),
          );
        },
      ),
    );
  }
}
