import 'package:finder/models/bachelor_model.dart';
import 'package:flutter/material.dart';

import '../services/bachelor_service.dart';

class BachelorProvider extends ChangeNotifier {
  final List<Bachelor> _bachelorList = BachelorService().generateBachelors();
  final List<Bachelor> _bachelorLiked = [];

  List<Bachelor> get bachelors => List.unmodifiable(_bachelorList);
  List<Bachelor> get likedBachelors => List.unmodifiable(_bachelorLiked);

  void likeBachelor(Bachelor bachelor) {
    if (!likedBachelors.contains(bachelor)) {
      _bachelorLiked.add(bachelor);
    }
    notifyListeners();
  }

  void dislikeBachelor(Bachelor bachelor) {
    if (bachelors.contains(bachelor)) {
      _bachelorList.remove(bachelor);
    }
  }

  void toggleLike(Bachelor bachelor) {
    if (likedBachelors.contains(bachelor)) {
      _bachelorLiked.remove(bachelor);
    } else {
      _bachelorLiked.add(bachelor);
    }
    notifyListeners();
  }

  bool isLiked(Bachelor bachelor) {
    return likedBachelors.contains(bachelor);
  }
}
