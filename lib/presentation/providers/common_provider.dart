import 'package:flutter/foundation.dart';

class CommonProvider with ChangeNotifier {
  // -----------------------------------
  // Variables
  // -----------------------------------
  int _bottomNavIndex = 0;

  // -----------------------------------
  // Getters
  // -----------------------------------
  int get bottomNavIndex => _bottomNavIndex;

  // -----------------------------------
  // Functions
  // -----------------------------------
  void updateBottomIndex({required int index}) {
    _bottomNavIndex = index;
    notifyListeners();
  }
}
