import 'package:flutter/material.dart';

class BachelorFavorites extends StatefulWidget {
  const BachelorFavorites({super.key});

  @override
  BachelorFavoritesState createState() => BachelorFavoritesState();
}

class BachelorFavoritesState extends State<BachelorFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Favorites"),
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}
