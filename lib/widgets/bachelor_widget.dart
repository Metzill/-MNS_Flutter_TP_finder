import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bachelor_detail.dart';
import '../models/bachelor_model.dart';

import '../provider/bachelor_provider.dart';

class BachelorWidget extends StatefulWidget {
  const BachelorWidget(
      {super.key, required this.bachelor, required this.likedBachelors});

  final Bachelor bachelor;
  final List<Bachelor> likedBachelors;

  @override
  State<BachelorWidget> createState() => _BachelorState();
}

class _BachelorState extends State<BachelorWidget> {
  int randomColorId = Random().nextInt(18);

  Color generateColor() {
    // return Colors.primaries[randomColorId];
    return const Color.fromARGB(50, 252, 174, 191);
  }

  void navigateToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BachelorDetail(
                bachelor: widget.bachelor,
                color: generateColor(),
              )),
    );

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BachelorProvider>(builder: (context, bachelorProvider, _) {
      return ListTile(
        title: Text("${widget.bachelor.firstname} ${widget.bachelor.lastname}"),
        leading: Image(
          image: AssetImage(widget.bachelor.avatar),
        ),
        trailing: bachelorProvider.likedBachelors.contains(widget.bachelor)
            ? const Icon(
                Icons.favorite,
                color: Colors.redAccent,
              )
            : null,
        tileColor: generateColor(),
        onTap: navigateToDetails,
        contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      );
    });
  }
}
