import 'package:flutter/material.dart';

class ShoppingCardProvider extends ChangeNotifier {
  List<Map<String, List<dynamic>>> shoppingCardList = [];
  List<String> lst = [];

  // void addCard(Map<String, List<dynamic>> el){
  //   shoppingCardList.add(el);
  //   print(shoppingCardList);
  //   notifyListeners();
  // }
  int temp = 0;
  void addStr(String el){
    lst.add(el);
  }

  void clearList(){
    shoppingCardList.clear();
    notifyListeners();
  }
}