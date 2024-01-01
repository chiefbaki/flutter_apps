import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/routes/app_router.gr.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 72),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  context.router.popUntil((route) => route.settings.name == HomeRoute.page); 
                }, icon: SvgPicture.asset(Images.iconSeta)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Bag", style: AppFonts.s36w700,),
                    Text("Total 3 items", style: AppFonts.s16w700,),
                  ],
                ),
                
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.h,
            decoration: BoxDecoration(
              color: Colors.red
            ),
          )
        ],
      ),
    );
  }
}