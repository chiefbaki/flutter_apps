import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/consts/app_colors.dart';

class CurrencyModel {
  final String name;
  final String img;
  final String shortName;
  final Color color;
  final String price;
  final String percent;
  CurrencyModel(
      {required this.name,
      required this.img,
      required this.shortName,
      required this.color,
      required this.price,
      required this.percent});
}


class CurrencyModelList {
  static final models = [
    CurrencyModel(name: "Bitcoin", img: "assets/imgs/Vector.png", shortName: "BTC", color: AppColors.orangeGradient, price: "47,412.65", percent: "+1.6%"),
    CurrencyModel(name: "Ripple", img: "assets/imgs/XRP.png", shortName: "XRP", color: AppColors.lightDark, price: "1.1184", percent: "-0.86%"),
    CurrencyModel(name: "Litecoin", img: "assets/imgs/LTC.png", shortName: "BTC", color: AppColors.darkBlue, price: "47,412.65", percent: "+1.6%"),
  ];
}