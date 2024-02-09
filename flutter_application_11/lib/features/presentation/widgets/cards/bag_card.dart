import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/model/product_model/product_model.dart';
import 'package:flutter_application_11/core/theme/app_colors.dart';
import 'package:flutter_application_11/core/theme/app_fonts.dart';
import 'package:flutter_application_11/features/providers/changetheme_provider.dart';
import 'package:flutter_application_11/features/providers/shoppingcard_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BagCards extends StatefulWidget {
  final String name;
  final String model;
  final String price;
  final String img;
  final int quantity;
  final int id;
  const BagCards(
      {super.key,
      required this.price,
      required this.img,
      required this.model,
      required this.quantity,
      required this.name,
      required this.id});

  @override
  State<BagCards> createState() => _BagCardsState();
}

class _BagCardsState extends State<BagCards> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ShoppingCardProvider>(context);
    final changeTheme = Provider.of<ChangeThemeProvider>(context);
    final ProductModel model = ProductModel(
        name: widget.name,
        model: widget.model,
        price: widget.price,
        img: widget.img,
        quantity: widget.quantity,
        id: widget.id);
    return SizedBox(
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              width: 116.w,
              height: 109.h,
              decoration: BoxDecoration(
                  color: AppColors.bagCardColor,
                  borderRadius: BorderRadius.circular(30)),
            ),
            Image.asset(
              widget.img,
              width: 178.w,
              height: 104.h,
              fit: BoxFit.cover,
            ),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model,
                style: AppFonts.s14w700,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "\$${widget.price}",
                style: AppFonts.s24w700,
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      vm.removeCard(model);
                      print("work");
                    },
                    child: Container(
                      width: 28.0,
                      height: 28.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            changeTheme.changeThemeBtn(), // Цвет круглой кнопки
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.remove,
                        color: Color(0xff363636),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 17.h,
                  ),
                  Text(
                    model.quantity.toString(),
                    style: AppFonts.s14w700,
                  ),
                  SizedBox(
                    width: 17.h,
                  ),
                  InkWell(
                    onTap: () {
                      vm.sumOfproducts();
                      vm.addCard(model);
                      print("work");
                    },
                    child: Container(
                      width: 28.0,
                      height: 28.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            changeTheme.changeThemeBtn(), // Цвет круглой кнопки
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.add,
                        color: Color(0xff363636),
                      )),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
