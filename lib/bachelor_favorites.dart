import 'package:finder/provider/bachelor_provider.dart';
import 'package:finder/widgets/bachelor_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/bachelor_model.dart';

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
      body: Consumer<BachelorProvider>(builder: (context, bachelorProvider, _) {
        return Stack(
          children: [
            ListView(
              children:
                  bachelorProvider.likedBachelors.map((Bachelor bachelor) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 2.5),
                  child: BachelorWidget(
                    bachelor: bachelor,
                    likedBachelors: bachelorProvider.likedBachelors,
                  ),
                );
              }).toList(),
            ),
          ],
        );
      }),
    );
  }
}
