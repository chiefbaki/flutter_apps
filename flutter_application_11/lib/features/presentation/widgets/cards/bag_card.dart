import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_11/features/presentation/widgets/buttons/circular_btn.dart';
import 'package:flutter_application_11/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BagCards extends StatelessWidget {
  const BagCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
               Images.tenisEpicReact2,
               width: 178.w,
               height: 104.h,
               fit: BoxFit.cover,
             ),
          ]),
          BagInfo(),
        ],
      ),
    );
  }

  Column BagInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "AIR JORDAN 5 LANEY JSP",
          style: AppFonts.s14w700,
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "190.00",
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
    );
  }
}
