import 'package:finder/provider/bachelor_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:finder/widgets/bachelor_widget.dart';
import 'package:finder/services/bachelor_service.dart';

import 'bachelor_liked.dart';
import 'models/bachelor_model.dart';
import 'tools/tools.dart';

class BachelorList extends StatefulWidget {
  BachelorList({super.key});

  List<Bachelor> bachelorList = BachelorService().generateBachelors();

  @override
  BachelorListState createState() => BachelorListState();
}

class BachelorListState extends State<BachelorList> {
  List<Bachelor> likedBachelors = [];

  void navigateToLikedList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BachelorLiked()),
    );
  }

  void goToFavorites() {
    context.go('/favorites');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("BachelorList"),
        actions: <Widget>[
          IconButton(
              onPressed: goToFavorites,
              icon: const Icon(
                Icons.star,
                color: Colors.yellowAccent,
              ))
        ],
      ),
      body: ListView(
        children: BachelorProvider().bachelors.map((Bachelor bachelor) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 2.5),
            child: BachelorWidget(
              bachelor: bachelor,
              likedBachelors: BachelorProvider().likedBachelors,
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToLikedList,
        tooltip: 'Liked lists',
        child: const Icon(Icons.favorite_sharp),
      ),
    );
  }
}
