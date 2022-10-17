import 'dart:collection';

import 'package:flutter/material.dart';

class EachHoleScore extends ChangeNotifier {
  final Map<int, int> eachHoleScore = HashMap();
  var totalShots = 0;

  EachHoleScore() {
    for (var i = 1; i < 10; i++) {
      eachHoleScore.addAll({i: 0});
    }
  }

  Map<int, int> get eachHoleScoreResults {
    return eachHoleScore;
  }

  eachHoleResultUpdate(int holeNumber, int score) {
    eachHoleScore.update(holeNumber, (value) => score);
    updateTotal();
    notifyListeners();
  }

  updateTotal() {
    var values = eachHoleScore.values;
    totalShots = values.reduce((sum, element) => sum + element);
  }

  int get totalShotsPlayed {
    return totalShots;
  }
}
