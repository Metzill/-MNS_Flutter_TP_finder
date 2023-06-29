import 'package:flutter/material.dart';
import 'package:finder/widgets/bachelor_widget.dart';
import 'package:finder/services/bachelor_service.dart';

import 'bachelor_liked.dart';
import 'models/bachelor_model.dart';

class BachelorList extends StatefulWidget {
  BachelorList({super.key});

  List<Bachelor> bachelorList = BachelorService().generateBachelors();

  @override
  _BachelorListState createState() => _BachelorListState();
}

class _BachelorListState extends State<BachelorList> {
  List<Bachelor> likedBachelors = [];

  void navigateToLikedList() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BachelorLiked(
                likedBachelors: likedBachelors,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("BachelorList"),
      ),
      body: ListView(
        children: widget.bachelorList.map((Bachelor bachelor) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 2.5),
            child: BachelorWidget(
              bachelor: bachelor,
              likedBachelors: likedBachelors,
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToLikedList,
        tooltip: 'Increment',
        child: const Icon(Icons.favorite_sharp),
      ),
    );
  }
}
