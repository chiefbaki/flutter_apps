import 'package:flutter/material.dart';
import 'package:flutter_application_4/ui/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_fonts.dart';

class Button extends StatefulWidget {
  final Function() onPressed;
  const Button({super.key, required this.onPressed});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text("Get location", style: AppFonts.s16w500,),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.deepBlue,
        ),
      ),
    );
  }
}
