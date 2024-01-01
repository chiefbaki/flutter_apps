import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_11/features/presentation/widgets/favorite_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreCard extends StatefulWidget {
  final String img;
  final String name;
  final String price;
  const MoreCard({super.key, required this.img, required this.name, required this.price});

  @override
  State<MoreCard> createState() => _MoreCardState();
}

class _MoreCardState extends State<MoreCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172.w,
      height: 192.h,
      decoration: BoxDecoration(
          color: Colors.white,
           borderRadius: BorderRadius.circular(9)),
      child: Center(
        child: Stack(children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: SizedBox(
                      height: 20.h,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.pinkColor),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "New",
                              style: TextStyle(fontSize: 10),
                            ),
                          )),
                    ),
                  ),
                  const FavouriteBtn(),
                ],
              ),
              SizedBox(
                height: 62.h,
              ),
              Text(
                widget.name,
                style: AppFonts.s9w700,
              ),
              Text(
                "\$${widget.price}",
                style: AppFonts.s9w700,
              ),
            ],
          ),
          Positioned(child: Image.asset(widget.img))
        ]),
      ),
    );
  }
}
