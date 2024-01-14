import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/model/product_model.dart';

class ShoppingCardProvider extends ChangeNotifier {
  List<ProductModel> shoppingCardList = [];
  // double summ = 0;
  // double get totalSum => summ;
  double sum = 0;

  double sumOfproducts() {
    for (int i = 0; i < shoppingCardList.length; i++) {
      sum += double.parse(shoppingCardList[i].price);
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
    notifyListeners();
  }

  void removeCard(ProductModel el) {
  for (var el in shoppingCardList) {
      if (sum != 0 && el.quantity != 0) {
        shoppingCardList.firstWhere((element) => element.id == el.id).quantity--;
        sum -= double.parse(el.price);
      }
    }
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
