import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/model/product_model/product_model.dart';
import 'package:flutter_application_11/core/theme/app_fonts.dart';
import 'package:flutter_application_11/features/providers/shoppingcard_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Cards extends StatefulWidget {
  final String name;
  final String model;
  final String price;
  final String img;
  final Color color;
  final int currentIndexList;
  final int id;
  const Cards(
      {super.key,
      required this.name,
      required this.model,
      required this.price,
      required this.img,
      required this.color,
      required this.currentIndexList,
      required this.id});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool isSelected = true;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final vm = Provider.of<ShoppingCardProvider>(context, listen: false);
      return Stack(children: [
        Container(
          width: 242.w,
          height: 343.h,
          decoration: BoxDecoration(
              color: widget.color, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: AppFonts.s20w400.copyWith(color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            isSelected = !isSelected;
                            setState(() {});
                          },
                          icon: isSelected
                              ? const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.white,
                                )),
                    ],
                  ),
                  Text(
                    widget.model,
                    style: AppFonts.s24w700.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    widget.price,
                    style: AppFonts.s16w400.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 100,
          ),
          child: Image.asset(
            widget.img,
            width: 325.w,
            height: 190.h,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            right: 100,
            bottom: 31,
            child: IconButton(
                onPressed: () {
                  // vm.addCard(
                  //   [widget.name, widget.model, widget.price, widget.img]
                  // );
                  vm.addCard(ProductModel(name: widget.name, model: widget.model, price: widget.price, img: widget.img, quantity: 1, id: widget.id));
                  print(vm.shoppingCardList);
                  print("work");
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )))
      ]);
    });
  }
}
