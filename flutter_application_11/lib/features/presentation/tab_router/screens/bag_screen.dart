import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_11/features/presentation/widgets/cards/bag_card.dart';
import 'package:flutter_application_11/features/providers/shoppingcard_provider.dart';
import 'package:flutter_application_11/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ShoppingCardProvider>(context);
    num sum = 0;
    for(int i = 0; i < vm.shoppingCardList.length; i++){
      sum += double.parse(vm.shoppingCardList[i][2]);
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
                      "${vm.shoppingCardList.length.toString()} items",
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
            height: 44.h,
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: ListView.builder(itemCount: vm.shoppingCardList.length, itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: BagCards(model: vm.shoppingCardList[index][1], price: vm.shoppingCardList[index][2], img: vm.shoppingCardList[index][3],),
                );
              }), 
            ),
          ),
          SizedBox(
            height: 150.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: AppFonts.s16w700,
                      ),
                      Text(
                        "\$${sum.toString()}",
                        style: AppFonts.s16w700,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 29.h,
                  ),
                  Center(
                      child: ElevatedButton(
                    onPressed: () {
                      print(sum);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.pinkColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 145, vertical: 15),
                      child: Text(
                        "Buy",
                        style: AppFonts.s14w700,
                      ),
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
