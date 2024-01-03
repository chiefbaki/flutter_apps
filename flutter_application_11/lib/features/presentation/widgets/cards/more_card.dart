import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_11/features/presentation/widgets/buttons/favorite_btn.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: SizedBox(
                        height: 20.h,
                        child: ElevatedButton(
                            onPressed: () {
                              print("work");
                            },
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
          Positioned(top: 20, child: Image.asset(widget.img, width: 156, height: 111,))
        ]),
      ),
    );
  }
}


class MyInh extends InheritedWidget {
  const MyInh({super.key, required this.child}) : super(child: child);

  final Widget child;

  static MyInh? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInh>();
  }

  @override
  bool updateShouldNotify(MyInh oldWidget) {
    return true;
  }
}