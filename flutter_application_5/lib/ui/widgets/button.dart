import 'package:flutter/material.dart';
import 'package:flutter_application_5/ui/theme/app_colors.dart';
import 'package:flutter_application_5/ui/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor:
                MaterialStatePropertyAll<Color>(AppColors.buttonLogInColor)),
        onPressed: () {},
        child: Text(
          "Log in",
          style: AppFonts.s20w700.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
