import 'package:flutter/material.dart';
import 'package:finder/widgets/bachelor_widget.dart';
import 'models/bachelor_model.dart';

class BachelorLiked extends StatefulWidget {
  const BachelorLiked({super.key, required this.likedBachelors});

  final List<Bachelor> likedBachelors;

  @override
  BachelorLikedState createState() => BachelorLikedState();
}

class BachelorLikedState extends State<BachelorLiked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("BachelorLiked"),
      ),
      body: Stack(
        children: [
          ListView(
            children: widget.likedBachelors.map((Bachelor bachelor) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 2.5),
                child: BachelorWidget(
                  bachelor: bachelor,
                  likedBachelors: widget.likedBachelors,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
