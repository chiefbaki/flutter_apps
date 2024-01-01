import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_11/features/presentation/widgets/rotated_btn.dart';
import 'package:flutter_application_11/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> nameProducts = ["Nike", "Adidas", "Jordan", "Puma", "Reebok"];
  int selectedIndex = 0;
  String selectedElement = '';
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 78.h,
              ),
              Row(
                children: [
                  Text(
                    "Discover",
                    style: AppFonts.s36w700.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    width: 130.w,
                  ),
                  CircleAvatar(
                      radius: 18.r,
                      backgroundColor: AppColors.circleColor,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search_outlined,
                            color: Colors.black,
                          ))),
                  SizedBox(
                    width: 6.6.w,
                  ),
                  CircleAvatar(
                    radius: 19.r,
                    backgroundColor: AppColors.circleColor,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 42.h,
              ),
              SizedBox(
                height: 40.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: nameProducts.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                        onPressed: () {
                          selectedElement = nameProducts[index];
                          setState(() {});
                        },
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Text(
                            nameProducts[index],
                            style: AppFonts.s20w700.copyWith(
                                color: selectedElement == nameProducts[index]
                                    ? Colors.black
                                    : Colors.grey),
                          ),
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 40.w,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 39.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      RotatedBtn(onPressed: () {}, text: "Upcoming"),
                      SizedBox(
                        height: 43.h,
                      ),
                      RotatedBtn(onPressed: () {}, text: "Featured"),
                      SizedBox(
                        height: 43.h,
                      ),
                      RotatedBtn(onPressed: () {}, text: "New")
                    ],
                  ),
                  Stack(children: [
                    Container(
                      width: 242.w,
                      height: 343.h,
                      decoration: BoxDecoration(
                          color: AppColors.cardColors[0],
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 10),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nike",
                                    style: AppFonts.s20w400
                                        .copyWith(color: Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        isSelected = !isSelected;
                                        setState(() {});
                                      },
                                      icon: isSelected
                                          ? Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.favorite_rounded,
                                              color: Colors.white,
                                            )),
                                ],
                              ),
                              Text(
                                "EPIC-REACT",
                                style: AppFonts.s24w700
                                    .copyWith(color: Colors.white),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "130.00",
                                style: AppFonts.s16w400
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -100,
                      child: SizedBox(
                        child: Image.asset(
                          Images.tenisEpicReact,
                          width: 290.w,
                          height: 190.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
