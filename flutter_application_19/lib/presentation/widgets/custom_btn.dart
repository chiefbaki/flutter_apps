import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/consts/app_fonts.dart';

class CustomBtn extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  final String title;
  const CustomBtn({super.key,required this.onPressed, required this.color,required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 135,
        height: 45,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              title,
              style: AppFonts.s18w400.copyWith(color: Colors.white),
            )));
  }
}
