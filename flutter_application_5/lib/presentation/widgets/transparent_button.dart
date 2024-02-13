import 'package:flutter/material.dart';
import 'package:flutter_application_5/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransparentButton extends StatefulWidget {
  final String textButton;
  final String icon;
  const TransparentButton(
      {super.key, required this.textButton, required this.icon});

  @override
  State<TransparentButton> createState() => _TransparentButtonState();
}

class _TransparentButtonState extends State<TransparentButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            side: MaterialStateProperty.resolveWith<BorderSide>(
                (states) => const BorderSide(color: Colors.black, width: 2.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              widget.icon,
              width: 35.w,
              height: 35.h,
            ),
            Text(
              widget.textButton,
              style: AppFonts.s16w400
                  .copyWith(color: Colors.black, fontFamily: "Imprima"),
            ),
          ],
        ),
      ),
    );
  }
}
