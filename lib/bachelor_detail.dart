import 'package:finder/models/gender.dart';
import 'package:finder/provider/bachelor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/bachelor_model.dart';

class BachelorDetail extends StatefulWidget {
  const BachelorDetail({
    super.key,
    required this.bachelor,
    required this.color,
  });

  final Bachelor bachelor;
  final Color color;

  @override
  BachelorDetailState createState() => BachelorDetailState();
}

class BachelorDetailState extends State<BachelorDetail> {
  Row getSearchForImg() {
    if (widget.bachelor.searchFor!.contains(Gender.male) &&
        widget.bachelor.searchFor!.contains(Gender.female)) {
      return const Row(
        children: [
          Icon(
            Icons.male,
            color: Colors.lightBlue,
          ),
          Icon(
            Icons.female,
            color: Colors.pinkAccent,
          ),
        ],
      );
    } else if (widget.bachelor.searchFor!.contains(Gender.male)) {
      return const Row(
        children: [
          Icon(
            Icons.male,
            color: Colors.lightBlue,
          ),
        ],
      );
    }
    return const Row(
      children: [
        Icon(
          Icons.female,
          color: Colors.pinkAccent,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BachelorProvider>(
      builder: (context, bachelorProvider, _) {
        final isLiked =
            bachelorProvider.likedBachelors.contains(widget.bachelor);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(
                "${widget.bachelor.firstname} ${widget.bachelor.lastname}"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Stack(
                          children: [
                            Image(image: AssetImage(widget.bachelor.avatar)),
                            Visibility(
                              // visible: _isLiked,
                              child: Positioned.fill(
                                  child: Opacity(
                                opacity: isLiked ? 1 : 0.75,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Icon(
                                    Icons.favorite,
                                    color: isLiked
                                        ? Colors.red
                                        : const Color.fromRGBO(
                                            252, 174, 191, 0.75),
                                    size: 100,
                                  ),
                                ),
                              )),
                            ),
                          ],
                        ))),
                const Divider(
                  height: 50.0,
                  thickness: 3.5,
                  indent: 25.0,
                  endIndent: 25.0,
                  color: Color.fromARGB(127, 158, 158, 158),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text("Recherche: "),
                            getSearchForImg(),
                          ],
                        ),
                        Text(
                          "Job: ${widget.bachelor.job}",
                        ),
                        Text(
                          "Description: ${widget.bachelor.description}",
                        ),
                        const Divider(
                          height: 50.0,
                          thickness: 3.5,
                          color: Color.fromARGB(127, 158, 158, 158),
                        ),
                        Center(
                          child: IconButton(
                            onPressed: () {
                              bachelorProvider.toggleLike(widget.bachelor);
                              SnackBar snackBar = SnackBar(
                                  content: Text(
                                      "Vous avez liké le profil de ${widget.bachelor.firstname}"));
                              if (isLiked == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isLiked
                                  ? Colors.red
                                  : const Color.fromRGBO(252, 174, 191, 1),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          backgroundColor: widget.color,
        );
      },
    );
  }
}
