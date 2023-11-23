import 'package:flutter/material.dart';
import 'package:flutter_application_4/ui/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_fonts.dart';

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
      height: 48.h,
      child: ElevatedButton(
        onPressed: () {
          
        },
        child: Text("Get location", style: AppFonts.s16w500,),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.deepBlue,
        ),
      ),
    );
  }
}
