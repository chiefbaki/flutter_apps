import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_11/features/presentation/widgets/buttons/circular_btn.dart';
import 'package:flutter_application_11/features/providers/shoppingcard_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BagCards extends StatelessWidget {
  final String model;
  final String price;
  final String img;
  const BagCards({super.key, required this.price, required this.img, required this.model});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ShoppingCardProvider>();
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
              img,
              width: 178.w,
              height: 104.h,
              fit: BoxFit.cover,
            ),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model,
                style: AppFonts.s14w700,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "\$$price",
                style: AppFonts.s24w700,
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircularButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white, // Цвет иконки
                    ),
                  ),
                  SizedBox(
                    width: 17.h,
                  ),
                  Text(
                    "1",
                    style: AppFonts.s14w700,
                  ),
                  SizedBox(
                    width: 17.h,
                  ),
                  const CircularButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white, // Цвет иконки
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
