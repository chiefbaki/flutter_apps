import 'package:flutter/material.dart';

class ShoppingCardProvider extends ChangeNotifier {
  List<List<dynamic>> shoppingCardList = [];
  Set<String> u = {};

  void addCard(List<dynamic> el) {
    shoppingCardList.add(el);
    print(shoppingCardList);
    notifyListeners();
  }

  void clearList() {
    shoppingCardList.clear();
    notifyListeners();
  }
}
