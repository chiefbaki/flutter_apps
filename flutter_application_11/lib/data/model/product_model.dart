import 'package:flutter_application_11/resources/resources.dart';

class ProductModel{
  final String name;
  final String model;
  final String price;
  final String img;
  const ProductModel({required this.name, required this.model, required this.price, required this.img});
}

class ProductModelList{
  List<ProductModel> models = [
    ProductModel(name: "Nike", model: "epic-react".toUpperCase(), price: "130.00", img: Images.tenisEpicReact),
    ProductModel(name: "Nike", model: "air-max".toUpperCase(), price: "170.00", img: Images.tenisEpicReact1),
    ProductModel(name: "Nike", model: "air-max".toUpperCase(), price: "250.00", img: Images.tenisEpicReact2),
    ProductModel(name: "Nike", model: "AIR JORDAN 5 LANEY JSP".toUpperCase(), price: "190.00", img: Images.rectangle13),
    ProductModel(name: "Nike", model: "HUSTLE-D-9-FLYEASE".toUpperCase(), price: "130.00", img: Images.rectangle2),
    ProductModel(name: "Nike", model: "AIR-MAX-270-BIG-KIDS".toUpperCase(), price: "190.00", img: Images.rectangle6),
    ProductModel(name: "Nike", model: "air-force".toUpperCase(), price: "170.00", img: Images.rectangle7),
    ProductModel(name: "Nike", model: "air-force".toUpperCase(), price: "170.00", img: Images.image8),
  ];
}