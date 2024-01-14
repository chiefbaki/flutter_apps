import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/model/product_model.dart';

class ShoppingCardProvider extends ChangeNotifier {
  List<ProductModel> shoppingCardList = [];
  // double get totalSum => sum;
  double summ = 0;

  double sumOfproducts() {
    double sum = 0;
    for (int i = 0; i < shoppingCardList.length; i++) {
      sum += double.parse(shoppingCardList[i].price) * shoppingCardList[i].quantity;
    }
    return sum;
  }

  void addCard(ProductModel el) {
    bool productExist = shoppingCardList.any((element) => element.id == el.id);
    if (productExist) {
      shoppingCardList.firstWhere((element) => element.id == el.id).quantity++;
    } else {
      shoppingCardList.add(el);
    }
    summ = sumOfproducts();
    notifyListeners();
  }

  void removeCard(ProductModel el) {
    bool productExist = shoppingCardList.any((element) => element.id == el.id);
    if (productExist) {
      var existProduct = shoppingCardList.firstWhere((element) => element.id == el.id);
      if (existProduct.quantity > 1) {
        existProduct.quantity--;
        summ -= double.parse(el.price); 
      }else{
        shoppingCardList.remove(existProduct);
        summ -= double.parse(el.price); 
      }
    }
    print(shoppingCardList);
    notifyListeners();
  }

  void clearList() {
    shoppingCardList.clear();
    notifyListeners();
  }

  // void getTotalSumm() {
  //   for (var i in shoppingCardList) {
  //     summ += double.parse(i.price) * i.quantity;
  //   }
  //   notifyListeners();
  // }
}
