import 'package:flutter/material.dart';

class TotalShots extends ChangeNotifier {
  add(int shotsInThisHole) {
    //totalShots += shotsInThisHole;
    notifyListeners();
  }
}
