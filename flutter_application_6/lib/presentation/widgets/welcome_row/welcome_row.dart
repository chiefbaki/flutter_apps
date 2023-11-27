import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/theme/app_imgs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeRow extends StatefulWidget {
  const WelcomeRow({super.key});

  @override
  State<WelcomeRow> createState() => _WelcomeRowState();
}

class _WelcomeRowState extends State<WelcomeRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WelcomeRowItem(img: AppImgs.welcomeIcon1, text: "Записывайтесь на прием к самым лучшим специалистам"),
        SizedBox(
          height: 15.h,
        ),
        WelcomeRowItem(img: AppImgs.welcomeIcon2, text: "Сохраняйте результаты ваших анализов, диагнозы и рекомендации от врачей в собственную библиотеку"),
        SizedBox(
          height: 15.h,
        ),
        WelcomeRowItem(img: AppImgs.welcomeIcon3, text: "Просматривайте отзывы о врачах и дополняйте собственными комментариями"),
        SizedBox(
          height: 15.h,
        ),
        WelcomeRowItem(img: AppImgs.welcomeIcon4, text: "Получайте уведомления о приеме или о поступивших сообщениях"),
      ],
    );
  }
}

class WelcomeRowItem extends StatefulWidget {
  final String img;
  final String text;
  const WelcomeRowItem({super.key, required this.img, required this.text});

  @override
  State<WelcomeRowItem> createState() => _WelcomeRowItemState();
}

class _WelcomeRowItemState extends State<WelcomeRowItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          SizedBox(
            height: 24.h,
            child: Image.asset(widget.img)),
            SizedBox(
              width: 20.w,
            ),
          Flexible(child: Text(widget.text, style: AppFonts.s15w400,)),
        ],
      ),
    );
  }
}