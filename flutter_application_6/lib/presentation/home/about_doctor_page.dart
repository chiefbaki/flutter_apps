import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/home/about_doctor_tab.dart/about_page.dart';
import 'package:flutter_application_6/presentation/home/about_doctor_tab.dart/feedback_page.dart';
import 'package:flutter_application_6/presentation/home/about_doctor_tab.dart/location_screen.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/button/leading_btn.dart';
import 'package:flutter_application_6/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:star_rating/star_rating.dart';

class AboutDoctor extends StatelessWidget {
  final String name;
  final String specialty;
  final double raiting;
  final String info;
  final String img;
  final String phoneNumber;
  final String address;
  final String email;
  final String imgFeedback;
  final String feedbackText;
  final String date;
  final String feedbackName;
  const AboutDoctor(
      {super.key,
      required this.name,
      required this.specialty,
      required this.raiting,
      required this.info,
      required this.img,
      required this.phoneNumber,
      required this.address,
      required this.email,
      required this.imgFeedback,
      required this.feedbackText,
      required this.date, required this.feedbackName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: AppFonts.s17w600.copyWith(color: AppColors.fontColor),
        ),
        leading: LeadingBtn(
          onpressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.h,
            color: AppColors.arrowColor.withOpacity(0.75),
          ),
        ),
        elevation: 0.5,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_border_outlined,
                size: 24,
                color: Colors.black,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            CircleAvatar(
              radius: 50.r,
              child: Image.asset(img),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11),
              child: Text(
                name,
                style: AppFonts.s22w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                specialty,
                style: AppFonts.s18w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StarRating(
                  between: 24,
                  starSize: 24,
                  length: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  color: const Color(0xffFC9E4F),
                  rating: raiting,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  raiting.toString(),
                  style: AppFonts.s18w400.copyWith(color: AppColors.starColor),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                          indicatorColor: AppColors.indicatorColor,
                          indicatorWeight: 3.0,
                          unselectedLabelColor: const Color(0xff4683D6),
                          labelColor: AppColors.btnColor,
                          tabs: [
                            Tab(
                              icon: SvgPicture.asset(AppImg.userPin),
                              text: "О докторе",
                            ),
                            Tab(
                              icon: SvgPicture.asset(AppImg.location),
                              text: "Контакты",
                            ),
                            Tab(
                              icon: SvgPicture.asset(AppImg.details),
                              text: "Отзывы",
                            ),
                          ]),
                      Expanded(
                        child: TabBarView(children: [
                          About(about: info),
                          LocationScreen(
                            phone: phoneNumber,
                            email: email,
                            address: address,
                          ),
                          FeedBackPage(feedbackImg: imgFeedback, feedbackName: feedbackName, feedbackText: feedbackText, feedbackDate: date,)
                        ]),
                      )
                    ],
                  )),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Записаться на прием"))
          ],
        ),
      ),
    );
  }
}
