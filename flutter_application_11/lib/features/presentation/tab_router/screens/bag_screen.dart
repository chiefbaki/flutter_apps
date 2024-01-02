import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_11/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 72),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: SvgPicture.asset(Images.iconSeta)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Bag",
                        style: AppFonts.s36w700,
                      ),
                      Text(
                        "Total 3 items",
                        style: AppFonts.s16w700,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            const Divider(),
            Padding(
                padding: const EdgeInsets.only(right: 22, left: 22),
                child: Column(
                  children: [cards(), cards(), cards()],
                ))
          ],
        ),
      ),
    );
  }
}

Widget cards() {
  return Row(
    children: [
      Stack(
        children: [
          Positioned(
            top: 70,
            bottom: 20,
            left: 20,
            child: Container(
              width: 126.w,
              height: 119.h,
              decoration: BoxDecoration(
                  color: AppColors.bagCardColor,
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(
            width: 200.w,
            height: 200.h,
            child: Image.asset(
              Images.rectangle13,
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "AIR JORDAN 5 LANEY JSP",
            style: AppFonts.s14w700,
          ),
          Text("190.00", style: AppFonts.s24w700,)
        ],
      ),
    ],
  );
}
