import 'package:flutter/material.dart';

class ShoppingCardProvider extends ChangeNotifier {
  List<Map<String, dynamic>> shoppingCardList = [];

  void addCard(Map<String, dynamic> el){
    shoppingCardList.add(el);
    notifyListeners();
  }
  
  void clearList(){
    shoppingCardList.clear();
    notifyListeners();
  }
}