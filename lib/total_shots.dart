import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalShots extends ChangeNotifier {
  var totalShots = 0;
  final List<int> eachHoleScore = <int>[0,0,0,0,0,0,0,0,0];

  int get totalShotsPlayed {
    return totalShots;
  }

  add(int shotsInThisHole) {
    totalShots += shotsInThisHole;
    notifyListeners();
  }

  eachHoleResultUpdate(int holeNumber, int score){
    eachHoleScore[holeNumber - 1] = score;
  }
}

