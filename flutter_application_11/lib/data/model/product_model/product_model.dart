import 'package:flutter_application_11/resources/resources.dart';

class ProductModel {
  final String name;
  final String model;
  final String price;
  final String img;
  int quantity;
  final int id;
  ProductModel(
      {required this.name,
      required this.model,
      required this.price,
      required this.img,
      required this.quantity, required this.id});
}

class ProductModelList {
  List<ProductModel> models = [
    ProductModel(
        name: "Nike",
        model: "epic-react".toUpperCase(),
        price: "130.00",
        img: Images.tenisEpicReact,
        quantity: 1,
        id: 0),
    ProductModel(
        name: "Adidas",
        model: "air-max".toUpperCase(),
        price: "170.00",
        img: Images.tenisEpicReact1,
        quantity: 1,
        id: 1),
    ProductModel(
        name: "Puma",
        model: "air-max".toUpperCase(),
        price: "250.00",
        img: Images.tenisEpicReact2,
        quantity: 1,
        id: 2),
    ProductModel(
        name: "Venum",
        model: "AIR JORDAN 5 LANEY JSP".toUpperCase(),
        price: "190.00",
        img: Images.rectangle13,
        quantity: 1,
        id: 3),
    ProductModel(
        name: "Under Armor",
        model: "HUSTLE-D-9-FLYEASE".toUpperCase(),
        price: "130.00",
        img: Images.rectangle2,
        quantity: 1,
        id: 4),
    ProductModel(
        name: "Lining",
        model: "AIR-MAX-270-BIG-KIDS".toUpperCase(),
        price: "190.00",
        img: Images.rectangle6,
        quantity: 1,
        id: 5),
    ProductModel(
        name: "Nike",
        model: "air-force".toUpperCase(),
        price: "170.00",
        img: Images.rectangle7,
        quantity: 1,
        id: 6),
    ProductModel(
        name: "Zara",
        model: "air-force".toUpperCase(),
        price: "170.00",
        img: Images.image8,
        quantity: 1,
        id: 7),
  ];

  List<ProductModel> modelsMore = [
    ProductModel(
        name: "Nike",
        model: "air-max".toUpperCase(),
        price: "170.00",
        img: Images.tenisEpicReact1,
        quantity: 1,
        id: 0),
    ProductModel(
        name: "Nike",
        model: "air-force".toUpperCase(),
        price: "170.00",
        img: Images.image8,
        quantity: 1,
        id: 1),
  ];
}
