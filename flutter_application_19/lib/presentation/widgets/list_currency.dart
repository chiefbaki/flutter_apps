import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/consts/app_colors.dart';
import 'package:flutter_application_19/core/consts/app_fonts.dart';

class ListCurrency extends StatelessWidget {
  final Color color;
  final String name;
  final String shortName;
  final String price;
  final String percent;
  final String img;
  const ListCurrency(
      {super.key,
      required this.color,
      required this.name,
      required this.shortName,
      required this.price,
      required this.percent,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(img, width: 14, height: 14,),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          children: [
            Text(
              name,
              style: AppFonts.s16w400.copyWith(color: Colors.white),
            ),
            Text(
              shortName,
              style: AppFonts.s12w400.copyWith(color: AppColors.dartGrey),
            ),
          ],
        ),
        const SizedBox(
          width: 141,
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: AppFonts.s16w400.copyWith(color: Colors.white),
              ),
              Text(
                percent,
                style: AppFonts.s12w400.copyWith(color: AppColors.dartGrey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
