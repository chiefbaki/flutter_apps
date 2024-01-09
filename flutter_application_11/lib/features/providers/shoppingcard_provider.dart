import 'package:flutter/material.dart';

class ShoppingCardProvider extends ChangeNotifier {
  List<List<dynamic>> shoppingCardList = [];
  double sum = 0;

  void addCard(List<dynamic> el) {
    shoppingCardList.add(el);
    print(shoppingCardList);
    notifyListeners();
  }

  double sumOfproducts(){
    for (int i = 0; i < shoppingCardList.length; i++) {
      sum += double.parse(shoppingCardList[i][2]);
    }
    return sum;
  }

  void clearList() {
    shoppingCardList.clear();
    notifyListeners();
  }
}
