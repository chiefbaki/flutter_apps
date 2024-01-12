import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/model/product_model.dart';

class ShoppingCardProvider extends ChangeNotifier {
  List<ProductModel> shoppingCardList = [];
  double sum = 0;

  double sumOfproducts(){
    
    for (int i = 0; i < shoppingCardList.length; i++) {
      sum += double.parse(shoppingCardList[i].price);
    }
    return sum;
  }

  void increaseProduct(ProductModel product){
    product.quantity++;
    notifyListeners();
  }

  void addCard(ProductModel el){
    shoppingCardList.add(el);
    notifyListeners();
  }

  void clearList() {
    shoppingCardList.clear();
    notifyListeners();
  }
  double getTotalSumm(){
    double summ = 0;

    for(var i in shoppingCardList){

      summ+= double.parse(i.price);
    }

    return summ;
  }
}



