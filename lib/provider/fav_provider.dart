import 'package:flutter/cupertino.dart';

class FavProvider with ChangeNotifier {
  final List _fastFood = ["Pizza", "Pasta", "Burger", "Ice cream", "Sushi"];

  List get fastFood => _fastFood;
  final List _emptyList = [];
  List get emptyList => _emptyList;

  void addItems(int index) {
    _emptyList.add(index);
    notifyListeners();
  }

  void removeItems(int index) {
    _emptyList.remove(index);
    notifyListeners();
  }
}
