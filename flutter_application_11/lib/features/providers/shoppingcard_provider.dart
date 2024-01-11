import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/model/product_model.dart';

class ShoppingCardProvider extends ChangeNotifier {
  List<ProductModel> shoppingCardList = [];
  double sum = 0;

  void sumOfproducts(){
    
    for (int i = 0; i < shoppingCardList.length; i++) {
      sum += double.parse(shoppingCardList[i].price) * shoppingCardList[i].quantity;
    }
    notifyListeners();
  }

  int increaseProduct(ProductModel product){
    return product.quantity++;
    
  }

  void addCard(ProductModel el){
    shoppingCardList.add(el);
    notifyListeners();
  }

  void clearList() {
    shoppingCardList.clear();
    notifyListeners();
  }
}



