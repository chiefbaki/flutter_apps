import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_11/features/presentation/widgets/cards/bag_card.dart';
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
            SizedBox(
              height: 64.h,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 22, left: 22),
                child: Column(
                  children: [
                    BagCards(),
                    SizedBox(
                      height: 68.h,
                    ),
                    BagCards(),
                    SizedBox(
                      height: 68.h,
                    ),
                    BagCards()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
